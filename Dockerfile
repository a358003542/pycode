FROM python:3.6

ENV APP_PATH=/home/pycode
ENV VENV_PATH=/home/venv
ENV DATA_PATH=/home/data
ENV VIRTUAL_ENV=$VENV_PATH
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
ENV PORT=9001

COPY pycode $APP_PATH

RUN python -m venv $VENV_PATH

WORKDIR $APP_PATH

RUN pip install -r requirements.txt
CMD python run.py --port=$PORT

VOLUME $DATA_PATH
EXPOSE $PORT

