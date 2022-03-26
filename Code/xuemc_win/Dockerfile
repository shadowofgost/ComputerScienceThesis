FROM python:3.8-slim
#
WORKDIR /home/xuemc
#
COPY ./ ./
#
RUN pip install --upgrade setuptools==45.2.0
RUN pip config set global.index-url http://mirrors.aliyun.com/pypi/simple/
RUN pip config set install.trusted-host mirrors.aliyun.com
RUN pip install --no-cache-dir -r ./requirements.txt
#
CMD ["gunicorn","-c=./gunicorn_config.py","run:app"]
