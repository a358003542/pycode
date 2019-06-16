FROM python:3.6

ARG UNAME=wanze
ARG UID=1000
ARG GID=1000
ARG PORT=9001

ENV APP_PATH=/home/pycode
ENV DATA_PATH=/home/data
ENV UHOME=/home

RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash -d $UHOME $UNAME
USER $UNAME

COPY pycode $APP_PATH

WORKDIR $APP_PATH

RUN pip install --no-cache-dir -r requirements.txt

CMD python run.py --port=$PORT

VOLUME $DATA_PATH
EXPOSE $PORT

