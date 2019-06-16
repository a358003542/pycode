# pycode
python project docker solution



## 更新说明
将



## useage
启动容器

```bash
docker-compose up 
```

你可以加上 `-d` 选项让容器在后台运行

## docker-compose.yml
虽然是单容器的样子，但是 通过 `docker-compose.yml` 文件 简单的调用 `docker-compose up` 命令就能很方便地将之前调用 `docker run` 的命令行里面的一大串配置融合进来。


## 新增 python.env 文件
通过 `docker-compose` 加载，根据因为设置当前工作目录为 `/home/pycode` ，加载环境变量 

```
PYTHONPATH=$PYTHONPATH:.
```

会新增当前工作目录到 `sys.path` 里面去。一般pycharm设置src所在，其会自动这样配置，这样当前目录下的一些python module文件夹我们都是可以直接调用的。


## run.py的设计原则
1. 应该提供 `--port` 参数入口，Dockfile里面暴露的端口号将自动传递进来。 

## 设计原则

1. 使用官方原版python:3.6 之所以选择python3.6是因为python3.6新增的 f-string 真的太好用了。

2. 你的python项目代码放在pycode文件夹里面，将会复制到容器的 `/home/pycode` 哪里。

3. 控制你的容器的默认工作路径在 `/home/pycode` 哪里。

4. 控制你的容器的默认虚拟环境路径在 `/home/venv` 哪里。将会自动激活，你输入python或者pip都是虚拟环境的。

5. 你的python项目代码要输出的数据都推荐输出到 `/home/data`  在启动容器的时候如下设置则你的容器内的程序输出的数据会映射到你的主机的某个文件夹：

```bash
docker run -p 9001:9001 -it --rm -v /home/wanze/data:/home/data pycode
```

6. 不管python项目采用什么web框架，都推荐提供 `run.py` 程序启动脚本。


7. 本演示例子暴露端口9001，具体请根据自己需求来定制，但一般推荐一个容器暴露一个端口，有多个需求的，推荐通过docker 的compose来管理。



