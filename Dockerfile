FROM quay.io/jupyter/minimal-notebook

COPY conda-linux-64.lock /tmp/conda-linux-64.lock
RUN mamba create -y --name myenv --file /tmp/conda-linux-64.lock \
    && mamba clean --all -y -f \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"
