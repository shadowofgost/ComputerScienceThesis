FROM python:3.9-slim
#
WORKDIR /home
#
COPY ./ ./
#

#RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
#RUN apt-get update --fix-missing && apt-get install -y libpq-dev gcc --fix-missing
#RUN apt-get install -y libpq-dev --fix-missing
RUN pip config set global.index-url http://mirrors.aliyun.com/pypi/simple/
RUN pip config set install.trusted-host mirrors.aliyun.com
RUN pip install --no-cache-dir -r requirements.txt
#
CMD ["gunicorn","-c=./App/Config/gunicorn_config.py","run:app"]
#CMD ["python","run.py"]
