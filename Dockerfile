FROM python:3.9
WORKDIR /code
COPY ./requirements.docker.txt ./requirements.txt
RUN pip install --no-cache-dir --upgrade -r ./requirements.txt
RUN apt update
COPY ./src ./app
# , "--proxy-headers"
ENTRYPOINT [ "uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload" ]

EXPOSE 8000