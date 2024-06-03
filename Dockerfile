FROM python:3.12.3-slim

WORKDIR /app

COPY ./src/requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

COPY ./src /app

EXPOSE 80

CMD ["flask", "run", "--host=0.0.0.0", "--port=80"]


