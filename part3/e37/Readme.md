# Excersise 3.7

Hands on with the Youtube downloader containers.

Original ubuntu:18.04 and alpine:3.15.4 versions.

Sizes:

```
rvlq/ytdl-ubuntu          latest        40a335b0ef37   2 days ago       151MB
rvlq/ytdl-alpine          3.15.4        819c808324ab   2 minutes ago    54MB
ytdl                      alpine        2c3b445c1f5c   11 minutes ago   51.6MB
```
The third image was from alpine version 3.13 and slightly smalller than 3.15.4, that currently is "latest".

Neither Alpine image shows any known vulnerability issues in Snyk scan, but the Ubuntu one had 16.

```
Package manager:   deb
Project name:      docker-image|rvlq/ytdl-ubuntu
Docker image:      rvlq/ytdl-ubuntu
Platform:          linux/amd64
Base image:        ubuntu:18.04

Tested 135 dependencies for known vulnerabilities, found 28 vulnerabilities.

Base Image    Vulnerabilities  Severity
ubuntu:18.04  16               0 critical, 0 high, 3 medium, 13 low

Recommendations for base image upgrade:

Major upgrades
Base Image    Vulnerabilities  Severity
ubuntu:20.04  15               0 critical, 0 high, 2 medium, 13 low
```