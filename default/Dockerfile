FROM python:3-slim

# Install required packages
RUN apt-get update \
  && mkdir -p /usr/share/man/man1 \
  && apt-get install -y \
    apt ca-certificates curl git jq locales openssh-client sudo unzip vim

# Add User
RUN groupadd --gid 3434 circleci \
  && useradd --uid 3434 --gid circleci --shell /bin/bash --create-home circleci \
  && echo 'circleci ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-circleci \
  && echo 'Defaults    env_keep += "DEBIAN_FRONTEND"' >> /etc/sudoers.d/env_keep

# Install Selenium
RUN sudo -u circleci pip3 install --user selenium

# Install Molecule
RUN sudo -u circleci pip3 install --user ansible \
                                         boto \
                                         boto3 \
                                         molecule

USER circleci
ENV PATH /home/circleci/.local/bin:/home/circleci/bin:${PATH}

CMD ["/bin/sh"]
