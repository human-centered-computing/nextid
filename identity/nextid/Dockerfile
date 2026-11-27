ARG CORE_IMAGE=nextid-core:26.8.2-local
FROM ${CORE_IMAGE}
LABEL org.opencontainers.image.source="https://github.com/human-centered-computing/nextid" \
      org.opencontainers.image.title="NextID"
COPY --chown=1000:0 themes/nextid/ /opt/keycloak/themes/nextid/
RUN /opt/keycloak/bin/kc.sh build --db=postgres --health-enabled=true
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
