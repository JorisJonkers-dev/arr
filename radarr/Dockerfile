FROM linuxserver/radarr:6.3.0.10514-ls314@sha256:119aaa4a4f7349bcd2a136c5373a0d7925b5479915c7dfe0c0ad352db2a6d438

# No setuid or setgid binary: the estate's pods do not yet forbid privilege escalation.
RUN find / -xdev -perm /6000 -type f -exec chmod ug-s {} +

COPY radarr-start /usr/local/bin/radarr-start

# deploy, which owns the media library and these configs already; the image runs read-only as it.
USER 1000:1000
ENTRYPOINT ["/usr/local/bin/radarr-start"]
CMD []
