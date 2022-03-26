FROM python:3.8-slim
#
WORKDIR /home/xuemc
#
COPY ./ ./
#
#RUN sed -i 's#http://archive.ubuntu.com/#http://mirrors.tuna.tsinghua.edu.cn/#' /etc/apt/sources.list;
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update --fix-missing && apt-get install -y libpq-dev --fix-missing
#RUN apt-get install -y libpq-dev --fix-missing
RUN pip config set global.index-url http://mirrors.aliyun.com/pypi/simple/
RUN pip config set install.trusted-host mirrors.aliyun.com
RUN pip install --upgrade setuptools==45.2.0
RUN pip install --no-cache-dir -r requirements.txt
#
#CMD ["gunicorn","-c=./gunicorn_config.py","run:app"]
CMD ["python","run.py"]
