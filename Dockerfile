FROM python:3.5
COPY pycode /home/pycode
RUN pip install pipenv

WORKDIR /home/pycode
RUN pipenv install
CMD pipenv run python /home/pycode/run.py

EXPOSE 8888
