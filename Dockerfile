FROM seberino/ace-mq:1.1

COPY BARfiles/*.bar /home/aceuser/initial-config/bars
USER 0

USER 1000

