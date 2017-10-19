# json-server-docker
[json-server](https://github.com/typicode/json-server) running in a Docker container.

## Features:
- [Tini](https://github.com/krallin/tini) init system
- Node.js running as non-root and other Node/Docker [best practices](https://github.com/nodejs/docker-node/blob/master/docs/BestPractices.md)
- Runs Node Boron LTS

## Requirements:
- Latest version of Docker & Docker Compose

## Usage:
- Clone this repo
- Create a db.json file in the "db" subfolder. If no file is present, one will automatically be generated on container start.
- Optional: change the "published" port in docker-compose.yaml
- Optional: uncomment the "read_only" option in docker-compose.yaml to make the bind volume RO; this effectively locks down the server to service GET commands only. You can additionally pass the "--ro" command to the CMD in the Dockerfile, i.e.
`CMD ["sh", "-c", "$NPM_CONFIG_PREFIX/bin/json-server --ro $JSONFILE"]`
- Build the container:
`docker-compose up --build -d`
