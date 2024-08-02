# image-sync
镜像同步
## 配置
* 在config里配置需要同步的源镜像地址以及目的镜像地址，如果有多个，在列表里添加即可，需要注意的是source和dest必须一一对应
* secrets里需配置docker鉴权文件（base64后写入）
## 启动
* deploy用于测试，只同步一次
* cronjob每天凌晨两点进行同步
