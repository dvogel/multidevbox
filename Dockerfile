FROM ubuntu:18.04

SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.utf8

COPY provision.sh user_provision.sh /tmp/

RUN apt-get -y update && apt-get install -y software-properties-common curl less zip apt-transport-https libffi-dev clang
RUN /bin/bash /tmp/provision.sh
RUN /bin/bash /tmp/user_provision.sh

CMD ["-l"]
ENTRYPOINT ["/bin/bash"]
