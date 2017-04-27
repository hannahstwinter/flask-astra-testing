FROM alpine:3.4

ADD requirements /requirements

RUN apk add --update --no-cache \
        bash \
        gcc \
        libffi \
        libffi-dev \
        libxml2 \
        libxml2-dev \
        musl \
        musl-dev \
        openssl \
        openssl-dev \
        python \
        python-dev \
        py-cffi \
        py-virtualenv \
        xmlsec && \
    virtualenv --system-site-packages /env && \
    . /env/bin/activate && pip install --no-cache-dir -r /requirements && \
    apk del --no-cache \
        gcc \
        libffi-dev \
        libxml2-dev \
        musl-dev \
        openssl-dev \
        python-dev

ADD . /flask-astra-test/
WORKDIR /flask-astra-test
CMD . /env/bin/activate && \
    PYTHONPATH=/ python application.py --host 0.0.0.0 --port 8087
