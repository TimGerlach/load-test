FROM python:2.7-wheezy

# Install locust
RUN pip install pyzmq locustio faker

ADD locustfile.py /config/locustfile.py
ADD runLocust.sh /usr/local/bin/runLocust.sh

ENV LOCUST_FILE /config/locustfile.py
ENV TARGET_HOST http://front-end:80

EXPOSE 8089

ENTRYPOINT ["/usr/local/bin/runLocust.sh"]
