FROM gcr.io/lke-pprd-image-factory-abcde/trusted/lookout-base/bionic-infosec:latest

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY RPS-App/requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY RPS-App /app

ENV LANG C.UTF-8

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
