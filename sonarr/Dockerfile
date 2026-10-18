FROM linuxserver/sonarr:4.0.19.2979-ls322@sha256:c19aa4ecdf03d73e1d5c901da33744cb7eb4d921f89bafed1ca264601d7fa224

# No setuid or setgid binary: the estate's pods do not yet forbid privilege escalation, and
# s6's setuid helper would otherwise run as root and then fail without capabilities.
RUN find / -xdev -perm /6000 -type f -exec chmod ug-s {} +

# deploy, which owns the media library and these configs already; the image runs read-only as it.
USER 1000:1000
