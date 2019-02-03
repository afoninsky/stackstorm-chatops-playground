ARG ST2_VERSION
FROM stackstorm/st2:${ST2_VERSION}
LABEL com.stackstorm.component="st2chatops"

# Install StackStorm ChatOps
RUN if [ "${ST2_VERSION#*dev}" != "${ST2_VERSION}" ]; then \
    ST2_REPO=unstable; \
  else \
    ST2_REPO=stable; \
  fi \
  && echo ST2_REPO=${ST2_REPO} \
  && curl -s https://packagecloud.io/install/repositories/StackStorm/${ST2_REPO}/script.deb.sh | bash \
  && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs build-essential st2chatops \
  && rm -f /etc/apt/sources.list.d/StackStorm_*.list

WORKDIR /opt/stackstorm/chatops

# Add telegram bot with hubot deps
RUN npm install -g coffee-script \
  && npm install https://github.com/afoninsky/hubot-telegram-better

USER st2

CMD ["./bin/hubot"]

EXPOSE 8081