#!/bin/bash -ex

# Default JVM command line options.
DEFAULT_JVM_OPTS="-server "
# Uses a fixed heap size.
DEFAULT_JVM_OPTS+="-Xms2g "
DEFAULT_JVM_OPTS+="-Xmx3g "
# GC logging options.
DEFAULT_JVM_OPTS+="-XX:+PrintGCDetails -XX:+PrintGCTimeStamps "
DEFAULT_JVM_OPTS+="-Xloggc:/opt/autohome/logs/gc.log "
DEFAULT_JVM_OPTS+="-XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=10M "
# Generates a heap dump on OOME.
DEFAULT_JVM_OPTS+="-XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/opt/autohome/logs"

exec java ${JVM_OPTS:-$DEFAULT_JVM_OPTS} -Dlogdir=/opt/autohome/logs -jar /opt/autohome/libs/server-1.0.jar
