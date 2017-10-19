# Use Boron LTS version of Node.js
FROM node:boron

# Add Tini
ENV TINI_VERSION v0.16.1
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# Run as non-root "node" user
USER node

# Add global NPM dependencies to non-root user directory
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

# Install json-server
RUN npm install -g json-server

# Launch server
CMD ["sh", "-c", "$NPM_CONFIG_PREFIX/bin/json-server --watch $JSONFILE"]
