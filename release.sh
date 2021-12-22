# /bin/bash

# if .env dir exists, then activate it
# else exec virtualenv -p python3.10 .env -vvv
if [ -d .env ]; then
    echo "Activating virtualenv..."
    source .env/bin/activate
else 
    echo "Creating virtualenv..."
    virtualenv -p python3.10 .env -vvv
fi

which python
python  --version
pip install "check-manifest==0.42"
pip install devpi-client
devpi use https://root:${DEVPI_ROOT_PASSWORD}@devpi.student.com
devpi login root --password=${DEVPI_ROOT_PASSWORD}
devpi use root/prod
devpi upload
devpi logoff
