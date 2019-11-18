FROM vmearl/rams:magfest-merge

# install ghostscript
RUN apt-get update && apt-get install -y ghostscript && rm -rf /var/lib/apt/lists/*

ADD src plugins/
ADD sideboard-development.ini ./development.ini
ADD uber-wrapper.sh /usr/local/bin/
RUN /app/env/bin/paver install_deps

ENTRYPOINT ["uber-wrapper.sh"]
CMD ["uber"]