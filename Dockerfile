# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/vscode/devcontainers/typescript-node:bookworm
# Environment variables
ENV USER hoe
ENV HOME /home/$USER
# Build arguments
ARG USER_UID=1049894
ARG USER_GID=$USER_UID

RUN apt update && apt install -y sudo

# Creation of non-root user with sudo
RUN groupadd --gid $USER_GID $USER \
    && useradd --uid $USER_UID --gid $USER_GID -m $USER \
    && echo $USER ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USER \
    && chmod 0440 /etc/sudoers.d/$USER

USER $USER

WORKDIR $HOME
