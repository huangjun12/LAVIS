# 1. 下载COCO-caption数据集
# 参考lavis/datasets/download_scripts/download_coco.py中的链接下载并解压以下三个文件:
# train2014.zip, val2014.zip, test2014.zip 3个文件
# 2. 下载标注文件
# 参考lavis/configs/datasets/coco/defaults_cap.yaml中的链接下载以下三个标注文件:
# new_coco_karpathy_train.json, new_coco_karpathy_val.json, new_coco_karpathy_test.json
# 3. 指定数据集路径
# 在lavis/configs/default.yaml和lavis/configs/datasets/coco/defaults_cap.yaml文件中指定数据集存储路径:
# env.cache_root + datasets.coco_caption.build_info.images 图像路径
# env.cache_root + datasets.coco_caption.build_info.annotations.[mode].storage 标注文件路径
# 4. 下载预训练模型
# (1) Bert相关参考 https://zhuanlan.zhihu.com/p/147144376 下载, 在代码中通过路径指定
# (2) 其它也都可以提前下载好，然后在配置文件中将链接改为存储路径。


# 不开代理跑通过

unset http_proxy
unset https_proxy

python -m torch.distributed.run --nproc_per_node=1 train.py --cfg-path lavis/projects/blip2/train/pretrain_stage1.yaml
