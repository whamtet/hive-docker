FROM sequenceiq/hadoop-docker

ENV HIVE_VERSION=2.0.1
ENV HIVE_HOME=/usr/local/hive
ENV PATH=$HIVE_HOME/bin:$PATH

RUN curl -O http://apache.01link.hk/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz
RUN	tar -zxvf ./apache-hive-${HIVE_VERSION}-bin.tar.gz &&\
	  mv ./apache-hive-${HIVE_VERSION}-bin $HIVE_HOME &&\
  	rm -f ./apache-hive-${HIVE_VERSION}-bin.tar.gz &&\
    ${HIVE_HOME}/bin/schematool -initSchema -dbType derby

CMD /etc/bootstrap.sh -bash

