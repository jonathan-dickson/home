FROM java:8

RUN mkdir -p /opt/autohome/libs /opt/autohome/logs
COPY build/libs/* /opt/autohome/libs/

COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
