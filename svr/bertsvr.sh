#!/bin/bash

echo 'start BERT server...'
sudo rm -rf tmp*

export BERT_BASE_DIR=../chinese_L-12_H-768_A-12
export TRAINED_CLASSIFIER=../data/output
export EXP_NAME=bertsvr

bert-base-serving-start \
    -model_dir $TRAINED_CLASSIFIER/$EXP_NAME \
    -bert_model_dir $BERT_BASE_DIR \
    -model_pb_dir $TRAINED_CLASSIFIER/$EXP_NAME \
    -mode CLASS \
    -max_seq_len 128 \
    -http_port 8091 \
    -port 5575 \
    -port_out 5576 \
    -device_map 1 
