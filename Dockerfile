FROM python:3.6

ENV APP_PATH=/home/pycode
ENV VENV_PATH=/home/venv
ENV DATA_PATH=/home/data

COPY pycode $APP_PATH

RUN python3 -m venv $VENV_PATH

WORKDIR $APP_PATH

ENV VIRTUAL_ENV=$VENV_PATH
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install -r requirements.txt
CMD python run.py

VOLUME $DATA_PATH
EXPOSE 9001
