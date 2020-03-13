# Chinese Sentiment Analysis with BERT

只需一行代码就可以进行中文文本情感分类（二分类）

不需要手动将数据集分为train,dev,test再转为tsv格式

增加精确率，召回率，F1值作为输出指标

增加Adam优化器

理论上更改部分代码可以就可进行多分类任务

有问题可以发[issue](https://github.com/Gnomeek/ChineseSentimentAnalysiswithBERT/issues)询问，请尽可能详细的描述您的问题，我会尽快回复。

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

## FAQ

#### Q: 我想执行多分类任务该怎么办？

A: 理论上来说，修改run_classifier.py文件中`MyProcessor`类的`get_labels`方法即可

#### Q: 训练需要多长时间？

A: 我的机器为MistGPU提供的Titan V(12G)，数据集大小约为12万条。执行BERT耗时35分钟左右，使用Adam优化器后缩短至17分钟左右。你可以点击[链接](mistgpu.com/i/747128)来注册MistGPU，你和我均会获得8¥代金券，或者可以点击[链接](mistgpu.com)来注册，只有你会获得8¥代金券（一切解释权归属MistGPU）。下表为MistGPU部分收费参考表（可能日后会有变动）：

| 机器             | 收费   |
| ---------------- | ------ |
| Titan V (12G)    | 3.5¥/h |
| Tesla P100 (16G) | 4¥/h   |
| Titan RTX（24G） | 5¥/h   |

#### Q: 执行时显示内存不足该怎么办？

A: 根据Google提供的数据，他们在单卡Titan X(12G)下使用的最大参数如下表。你可以根据自己机器的性能修改run.sh中的参数

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

#### Q: 如何使用数据集训练自己的句向量

A: 参考[Bert-a s-service](https://github.com/hanxiao/bert-as-service)

#### Q: 如何将模型部署到服务器上

A: 参考[Bert-base](https://github.com/macanv/BERT-BiLSTM-CRF-NER)

