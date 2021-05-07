docker run -it -d --gpus=all -u $(id -u):$(id -g) --ipc=host --name kneesegcon -v /home/joe/github/knee-segmentation/:/home/joe/github/knee-segmentation/ kneeseg

