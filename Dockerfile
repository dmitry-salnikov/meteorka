FROM buildpack-deps:jessie-scm

RUN apt-get update && apt-get -f install -y && apt-get install -y --no-install-recommends \
    wget \
    curl \
    ca-certificates \
  && rm -rf /var/lib/apt/lists/* \
  && groupadd -r node \
  && useradd -r -m -g node node \
  && mkdir -p /home/node/app \
  && chown -R node:node /home/node/

USER node

WORKDIR /home/node/app

# Create a non-privileged user to do most all the work as.
# We do this now to create the home directory.
# RUN groupadd -r node && useradd -r -m -g node node
# Do the rest in the 'node' user home directory.
# WORKDIR /home/node
# Set permissions before we leave.
# RUN chown -R node:node /home/node/

# Change to the node user for execution.
# USER node

# RUN curl https://install.meteor.com | sh

# ENV PATH="/home/node/.meteor:${PATH}"

# CMD [ "meteor", "npm", "install", "--global", "node-gyp", "node-pre-gyp" ]
