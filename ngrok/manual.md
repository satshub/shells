#### 申请TLS
 ```text
    全过程参考acme.sh  
    https://github.com/acmesh-official/acme.sh/wiki/说明
```
 在执行的过程中，按照www.openchart.org domain来申请TLS证书，最终会生成如下证书文件：
```shell
-rw-r--r-- 1 ec2-user ec2-user 4399 Oct 18 07:18 ca.cer
-rw-r--r-- 1 ec2-user ec2-user 6712 Oct 18 07:18 fullchain.cer
-rw-r--r-- 1 ec2-user ec2-user 2313 Oct 18 07:18 www.openchart.org.cer
-rw-r--r-- 1 ec2-user ec2-user  568 Oct 18 07:18 www.openchart.org.conf
-rw-r--r-- 1 ec2-user ec2-user 1029 Oct 18 07:17 www.openchart.org.csr
-rw-r--r-- 1 ec2-user ec2-user  208 Oct 18 07:17 www.openchart.org.csr.conf
-rw------- 1 ec2-user ec2-user 1675 Oct 18 07:11 www.openchart.org.key
```
#### 编译ngrok
- 拷贝TLS证书
    ```shell
      cd path/to/ngrok
      cp ~/www.openchart.org/fullchain.cer ./assets/client/tls/ngrokroot.crt
      cp ~/www.openchart.org/fullchain.cer ./assets/server/tls/snakeoil.crt
      cp ~/www.openchart.org/www.openchart.org.key ./assets/server/tls/snakeoil.key
    ```
- Make
    ```shell
   make server-release
   make client-release
  ```
#### ngrok配置
- web配置
    ```text
    1. web的端口服务，走的都是ngrok的默认端口，http:80; https:443; tunnelAddr:4443;
    2. 启动的时候，直接使用已经在TLS里申请好的全域名即可：www.openchart.org, 即：./server_start.sh 
    ```
- api配置 
    ```text
        1. 在防火墙上打开 4444端口  5555端口  6666端口；
        2. 手动指定https http tunnel端口分别为：4444 5555 6666; domain依然使用 www.openchart.org;
        3. ./server_start_api.sh
    ```
#### 启动 ngrok server端
- web
    ```shell
    ./server_start.sh   # 启动web 穿透 server
    ```
- api     
    ```shell
    ./server_start_api.sh  # 启动api 穿透 server 
    ```

#### 启动ngrok客户端
- web
    ```shell
    ./client_start.sh  # 启动web 穿透 client
    ```
- api
    ```shell
    ./client_start_api.sh #启动 api 穿透 client
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

务必将js/main.js中的apiHost和js/monitor/monitor.js中的apiHost从 10.0.1.102:23485 换成 https://www.openchart.org:4444
 ```

#### 访问
```text
http://www.openchart.org
https://www.openchart.org
```