FROM python:3.6

ARG UNAME=wanze
ARG UID=1000
ARG GID=1000

ENV UHOME=/home/$UNAME
ENV APP_PATH=$UHOME/pycode
ENV DATA_PATH=$UHOME/data
ENV VENV_PATH=$UHOME/venv
ENV VIRTUAL_ENV=$VENV_PATH
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
ENV PORT=9001

RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash -d $UHOME $UNAME
USER $UNAME


COPY pycode $APP_PATH

RUN python -m venv $VENV_PATH

WORKDIR $APP_PATH

RUN pip install --no-cache-dir -r requirements.txt

CMD python run.py --port=$PORT

VOLUME $DATA_PATH
EXPOSE $PORT

