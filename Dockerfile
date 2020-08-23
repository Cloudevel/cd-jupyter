FROM debian
RUN apt update
RUN apt install -y build-essential curl wget git mc curl python3-dev vim sudo
RUN  wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py
RUN pip install notebook bash-kernel
RUN python3 -m bash_kernel.install
RUN mkdir /opt/oi
RUN groupadd oi
RUN useradd oi -g oi -G sudo -m -p oi
RUN chown -R oi:oi /opt/oi
RUN sudo -u oi jupyter notebook --generate-config
COPY jupyter_notebook_config.json /home/oi/.jupyter/
EXPOSE 8888
WORKDIR /opt/io