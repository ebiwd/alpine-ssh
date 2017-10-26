# alpine-ssh

Docker image based on [alpine:3.6](https://hub.docker.com/_/alpine/) for use in CI/CD pipelines.
Includes openssh and rsync, and a couple of utility scripts for inserting SSH keys and setting search domain.

## Utility scripts

Image also contains utility scripts

`add-ssh-key <user> <key> [<user> <key>]`

`add-aws-key <user> <key> [region] [output]`

`add-search-domain <domain>`
