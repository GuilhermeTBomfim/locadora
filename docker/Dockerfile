FROM python:3.9
WORKDIR /code
COPY ./requirements.docker.txt ./requirements.txt
RUN pip install --no-cache-dir --upgrade -r ./requirements.txt
RUN sudo curl --output /usr/share/keyrings/nginx-keyring.gpg  \
    https://unit.nginx.org/keys/nginx-keyring.gpg
RUN deb [signed-by=/usr/share/keyrings/nginx-keyring.gpg] https://packages.nginx.org/unit/debian/ bookworm unit \
    deb-src [signed-by=/usr/share/keyrings/nginx-keyring.gpg] https://packages.nginx.org/unit/debian/ bookworm unit
RUN sudo apt update && \
    sudo apt install unit && \
    sudo apt install unit-dev unit-jsc17 unit-perl  \
         unit-php unit-python3.9 unit-ruby unit-wasm && \
    sudo systemctl restart unit
COPY ../src /code/app
RUN chown -R unit:unit /code/app
# , "--proxy-headers"
ENTRYPOINT [ "uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload" ]

EXPOSE 8000