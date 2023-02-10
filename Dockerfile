FROM python:slim 
RUN apt-get update && apt-get -y upgrade \ 
  && apt-get install -y --no-install-recommends \ 
    git wget g++ ca-certificates \ 
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
ENV PATH="/root/miniconda3/bin:${PATH}" 
ARG PATH="/root/miniconda3/bin:${PATH}" 
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \ 
    && mkdir /root/.conda \ 
    && bash Miniconda3-latest-Linux-x86_64.sh -b \ 
    && rm -f Miniconda3-latest-Linux-x86_64.sh \ 
    && echo "Running $(conda --version)" && \ 
    conda init bash && \ 
    . /root/.bashrc && \ 
    conda update conda && \
    conda install -c conda-forge gdown

# Clone GoGoDuck repo and copy python script to the folder
RUN git clone https://github.com/PeikeLi/Self-Correction-Human-Parsing && \
	cd Self-Correction-Human-Parsing && \
	mkdir checkpoints && \
	mkdir outputs && \
	mkdir inputs
COPY test.py /Self-Correction-Human-Parsing/test.py

# Install mamba to speed up conda
RUN conda install -y mamba -c conda-forge

# Install packages
ADD ./environment.yml .
RUN mamba env update --file ./environment.yml && \
    conda clean -tipy

# Activate env on startup and link libcudart.so
RUN echo 'conda activate torch-gpu' >> /root/.bashrc
COPY test.py /Self-Correction-Human-Parsing/test.py

ENTRYPOINT [ "/bin/bash", "-l", "-c" ] 
CMD ["bash"]
