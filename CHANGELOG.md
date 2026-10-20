# Changelog

## [1.1.0](https://github.com/JorisJonkers-dev/arr/compare/v1.0.4...v1.1.0) (2026-10-19)


### Features

* declare the edges to prowlarr and qbittorrent, so each is reached by its Application Id ([#14](https://github.com/JorisJonkers-dev/arr/issues/14)) ([218bc4f](https://github.com/JorisJonkers-dev/arr/commit/218bc4ff2cb51d6c2f8ba36f357ba6a849c0e271))

## [1.0.4](https://github.com/JorisJonkers-dev/arr/compare/v1.0.3...v1.0.4) (2026-10-19)


### Bug Fixes

* point sonarr's and radarr's TMPDIR at /tmp, since the image's sits below /run ([#12](https://github.com/JorisJonkers-dev/arr/issues/12)) ([dd4bb43](https://github.com/JorisJonkers-dev/arr/commit/dd4bb43bb9b4100c089228e7eda9e15d5fe5cbc6))

## [1.0.3](https://github.com/JorisJonkers-dev/arr/compare/v1.0.2...v1.0.3) (2026-10-18)


### Bug Fixes

* start each app directly as deploy, without s6, which a pod's root-owned /run stops ([#8](https://github.com/JorisJonkers-dev/arr/issues/8)) ([5356cb2](https://github.com/JorisJonkers-dev/arr/commit/5356cb264dd0d6a16af715b56267d8dfb7292a56))

## [1.0.2](https://github.com/JorisJonkers-dev/arr/compare/v1.0.1...v1.0.2) (2026-10-18)


### Bug Fixes

* clear every setuid and setgid bit, so s6 starts as deploy where the pod allows privilege escalation ([#6](https://github.com/JorisJonkers-dev/arr/issues/6)) ([16cd2aa](https://github.com/JorisJonkers-dev/arr/commit/16cd2aaaa4a7a331572c674e31175c1b8072e9ec))

## [1.0.1](https://github.com/JorisJonkers-dev/arr/compare/v1.0.0...v1.0.1) (2026-10-18)


### Bug Fixes

* give each app's config a claim of its own name, so the three do not share one ([#4](https://github.com/JorisJonkers-dev/arr/issues/4)) ([c91f4b0](https://github.com/JorisJonkers-dev/arr/commit/c91f4b046673e7f41cbee7edc7fd5aa240b29382))

## 1.0.0 (2026-10-18)


### Features

* sonarr, radarr and bazarr as deploy under a read-only root, mounting the media library, and their Project Intent ([622c901](https://github.com/JorisJonkers-dev/arr/commit/622c901c9e41321d8d74c47bbeb94a844a63d492))
