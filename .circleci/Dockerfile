FROM ubuntu:bionic

LABEL maintainer="Germain GAU <germain.gau@gmail.com>"

ENV PATH=/root/.cargo/bin:$PATH

VOLUME /root/.cargo/registry

RUN apt update -y \
  && apt install -y \
      build-essential \
      curl \
  && apt clean

RUN curl -sSf https://sh.rustup.rs > /install_rustup.sh && \
    chmod +x /install_rustup.sh && \
    /install_rustup.sh -y && \
    rm -f /install_rustup.sh

ARG toolchain="stable"
RUN rustup self update && rustup install ${toolchain} && rustup update && rustup default ${toolchain}
RUN rustup component add rustfmt-preview clippy-preview

CMD /bin/bash
