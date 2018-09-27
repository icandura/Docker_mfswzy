﻿## 魔法丝袜之影Docker镜像

主内容来源于 lowid/ss-with-net-speeder
 
由于该镜像被樱花屏蔽，所以自建一个

### 20180927更新

新建了一个基于 alpine 的镜像

Dockerfile中开启下列端口

1. 22端口，用于SSH连接。
2. 18388端口，用于魔法丝袜之影连接。

在樱花中应建立下列环境变量

1. `PASSWORD`作为SSH登录密码和魔法丝袜之影密码
2. `METHOD`作为魔法丝袜之影的协议（如`aes-256-cfb`、`chacha20`等）

进程采用`supervisor`启动和保护，无需其他启动命令。