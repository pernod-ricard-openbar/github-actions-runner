# github-actions-runner
Running self-hosted github actions runner in Docker.

## Usage
Basic usage:
```bash
docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --env URL=<your_repo_url> \
    --env TOKEN=XXXXXXXXXXXXXXXXXXXXX \
    --env NAME=my-runner \
    pernodricard/github-actions-runner
```
Note the docker socket that is mounted inside the container to be able to access the docker engine and perform Docker in Docker (dind). Shall you choose to omit to mount docker.sock, you won't be able to use docker commands within your runner.

You can also specify a runner group and some labels:
```bash
docker run -it --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    --env URL=<your_repo_url> \
    --env TOKEN=XXXXXXXXXXXXXXXXXXXXX \
    --env NAME=my-runner \
    --env GROUP=my-group \
    --env LABELS=label1,label2,label3 \
    pernodricard/github-actions-runner
```

## Build

```bash
docker build -t pernodricard/github-actions-runner .
```
