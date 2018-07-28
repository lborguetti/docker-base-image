docker-base-image
---

[![Build Status](https://travis-ci.org/lborguetti/docker-base-image.svg?branch=master)](https://travis-ci.org/lborguetti/docker-base-image)

This project build automatically a docker image **FROM** `debian:stable-slim`

## Why use one docker-base-image?

- It reduces the time needed to run docker build, allowing you to iterate your Dockerfile more quickly.
- It reduces download time during redeploys. Docker only needs to download the base image once: during the first deploy. On every subsequent deploys, only the changes you make on top of the base image are downloaded.
- It reduces the time to apply a security patch and ensure all update, you have a single point to keep your eye.

## What's inside the image?

```shell
ca-certificates
curl
ngrep
```

## How use this docker-base-image?

This project will've build this image weekly and publish with a tag `stable`

You can find all releases here: https://hub.docker.com/r/lborguetti/docker-base-image/tags/

The **FROM** instruction specifies the Base Image from which you are building, use this image there.

> example:

```shell
cat <<EOF> Dockerfile
FROM lborguetti/docker-base-image:stable

ADD binary /

ENTRYPOINT ["./binary"]
EOF
```

## Build flow

Travis CI and Docker Hub can build this image weekly without user interaction.

Travis-CI is setted to trigger weekly a build from master branch. This build will create a branch with the name "year.month.day" and will push back to github.

At Docker Hub has a "automated build" listening new branches and building two images, one with the tag stable and other with the name of the branch.

> note: For traceability the Dockerfile add a label with the name of the branch. So you can securely use the tag stable in your Dockerfiles.
