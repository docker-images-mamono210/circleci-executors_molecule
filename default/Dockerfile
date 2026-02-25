FROM python:3-slim

RUN apt-get update \
  && mkdir -p /usr/share/man/man1 \
  && apt-get install -y --no-install-recommends \
    apt ca-certificates curl git jq locales openssh-client sudo unzip vim \
  && rm -rf /var/lib/apt/lists/*

# Add User
RUN groupadd --gid 3434 circleci \
  && useradd --uid 3434 --gid circleci --shell /bin/bash --create-home circleci \
  && echo 'circleci ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-circleci \
  && echo 'Defaults env_keep += "DEBIAN_FRONTEND"' >> /etc/sudoers.d/env_keep

# ★重要: python に紐づけて pip を使う / system install（--user をやめる）
RUN python -m pip install --upgrade pip \
  && python -m pip install \
    selenium \
    requests \
    ansible \
    boto \
    boto3 \
    molecule

USER circleci
CMD ["/bin/sh"]
