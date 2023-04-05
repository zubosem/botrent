FROM postgres:13

# обновление репозиториев
RUN apt-get update

# установка дебаггера
RUN apt-get install -y postgresql-13-pldebugger

# копирование конфига для правки
RUN cp /usr/share/postgresql/postgresql.conf.sample /etc/postgresql/postgresql.conf

# правка конфига, включение отладчика
RUN echo "shared_preload_libraries = '\$libdir/plugin_debugger'" >> /etc/postgresql/postgresql.conf

# установка постгиса, если требуется
# RUN apt-get install -y --no-install-recommends \
#            postgresql-13-postgis-3 \
#            postgresql-13-postgis-3-scripts \
#       && rm -rf /var/lib/apt/lists/*

# копирование скрипта для развертывания
# см подробнее https://hub.docker.com/_/postgres 
COPY ./deploy/202304050315_init_deploy.sql /docker-entrypoint-initdb.d/202304050315_init_deploy.sql