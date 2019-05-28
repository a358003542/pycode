FROM python:3.6

ENV APP_PATH=/home/pycode \
    DATA_PATH=/home/data \
    PORT=9001

COPY pycode $APP_PATH

WORKDIR $APP_PATH

RUN pip install --no-cache-dir -r requirements.txt

CMD python run.py --port=$PORT

VOLUME $DATA_PATH
EXPOSE $PORT

