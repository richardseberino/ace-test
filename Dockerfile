FROM hondabhyat/ace-mqclient

RUN mkdir -p /home/aceuser/initial-config/bars && mkdir -p /home/aceuser/initial-config/setdbparms
COPY BARfiles/*.bar /home/aceuser/initial-config/bars


#Prepara o IIB para conexao com base de dados
ENV ODBCINI=/home/aceuser/odbc.ini
ENV ODBCSYSINI=/home/aceuser/odbcinst.ini
COPY db/odbc.ini /home/aceuser
COPY db/db2cli.ini /home/aceuser
COPY db/odbcinst.ini /home/aceuser
COPY db/setdbparms.txt /home/aceuser/
RUN chmod 664 /home/aceuser/*.ini && chown aceuser:mqbrkrs /home/aceuser/*.ini
