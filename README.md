# Merck-HP-Docker

## Intro

This is a repo containing the Dockerfile and code to containerize, run and test the repo at [GoGoDuck/SCHP](https://github.com/PeikeLi/Self-Correction-Human-Parsing).

## Requirements

1. A computer with an NVIDIA GPU
2. Docker

## Usage

#### Building the Docker image

> Run `docker build -t test-image .`

#### Running a container from the image

> Run `run --gpus all -it test-image`

#### Running the script

Once the container is running and the shell prompt appears, `cd` into the repo directory at `Self-Correction-Human-Parsing/` and run `python3 test.py`

## Known Issues

The `ninja` package may not work correctly, and may return an error, causing the repo to not run.
