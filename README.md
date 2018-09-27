## 魔法丝袜之影Docker镜像

主内容来源于 lowid/ss-with-net-speeder
 
由于该镜像被樱花屏蔽，所以自建一个

###20180927更新

新建了一个基于 alpine 的镜像

Dockerfile中开启下列端口

1. 22端口，用于SSH连接。
2. 18388端口，用于魔法丝袜之影连接。

在樱花中建立ENV(环境变量)`ROOT_PASS`作为SSH登录密码，若不建立该变量则为随机密码，需要查看命令行输出。

启动添加如下命令：

` -s 0.0.0.0 -p 18388 -k pass -m chacha20 -o http_post_compatible -O auth_sha1_v4_compatible`

未避免屏蔽，Dockerfile中开启端口为18388，故命令中端口号不建议更改。