# arr

[Sonarr](https://sonarr.tv), [Radarr](https://radarr.video) and
[Bazarr](https://www.bazarr.media) as the estate runs them: the
[linuxserver.io](https://www.linuxserver.io) images, run as `deploy`
(1000:1000) under a read-only root filesystem. deploy-kit delivers them as the
Project `arr`.

## What the images change

Each `Dockerfile` names `USER 1000:1000` and nothing else. linuxserver's images
already support running read-only as a non-root user. This repository states
the user in the image, so the estate's images lock records it. `/run`, `/tmp`
and `/config` are the only writable paths.

## Running it

`deploy/arr.project.yml` and `deploy/env/` declare the Project:
- **media:** each app mounts the Platform document's `media` library's
  folders at the paths its database already names: `/media/Completed`,
  `/media/Series` and `/media/Films`;
- **config:** each app's config is a claim of its own, which the platform's
  `file-backup` copies nightly.

prowlarr and the download client stay with the downloader. Each app keeps its
links to the others in its own settings.

Each release builds the images and publishes the Intent Fragment that the
estate composes. `scripts/smoke-test.sh` starts each image restricted and waits
until it serves; CI runs it on every change.

## Licence

This repository's own files are MIT: see [LICENSE](LICENSE). Sonarr, Radarr
and Bazarr are GPL-3.0, as are the linuxserver.io images built from them.
