

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source="https://github.com/qs5779/python-multi"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.authors="Quien Sabe <qs5779@mail.com>"
LABEL org.opencontainers.image.description="Multiple Python versions and tox installed into Ubuntu LTS 20.04"

# Install dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    xz-utils \
    tk-dev \
    libxml2-dev \
    libxmlsec1-dev \
    git \
    ca-certificates \
    libffi-dev \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /var/cache/apt/archives/*.deb

# Install ``pyenv``.
RUN git clone https://github.com/pyenv/pyenv /root/.pyenv

# Install the desired versions of Python.
# RUN for PYTHON_VERSION in 3.6.15 3.7.14 3.8.14 3.9.14 3.10.7 pypy3.8-7.3.9; do \
RUN for PYTHON_VERSION in 3.10.7; do \
    set -ex \
    && /root/.pyenv/bin/pyenv install ${PYTHON_VERSION} \
    && /root/.pyenv/versions/${PYTHON_VERSION}/bin/python -m pip install --upgrade pip \
    && /root/.pyenv/versions/${PYTHON_VERSION}/bin/python -m pip install tox \
    ; done

# Add to PATH, in order of lowest precedence to highest.
ENV PATH /root/.pyenv/versions/pypy3.8-7.3.9/bin:${PATH}
ENV PATH /root/.pyenv/versions/3.6.15/bin:${PATH}
ENV PATH /root/.pyenv/versions/3.7.14/bin:${PATH}
ENV PATH /root/.pyenv/versions/3.8.14/bin:${PATH}
ENV PATH /root/.pyenv/versions/3.9.14/bin:${PATH}
ENV PATH /root/.pyenv/versions/3.10.7/bin:${PATH}

CMD ["python3.10"]
