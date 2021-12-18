FROM rackspacedot/python37:32

# RUN apk add --no-cache python3-dev=3.8.9 py3-pip bash
ADD ./app/requirements.txt /tmp/requirements.txt

RUN pip3 install --no-cache-dir -q -r /tmp/requirements.txt

ADD ./app/model /opt/app/model
ADD ./app/src /opt/app/src
WORKDIR /opt/app/src

RUN adduser mainuser
USER mainuser

CMD gunicorn --bind 0.0.0.0:$PORT wsgi

# EXPOSE 5000
# CMD python3 ./app.py
