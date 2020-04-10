import h5py
import numpy as np
import os.path
import random
import matplotlib.pyplot as plt
import math
import tensorflow as tf

class DataGenerator(tf.keras.utils.Sequence):
    'Generates data for Keras'
    def __init__(self, 
                x_set, 
                y_set,
                batch_size=4, 
                shuffle=True, 
                multi_class=True):

        self.x_set = x_set
        self.y_set = y_set
        self.x = os.listdir(x_set) 
        self.y = os.listdir(y_set)
        self.batch_size = batch_size
        self.shuffle = shuffle
        self.multi_class = multi_class
        self.idx_list = np.arange(start=1, stop=len(self.x)+1)
        
    def __len__(self):
        return math.ceil(len(self.x) / self.batch_size)

    def __getitem__(self, idx):
        
        indexes = self.idx_list[idx*self.batch_size:(idx+1)*self.batch_size]
        # generate data
        X, y = self.data_generator(indexes)

        return X, y

    def on_epoch_end(self):
        if self.shuffle == True:
            random.shuffle(self.idx_list)

    def data_generator(self, indexes):
        
        # Initialization
        X = np.empty((self.batch_size, 288, 288, 1))
        
        if self.multi_class:
            Y = np.empty((self.batch_size, 288,288, 7))
        else:
            Y = np.empty((self.batch_size, 288,288, 1))

        for i, idx in enumerate(indexes):

            img = np.load(self.x_set + 'img_' + str(idx) + '.npy')
            X[i,:] = img

            seg = np.load(self.y_set + 'img_' + str(idx) + '.npy')

            if self.multi_class:
                seg = self._get_multiclass(seg)
            else:
                seg = np.sum(seg, axis=2)
                seg = np.expand_dims(seg, axis=2)
                seg[seg != 0] = 1

            Y[i,:] = seg

        return X, Y

    def _get_multiclass(self, label):
        #label shape
        #(height,width,channels)
        
        height = label.shape[0]
        width = label.shape[1]
        channels = label.shape[2]

        background = np.zeros((height, width, 1))
        label_sum = np.sum(label, axis=2)
        background[label_sum == 0] = 1
                    
        label = np.concatenate((label, background), axis = 2)
        
        return label 

def get_multiclass(label):

    #label shape
    #(batch_size, height,width,channels)
    
    batch_size = label.shape[0]
    height = label.shape[1]
    width = label.shape[2]
    channels = label.shape[3]

    background = np.zeros((batch_size, height, width, 1))
    label_sum = np.sum(label, axis=3)
    background[label_sum == 0] = 1
                
    label = np.concatenate((label, background), axis = 3)
    
    return label 

def _bytes_feature(value):
  """Returns a bytes_list from a string / byte."""
  if isinstance(value, type(tf.constant(0))):
    value = value.numpy() # BytesList won't unpack a string from an EagerTensor.
  return tf.train.Feature(bytes_list=tf.train.BytesList(value=[value]))

def _float_feature(value):
  """Returns a float_list from a float / double."""
  return tf.train.Feature(float_list=tf.train.FloatList(value=[value]))

def _int64_feature(value):
  """Returns an int64_list from a bool / enum / int / uint."""
  return tf.train.Feature(int64_list=tf.train.Int64List(value=[value]))        

def create_OAI_2D_dataset(data_folder, tfrecord_directory, get_train=True):
    
    start = 1
    if get_train:
      end = 61
    else:
      end = 15
    
    count = 1
    num_shards = (end-1)*2

    for i in range(start,end):
        for j in range(2):
            if i <= 9:
                if get_train:
                    fname_img = 'train_00{}_V0{}.im'.format(i, j)
                    fname_seg = 'train_00{}_V0{}.seg'.format(i, j)
                else:
                    fname_img = 'valid_00{}_V0{}.im'.format(i, j)
                    fname_seg = 'valid_00{}_V0{}.seg'.format(i, j)
            else:
                if get_train:
                    fname_img = 'train_0{}_V0{}.im'.format(i, j)
                    fname_seg = 'train_0{}_V0{}.seg'.format(i, j)
                else:
                    fname_img = 'valid_0{}_V0{}.im'.format(i, j)
                    fname_seg = 'valid_0{}_V0{}.seg'.format(i, j)
            
            img_filepath = os.path.join(data_folder, fname_img)
            seg_filepath = os.path.join(data_folder, fname_seg)

            with h5py.File(img_filepath,'r') as hf:
                img = np.array(hf['data'])
            with h5py.File(seg_filepath,'r') as hf:
                seg = np.array(hf['data'])
            
            img = np.rollaxis(img, 2, 0)
            seg = np.rollaxis(seg, 2, 0) 
            
            img = img[:,48:336,48:336]
            seg = seg[:,48:336,48:336,:]
            
            seg_temp = np.zeros((160,288,288,1),dtype=np.int8)
            seg_sum = np.sum(seg, axis=3)
            seg_temp[seg_sum == 0] = 1
            seg = np.concatenate([seg,seg_temp], axis=3)
            img = np.expand_dims(img, axis=3) 

            shard_dir = '{0:03}-of-{1}.tfrecords'.format(count, num_shards)
            tfrecord_filename = os.path.join(tfrecord_directory, shard_dir)

            with tf.io.TFRecordWriter(tfrecord_filename) as writer:   
              for k in range(len(img)):
                img_slice = img[k,:,:,:]
                seg_slice = seg[k,:,:,:]
                
                img_raw = img_slice.tostring()
                seg_raw = seg_slice.tostring()

                height = img_slice.shape[0]
                width = img_slice.shape[1]
                num_channels = seg_slice.shape[2]

                feature = {
                    'height': _int64_feature(height),
                    'width': _int64_feature(width),
                    'num_channels': _int64_feature(num_channels),
                    'image_raw': _bytes_feature(img_raw),
                    'label_raw': _bytes_feature(seg_raw)
                }
                example = tf.train.Example(features=tf.train.Features(feature=feature))
                writer.write(example.SerializeToString())
            
            count += 1 
        print('{} out of {} datasets have been processed'.format(i,end-1))

def _parse_fn(example_proto):

    features = {
        'height': tf.io.FixedLenFeature([],tf.int64),
        'width': tf.io.FixedLenFeature([], tf.int64),
        'num_channels': tf.io.FixedLenFeature([],tf.int64),
        'image_raw': tf.io.FixedLenFeature([], tf.string),
        'label_raw': tf.io.FixedLenFeature([], tf.string)
    }

    # Parse the input tf.Example proto using the dictionary above.
    image_features = tf.io.parse_single_example(example_proto, features)
    image_raw = tf.io.decode_raw(image_features['image_raw'],tf.float32)
    image = tf.reshape(image_raw, [288,288,1])

    seg_raw = tf.io.decode_raw(image_features['label_raw'],tf.int16)
    seg = tf.reshape(seg_raw, [288,288,7])

    return (image,seg)

def read_tfrecord(tfrecords_dir,batch_size, is_training=False):
    
    file_list = tf.io.matching_files(os.path.join(tfrecords_dir, '*-*'))
    shards = tf.data.Dataset.from_tensor_slices(file_list)
    shards = shards.shuffle(tf.cast(tf.shape(file_list)[0], tf.int64))
    shards = shards.repeat()
    dataset = shards.interleave(tf.data.TFRecordDataset, cycle_length=16, num_parallel_calls=tf.data.experimental.AUTOTUNE)
    if is_training:
      dataset = dataset.shuffle(buffer_size=1000)
    
    dataset = dataset.map(map_func=_parse_fn,num_parallel_calls=tf.data.experimental.AUTOTUNE)
    dataset = dataset.batch(batch_size, drop_remainder=True).prefetch(tf.data.experimental.AUTOTUNE)

    #optimise dataset performance
    options = tf.data.Options()
    options.experimental_optimization.parallel_batch = True
    options.experimental_optimization.map_fusion = True
    options.experimental_optimization.map_vectorization.enabled = True
    options.experimental_optimization.map_parallelization = True
    dataset = dataset.with_options(options)
    dataset = dataset.prefetch(tf.data.experimental.AUTOTUNE)

    return dataset