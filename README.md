# 镜像
## conda mirror  
```bash
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/  
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/  
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/  
conda config --set show_channel_urls yes
```

## pip mirror  
```bash
pip install pip -U
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```

# Including packages   
xarray iris cinrad python-cdo pynco pynio pyngl cfgrib wrf-python cartopy seaborn cmaps geoviews jupyterlab rioxarray regionmask salem==0.2.4 descartes metpy satpy siphon statsmodels xskillscore eofs lxml beautifulsoup4 flask scikit-learn catboost lightgbm xgboost tpot h2o tsfresh arrow pathlib

# Usage  
Create a Docker image of python3 enviroment about meteorology by dockerfile.  
```bash
git clone https://github.com/guoanby/docker_meteo.git
cd docker_meteo
# create image
docker build -t guoanby/meteo_linux:1.0 .
# create container
docker run -it --name=pythonenv -v /e:/mnt/e guoanby/meteo_linux:1.0 /bin/bash
```

# Update enviorment
```bash
# push docker
docker commit pythonenv guoanby/meteo_linux:<tag>
docker push guoanby/meteo_linux:<tag>
# push git
cd docker_meteo
conda env export > environment.yaml
git add . 
git commit -m  "add ... packages"
git push -u origin master
```