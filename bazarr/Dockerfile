FROM linuxserver/bazarr:1.6.1@sha256:762f802274598da27255b2e5778f262b2b71b355a23e3812d9ee1520f8dbe37c

# No setuid or setgid binary: the estate's pods do not yet forbid privilege escalation.
RUN find / -xdev -perm /6000 -type f -exec chmod ug-s {} +

COPY bazarr-start /usr/local/bin/bazarr-start

# deploy, which owns the media library and these configs already; the image runs read-only as it.
USER 1000:1000
ENTRYPOINT ["/usr/local/bin/bazarr-start"]
CMD []
