#!/bin/zsh
nohup redis-server &

nohup ./memo daemon &  # 启动daemon，不断sub从bitcoin node过来的消息，然后处理完后放到redis里面

nohup ./memo api &  # 响应web的api请求； 数据对daemon进行有依赖；

nohup ./memo web & # website server；响应页面请求;
