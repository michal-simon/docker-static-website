# Docker Static Website

[![Codeac.io](https://static.codeac.io/badges/2-220649553.svg "Codeac.io")](https://app.codeac.io/github/michal-simon/docker-static-website)

Docker container description for static website build.

## Includes
* Node 20.x
* Ruby
* AWS CLI

## How to build it

```bash
docker buildx build --platform linux/amd64,linux/arm64 --push --tag michalsimon/static-website:node20 .
```
