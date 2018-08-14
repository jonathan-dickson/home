FROM java:8

# Setting up Active MQ
ENV ACTIVEMQ_VERSION 5.14.3
ENV ACTIVEMQ apache-activemq-$ACTIVEMQ_VERSION

ENV ACTIVEMQ_HOME /opt/activemq

# Default Ports for Active MQ
#ACTIVEMQ_TCP=61616 ACTIVEMQ_AMQP=5672 ACTIVEMQ_STOMP=61613 ACTIVEMQ_MQTT=1883 ACTIVEMQ_WS=61614 ACTIVEMQ_UI=8161

RUN set -x && \
    mkdir -p /opt && \
    curl -s -S https://archive.apache.org/dist/activemq/$ACTIVEMQ_VERSION/$ACTIVEMQ-bin.tar.gz | tar xvz -C /opt && \
    ln -s /opt/$ACTIVEMQ $ACTIVEMQ_HOME && \
    today=$(($(date +%s) / 60 / 60 / 24)) && \
    sed -i 's/root::[0-9]*/root::'${today}'/' /etc/shadow && \
    useradd -r -M -d $ACTIVEMQ_HOME activemq && \
    passwd --expire root

RUN chmod 764 $ACTIVEMQ_HOME
COPY activemq.xml $ACTIVEMQ_HOME/conf
WORKDIR $ACTIVEMQ_HOME

CMD ["/bin/sh", "-c", "bin/activemq console"]
