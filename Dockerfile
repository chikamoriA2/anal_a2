FROM continuumio/anaconda3

RUN pip install --upgrade pip

RUN apt-get update && apt-get install -y zip unzip jq vim htop 
RUN apt-get install -y parallel
RUN apt-get install -y sra-toolkit

COPY ./.alias /root
RUN cat /root/.alias >> /root/.bashrc

WORKDIR /workdir

ENTRYPOINT ["jupyter-lab", "--NotebookApp.ip=0.0.0.0", "--port=36541", "--no-browser", "--allow-root", "--NotebookApp.token='mNFS7wbnEIm/Cd/PTe4h/cgboVXIUBszH5MxU8o7rFg'", "--NotebookApp.allow_origin='*'"]

CMD ["--notebook-dir=/workdir"]
# 上のコマンドが、作業ディレクトリーの名前を定義するものです。
# 例えば、`import os`して、`print(os.getcwd())`すると、/workdirが出てきます。

