FROM postgres:13

RUN apt-get update

RUN apt-get install -y postgresql-13-pldebugger

RUN cp /usr/share/postgresql/postgresql.conf.sample /etc/postgresql/postgresql.conf

RUN echo "shared_preload_libraries = '\$libdir/plugin_debugger'" >> /etc/postgresql/postgresql.conf

RUN apt-get install -y --no-install-recommends \
           postgresql-13-postgis-3 \
           postgresql-13-postgis-3-scripts \
      && rm -rf /var/lib/apt/lists/*

COPY ./deploy/202304050315_init_deploy.sql /docker-entrypoint-initdb.d/202304050315_init_deploy.sql