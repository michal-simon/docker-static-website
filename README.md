# Docker Static Website

[![Codeac.io](https://static.codeac.io/badges/2-220649553.svg "Codeac.io")](https://app.codeac.io/github/michal-simon/docker-static-website)

Docker container description for static website build.

## Includes
* Ubuntu 24.04
* Node 22.x
* Ruby
* Python
* AWS CLI

## How to build it

```bash
docker buildx build --platform linux/amd64,linux/arm64 --push --tag michalsimon/static-website:node22 .
```
