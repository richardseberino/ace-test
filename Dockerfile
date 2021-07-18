FROM seberino/ace-mq:1.2


COPY BARfiles/*.bar /home/aceuser/initial-config/bars
USER 0
COPY db/db2cli.ini /home/aceuser
ENV DB2CLIINIPATH /home/aceuser
COPY db/odbc.ini /home/aceuser
ENV ODBCINI /home/aceuser/odbc.ini
RUN chmod 666 /home/aceuser/*.ini && chown aceuser:mqbrkrs /home/aceuser/*.ini

USER 1000

