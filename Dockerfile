FROM seberino/ace-mq:1.2

EXPOSE 7600
COPY BARfiles/*.bar /home/aceuser/initial-config/bars
USER 0
RUN mkdir /home/aceuser/generic
COPY db/db2cli.ini /home/aceuser/generic
ENV DB2CLIINIPATH=/home/aceuser/generic
COPY db/odbc.ini /home/aceuser/ace-server
ENV ODBCINI=/home/aceuser/ace-server/odbc.ini
RUN chmod 666 /home/aceuser/ace-server/*.ini && chown aceuser:mqbrkrs /home/aceuser/ace-server/*.ini
RUN chmod 666 /home/aceuser/generic/*.ini && chown aceuser:mqbrkrs /home/aceuser/generic/*.ini

USER 1000

