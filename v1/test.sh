#!/bin/bash

# use CUDNN

#export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/cudnn/lib64
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cudnn/lib64
#export CPATH=$CPATH:/usr/local/cudnn/include

export THEANO_FLAGS=device=cuda,floatX=float32,optimizer_including=cudnn

python -u ./translate.py -k 10 ./models/attention_maxlen[200]_dimWord256_dim256.npz \
	../data/dictionary.txt \
	../data/online-test.pkl \
	../data/test_data_v1.txt \
	./result/test_decode_result.txt \
	./result/test.wer

