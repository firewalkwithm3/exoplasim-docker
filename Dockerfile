FROM python:3.12-bookworm

# Build args.
ARG UID=1001
ARG GID=1001

# Update sources & upgrade packages.
RUN apt-get update -y
RUN apt-get upgrade -y

# Install bash shell for troubleshooting.
RUN apt-get install -y bash

# Install ExoPlaSim dependencies.
RUN apt-get install -y \
  build-essential gfortran \
  openmpi-bin libopenmpi-dev

# Add python user.
RUN groupadd --force -g "${GID}" python
RUN useradd --create-home --no-log-init -u "${UID}" -g "${GID}" python

# Create build directory
RUN mkdir /build && chown "${UID}:${GID}" /build
VOLUME /build

# Execute as python user from now on.
USER python

# Install python libraries.
RUN pip install --user --no-cache-dir --upgrade pip
RUN pip install --user --no-cache-dir \
  numpy \
  scipy \
  matplotlib \
  netcdf4 \
  h5py \
  pillow \
  exoplasim

# Add pip user binaries to path.
ENV PATH="$PATH:/home/python/.local/bin"

# Set working directory to build directory.
WORKDIR /build

# Run model.
CMD [ "python", "./model.py" ]
