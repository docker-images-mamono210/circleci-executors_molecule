FROM circleci/python:3.8

# Install Docker
RUN pip3 install --user docker

# Install Molecule
RUN pip3 install --user molecule molecule-ec2
