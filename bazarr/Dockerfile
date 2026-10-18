FROM linuxserver/bazarr:1.5.6@sha256:047222423d6d8556a88581b189175bec57f286f120b52ba29c0390fe6babaa5a

# No setuid or setgid binary: the estate's pods do not yet forbid privilege escalation, and
# s6's setuid helper would otherwise run as root and then fail without capabilities.
RUN find / -xdev -perm /6000 -type f -exec chmod ug-s {} +

# deploy, which owns the media library and these configs already; the image runs read-only as it.
USER 1000:1000
