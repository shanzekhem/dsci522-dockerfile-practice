FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-osx-arm64.lock /tmp/conda.lock
RUN conda create --name dockerlock --file /tmp/conda.lock

EXPOSE 8888

ENV PATH=/opt/conda/envs/dockerlock/bin:$PATH

WORKDIR /workplace

CMD ["conda", "run", "--no-capture-output", "-n", "dockerlock", "jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--IdentityProvider.token=''", "--ServerApp.password=''"]
