FROM centos

RUN yum install -y openssl docker java-1.8.0-openjdk git which
RUN curl -o jmeter.tgz http://apache.mirrors.pair.com/jmeter/binaries/apache-jmeter-4.0.tgz
RUN tar -zxvf jmeter.tgz
env JMETER_BIN /apache-jmeter-3.3/bin

ENV PATH $PATH:$JMETER_BIN:/apache-maven-3.5.2/bin
RUN git clone https://github.com/douglasAtJoyent/selfassignedips

RUN curl -O https://raw.githubusercontent.com/joyent/sdc-docker/master/tools/sdc-docker-setup.sh
RUN chmod 777 sdc-docker-setup.sh 
ENV PATH=$PATH:/apache-jmeter-4.0/bin
ENTRYPOINT bash
CMD jmeter -p buckets.properties
