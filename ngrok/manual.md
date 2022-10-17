#### ngrok配置

```text
https://baijiahao.baidu.com/s?id=1720564679010783502&wfr=spider&for=pc
```

#### 启动 ngrok server端
```shell
./server_start.sh
```

#### 启动ngrok客户端(使用ngrok.cfg)
```shell
./client_start.sh
```

#### 启动 memo daemon
```shell
./memo daemon &
```

#### 启动memo api 
```shell
./memo api &
```

#### 启动 web服务
 ```shell
~ cd ./www && go build  
~ ./www
 ```

#### 访问
```text
http://www.openchart.org,  暂时不支持 https协议
```