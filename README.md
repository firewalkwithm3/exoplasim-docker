# [ExoPlaSim](https://github.com/alphaparrot/ExoPlaSim) Docker Container

## Instructions
1. Create an ExoPlaSim model.
2. Replace the example model in the `build` directory with your own model (keeping the filename `model.py`).
3. Run the docker container (eg. `docker compose run -it --rm exoplasim`).

Output of the simulation will be found inside the `build` directory.

## Optional Environment Variables
- **UID:** UID of python user within the container.
- **GID:** GID of python user's group within the container.
- **BUILD_DIR:** Path to build directory.

