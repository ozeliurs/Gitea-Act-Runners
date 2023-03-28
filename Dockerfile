FROM debian

ADD run.sh .

ENTRYPOINT [ "./run.sh" ]