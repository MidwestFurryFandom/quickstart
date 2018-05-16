FROM vmearl/rams:magfest-merge

ADD src plugins/
ADD sideboard-development.ini ./development.ini
RUN /app/env/bin/paver install_deps

ADD uber-wrapper.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/uber-wrapper.sh
ENTRYPOINT ["uber-wrapper.sh"]
CMD ["uber"]