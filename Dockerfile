FROM seberino/ace-mq:1.2

COPY BARfiles/Ace-test.bar /home/aceuser/initial-config/bars 
USER 0
ENV LICENSE accept
EXPOSE 7600

RUN mkdir /home/aceuser/generic && mkdir -p /home/aceuser/initial-config/setdbparms
COPY db/db2cli.ini /home/aceuser/generic
ENV DB2CLIINIPATH=/home/aceuser/generic
ENV ODBCINI=/home/aceuser/ace-server/odbc.ini
COPY db/odbc.ini /home/aceuser/ace-server/
COPY db/setdbparms.txt /home/aceuser/initial-config/setdbparms
RUN chmod 664 /home/aceuser/ace-server/*.ini && chown aceuser:mqbrkrs /home/aceuser/ace-server/*.ini && chmod 664 /home/aceuser/initial-config/setdbparms/*.txt && chown aceuser:mqbrkrs /home/aceuser/initial-config/setdbparms/*.txt 
RUN chmod 664 /home/aceuser/generic/*.ini && chown aceuser:mqbrkrs /home/aceuser/generic/*.ini

USER 1000
