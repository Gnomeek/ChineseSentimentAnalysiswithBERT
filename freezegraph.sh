export TRAINED_CLASSIFIER=data/adam_output
export BERT_BASE_DIR=chinese_L-12_H-768_A-12

python freeze_graph.py \
    -bert_model_dir $BERT_BASE_DIR \
    -model_dir $TRAINED_CLASSIFIER/$EXP_NAME \
    -max_seq_len 128 \
    -num_labels 2