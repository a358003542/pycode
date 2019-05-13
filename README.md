# pycode
python project docker solution



TODO： 笔者还在进一步学习研究docker中，本项目还需要进一步的优化完善。

## 设计原则

1. 使用官方原版python:3.5 或者3.6等
2. 你的python项目代码放在pycode文件夹里面，将会复制到容器的 `/home/pycode` 哪里。
3. 使用pipenv来管理python项目，好处有如下：
   - 通过requirements.txt 自动安装python项目依赖环境
   - 通过 `.env` 文件来管理python项目运行时的环境变量
4. 不管python项目采用什么web框架，都推荐提供 `run.py` 程序启动脚本，然后推荐如下调用容器:

```
docker run -p 8888:8888 -it --rm python35:v1 
```

加上 `-d` 容器后台运行。

5. 一个容器推荐一个暴露端口，有多个需求的，推荐通过docker 的compose来管理。