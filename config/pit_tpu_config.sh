#!/bin/bash

# # first config
# python3 main.py --train_epochs=150 --batch_size=32 --base_learning_rate=5.0e-03 --lr_drop_ratio=0.70 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=150 --batch_size=32 --base_learning_rate=5.0e-03 --lr_drop_ratio=0.70 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=150 --batch_size=32 --base_learning_rate=5.0e-03 --lr_drop_ratio=0.70 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3

# # second config
# python3 main.py --train_epochs=150 --batch_size=32 --aug_strategy=random-crop --base_learning_rate=5.0e-03 --lr_drop_ratio=0.70 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=150 --batch_size=32 --aug_strategy=random-crop --base_learning_rate=5.0e-03 --lr_drop_ratio=0.70 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=150 --batch_size=32 --aug_strategy=random-crop --base_learning_rate=5.0e-03 --lr_drop_ratio=0.70 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3

# # third config
# python3 main.py --train_epochs=150 --batch_size=32 --aug_strategy=noise --base_learning_rate=5.0e-03 --lr_drop_ratio=0.70 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=150 --batch_size=32 --aug_strategy=noise --base_learning_rate=5.0e-03 --lr_drop_ratio=0.70 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=150 --batch_size=32 --aug_strategy=noise --base_learning_rate=5.0e-03 --lr_drop_ratio=0.70 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3

# # fourth config
# python3 main.py --train_epochs=150 --batch_size=32 --aug_strategy=crop_and_noise --base_learning_rate=5.0e-03 --lr_drop_ratio=0.70 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=150 --batch_size=32 --aug_strategy=crop_and_noise --base_learning_rate=5.0e-03 --lr_drop_ratio=0.70 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=150 --batch_size=32 --aug_strategy=crop_and_noise --base_learning_rate=5.0e-03 --lr_drop_ratio=0.70 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3

##################################################

# #same learning rate as already done but binary
# python3 main.py --train_epochs=150 --multi_class=False --batch_size=32 --base_learning_rate=5.0e-03 --lr_drop_ratio=0.70 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3

# #smaller learning rate
# python3 main.py --train_epochs=100 --batch_size=32 --base_learning_rate=8.0e-06 --lr_drop_ratio=0.98 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=100 --multi_class=False --batch_size=32 --base_learning_rate=5.0e-03 --lr_drop_ratio=0.70 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3

# #high learning rate and high drop ratio
# python3 main.py --train_epochs=100 --batch_size=32 --base_learning_rate=9.0e-04 --lr_drop_ratio=0.95 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=100 --multi_class=False --batch_size=32 --base_learning_rate=9.0e-04 --lr_drop_ratio=0.95 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3

##################################################

# # old but with random crop
# python3 main.py --train_epochs=90 --multi_class=False --batch_size=32 --aug_strategy=random-crop --base_learning_rate=8.0e-06 --lr_drop_ratio=0.98 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=90 --batch_size=32 --aug_strategy=random-crop --base_learning_rate=8.0e-06 --lr_drop_ratio=0.98 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3

# # new
# python3 main.py --train_epochs=75 --batch_size=32 --base_learning_rate=7.0e-05 --lr_drop_ratio=0.98 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=75 --multi_class=False --batch_size=32 --base_learning_rate=7.0e-05 --lr_drop_ratio=0.98 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=75 --batch_size=32 --aug_strategy=random-crop --base_learning_rate=7.0e-05 --lr_drop_ratio=0.98 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=75 --multi_class=False --batch_size=32 --aug_strategy=random-crop --base_learning_rate=7.0e-05 --lr_drop_ratio=0.98 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3

#smaller
## python bad
# python3 main.py --train_epochs=100 --multi_class=False --batch_size=32 --base_learning_rate=8.0e-06 --lr_drop_ratio=0.98 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=75 --batch_size=32 --base_learning_rate=4.0e-06 --lr_drop_ratio=0.99 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3

# python3 main.py --train_epochs=100 --aug_strategy=random-crop --batch_size=32 --base_learning_rate=9.0e-04 --lr_drop_ratio=0.95 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
# python3 main.py --train_epochs=100 --aug_strategy=random-crop --multi_class=False --batch_size=32 --base_learning_rate=9.0e-04 --lr_drop_ratio=0.95 --lr_warmup_epochs=1 --model_architecture=deeplabv3 --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3


################################################### Deeplabv3 plus
python3 main.py --train_epochs=80 --batch_size=32 --base_learning_rate=7.0e-05 --lr_drop_ratio=0.98 --lr_warmup_epochs=1 --model_architecture=deeplabv3_plus --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
python3 main.py --train_epochs=80 --batch_size=32 --base_learning_rate=3.0e-06 --lr_drop_ratio=0.98 --lr_warmup_epochs=1 --model_architecture=deeplabv3_plus --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
python3 main.py --train_epochs=80 --batch_size=32 --base_learning_rate=4.0e-03 --lr_drop_ratio=0.8 --lr_warmup_epochs=1 --model_architecture=deeplabv3_plus --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
python3 main.py --train_epochs=80 --batch_size=32 --base_learning_rate=3.0e-05 --lr_drop_ratio=0.98 --lr_warmup_epochs=1 --model_architecture=deeplabv3_plus --tfrec_dir=gs://oai-challenge-dataset/tfrecords/ --logdir=gs://oai-challenge-dataset/checkpoints/ --tpu=pit-tpu  --num_filters_atrous=256 --kernel_size_initial_conv=3
