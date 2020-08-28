FROM josechval/cd-base:latest
RUN apt update
RUN apt install -y curl wget git build-essential mc unzip tree python3-dev vim sudo
RUN rm -rf /varl/lib/apt/lists/*
RUN  wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py
RUN rm get-pip.py
RUN pip install notebook bash-kernel
RUN python3 -m bash_kernel.install
RUN mkdir /opt/oi
RUN chown -R oi:oi /opt/oi
RUN sudo -u oi jupyter notebook --generate-config
COPY jupyter_notebook_config.json /home/oi/.jupyter/
EXPOSE 8888
VOLUME ["/opt/oi"]
WORKDIR /opt/io
USER oi
CMD jupyter notebook --no-browser --ip=0.0.0.0 --notebook-dir /opt/oi
