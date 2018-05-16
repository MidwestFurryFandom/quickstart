FROM vmearl/rams:magfest-merge

ADD src plugins/
ADD sideboard-development.ini ./development.ini
ADD uber-wrapper.sh /usr/local/bin/
RUN /app/env/bin/paver install_deps

ENTRYPOINT ["uber-wrapper.sh"]
CMD ["uber"]