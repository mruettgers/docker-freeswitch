FROM alpine:3
LABEL maintainer="Michael Rüttgers <michael@ruettgers.eu>"

ENV PACKAGES \
  freeswitch
  
RUN apk -U --no-cache add ${PACKAGES}

CMD [ "freeswitch" ]