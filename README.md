# awscli-test-install-circleci-node-docker [![CircleCI](https://circleci.com/gh/muhammed-sayadi/awscli-test-install-circleci-node-docker.svg?style=shield)](https://circleci.com/gh/muhammed-sayadi/awscli-test-install-circleci-node-docker)
A minimal example to use AWS command line tools (awscli) in Circle's node docker images.

## The Usual Installation Steps
Installing aswcli can be done in many ways. One way that usually works well is to download the awscli bundle, extract it,
and run the install script, as follows:
```
##################
# Install AWS CLI
##################

# Download awscli bundle
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"

# Unzip the downloaded bundle
unzip awscli-bundle.zip

# Run the install script and install to ~/bin/aws directory
./awscli-bundle/install -b ~/bin/aws
```

## The Problem
On Circle's node docker images, the install step is failing with the, rather not so clear, error message:
```
Failed building wheel for PyYAML
Command "/home/circleci/.local/lib/aws/bin/python -u -c "import setuptools, tokenize;__file__='/tmp/pip-build-yZn5mZ/PyYAML/
setup.py';f=getattr(tokenize, 'open', open)(__file__);code=f.read().replace('\r\n', '\n');f.close();exec(compile(code,
__file__, 'exec'))" install --record /tmp/pip-gfRW6P-record/install-record.txt --single-version-externally-managed 
--compile --install-headers /home/circleci/.local/lib/aws/include/site/python2.7/PyYAML" failed with error code 1 in 
/tmp/pip-build-yZn5mZ/PyYAML/
```

## The Solution
The actual missing python package is actually libpython-dev which can be installed with the following (on Ubuntu):
```
sudo apt-get install -y libpython-dev
```

So, the full script becomes:
```
##################
# Install AWS CLI
##################

# For node images on Circle, install libpython-dev
sudo apt-get install -y libpython-dev

# Download awscli bundle
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"

# Unzip the downloaded bundle
unzip awscli-bundle.zip

# Run the install script and install to ~/bin/aws directory
./awscli-bundle/install -b ~/bin/aws
```

Note that to use the awscli afterwards, you need to specify the path to the exectuable:
```
~/bin/aws s3 ls
```
