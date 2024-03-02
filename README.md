# STREEM

## Setup

Copy the keys from .env.example to .env and fill in the values.

## Run the api using docker

```sh
docker build -t stream-api -f Dockerfile.dev .
docker run -it -p 3000:3000 --rm --name stream-api-1 -v $(pwd)/.env:/docker/app/.env stream-api
```

## Project Setup for local development

Install the ruby version specified in the .ruby-version file.

```sh
bundle install
rails s
```
