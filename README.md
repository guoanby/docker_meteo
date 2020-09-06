# conda mirror
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
conda config --set show_channel_urls yes

# pip mirror
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U

# Including packages 
xarray iris python-cdo pynco pynio pyngl cfgrib wrf-python cartopy seaborn cmaps geoviews jupyterlab rioxarray regionmask salem==0.2.4 descartes metpy satpy siphon statsmodels xskillscore eofs lxml beautifulsoup4 flask scikit-learn catboost lightgbm xgboost tpot h2o tsfresh arrow pathlib 

# Usage
Create a python3 enviroment of meteorology in Docker image by using dockerfile.
```bash
git clone https://github.com/guoanby/docker_meteo.git
cd docker_meteo
docker build -t <image>:<tag> .
```