#!/bin/bash
set -e

# make a temporary directory for the install
TEMP=$(mktemp -d ./tmp.XXXXXX)
pushd $TEMP

# create a virtual env 
python3 -m venv python
source python/bin/activate

# install python dependencies
pip install -r ../requirements.txt

# create a bin dir for ffmpeg
mkdir -p bin
curl https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-amd64-static.tar.xz -o ffmpeg.tar.xz
tar -xf ffmpeg.tar.xz -C bin --strip-components 1


# zip the layer
zip -r ../ffmpeg-layer.zip . --include "python/lib/*/site-packages/*" bin/ffmpeg bin/readme.txt


# cleanup temp dir
popd
rm -rf $TEMP