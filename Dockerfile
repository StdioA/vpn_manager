FROM daocloud.io/python:3-onbuild
# RUN mkdir -p /usr/src/app
# COPY . /usr/src/app
# WORKDIR /usr/src/app
ENV DJANGO_SETTINGS_MODULE vpn_manager.settings.docker
EXPOSE 8000
RUN bash /usr/src/app/initial_permission.sh
ENTRYPOINT [ "bash", "/usr/src/app/start_server.sh" ]
