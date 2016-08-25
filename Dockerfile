FROM daocloud.io/python:3-onbuild
RUN mkdir -p /data
COPY . /usr/src/app
WORKDIR /usr/src/app
ENV DJANGO_SETTINGS_MODULE vpn_manager.settings.docker
EXPOSE 8000
ENTRYPOINT [ "/usr/src/app/docker_entrypoint.sh" ]
