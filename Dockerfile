FROM amazon/aws-eb-python:3.4.2-onbuild-3.5.1

RUN apt-get update && apt-get install -y \
cython3 \
gfortran \
libatlas-dev \
libblas-dev \
liblapack-dev \
libopenblas-dev \
python3-dev \
python3-numpy \
python3-scipy \
python3-setuptools \
&& rm -rf /var/lib/apt/lists/*

# Add and install secondary Python modules
RUN if [ -f aws-post-install/requirements.txt ]; then /var/app/bin/pip install -r aws-post-install/requirements.txt; fi

EXPOSE 8080
