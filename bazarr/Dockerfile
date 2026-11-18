FROM linuxserver/bazarr:1.6.2@sha256:832820dec70bce9e912c6eee7a95baf6551e03dbc63325a7208daaa455423752

# No setuid or setgid binary: the estate's pods do not yet forbid privilege escalation.
RUN find / -xdev -perm /6000 -type f -exec chmod ug-s {} +

COPY bazarr-start /usr/local/bin/bazarr-start

# deploy, which owns the media library and these configs already; the image runs read-only as it.
USER 1000:1000
ENTRYPOINT ["/usr/local/bin/bazarr-start"]
CMD []
