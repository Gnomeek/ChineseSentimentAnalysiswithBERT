# Chinese Sentiment Analysis with BERT

只需一行代码就可以进行中文文本情感分类（二分类）

不需要手动将数据集分为train,dev,test再转为tsv格式

理论上更改部分代码可以就可进行多分类任务

## 如何使用
1. [下载](https://storage.googleapis.com/bert_models/2018_11_03/chinese_L-12_H-768_A-12.zip)BERT中文模型，并解压在该目录下
2. 将你的数据集文件放到data文件夹下，并重命名为"data.csv"。完成这两步后你的项目文件树应该如下：
├── CONTRIBUTING.md
├── LICENSE
├── README.md
├── chinese_L-12_H-768_A-12
│   ├── bert_config.json
│   ├── bert_model.ckpt.data-00000-of-00001
│   ├── bert_model.ckpt.index
│   ├── bert_model.ckpt.meta
│   └── vocab.txt
├── create_pretraining_data.py
├── data
│   └── data.csv
├── divide.py
├── extract_features.py
├── freeze_graph.py
├── freezegraph.sh
├── modeling.py
├── modeling_adam.py
├── modeling_test.py
├── multilingual.md
├── optimization.py
├── optimization_adam.py
├── optimization_test.py
├── requirements.txt
├── run.sh
├── run_classifier.py
├── run_classifier_with_tfhub.py
├── run_pretraining.py
├── run_squad.py
├── runadam.sh
├── sample_text.txt
├── tokenization.py
└── tokenization_test.py
3. 终端下运行 `bash run.sh`,至此，BERT模型已经成功运行起来了
4. （可选）在终端下运行`bash runadam.sh`以运行增加了Adam优化器的BERT模型

benchmarked the maximum batch size on single Titan X GPU (12GB RAM) with
TensorFlow 1.11.0:

System       | Seq Length | Max Batch Size
------------ | ---------- | --------------
`BERT-Base`  | 64         | 64
...          | 128        | 32
...          | 256        | 16
...          | 320        | 14
...          | 384        | 12
...          | 512        | 6
`BERT-Large` | 64         | 12
...          | 128        | 6
...          | 256        | 2
...          | 320        | 1
...          | 384        | 0
...          | 512        | 0


