FROM continuumio/miniconda3:4.8.2

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y netcdf-bin vim npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# # 安装miniconda3
# # 1.开机时自动加载profile.d中的环境变量
# # 2.wget --quiet不显示输出信息, -O重命名
# # 3.miniconda.sh脚本中注释-b为batch mode(without manaul intervention),-p为install prefix
# ENV PATH /app/conda/bin:$PATH
# RUN echo 'export PATH=/app/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
#     wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \   
#     /bin/bash ~/miniconda.sh -b -p /app/conda

COPY environment.yaml /tmp/

# 加入清华镜像源
RUN /bin/bash -c "source ~/.bashrc && \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/ && \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/ && \
    conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/ && \
    conda config --set show_channel_urls yes && \
    pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U" && \
    conda env update -f /tmp/environment.yaml && \
    jupyter labextension install @pyviz/jupyterlab_pyviz

COPY salem-sample-data* ~/.salem_cache

CMD [ "/bin/bash" ]