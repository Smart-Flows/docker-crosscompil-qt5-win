# docker-crosscompil-qt5-win

Dockerfile for building a cross developing environment for Qt5 targeting Windows.

## Build

To build the environment invoke
```
docker build --tag docker-crosscompil-qt5-win .
```

in the directory of this file. This creates a docker image called "docker-crosscompil-qt5-win". Note that it will take a while if you are building this image the first time.

## Usage

In the project directory, you intend to cross-compile, create a `docker-compose` file like

```
version: "2.1"

services:

  your_project_name:
    image: smartflows/docker-crosscompil-qt5-win:latest
    volumes:
      - .:/src
    entrypoint:
      - ./scripts/entrypoint.sh
```

Then, run the docker container once, so it compiles your code. The produced windows executable will be available in the `release` directory.

```
docker-compose run --rm your_project_name build
```
