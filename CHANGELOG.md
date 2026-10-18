# Changelog

## [1.0.2](https://github.com/JorisJonkers-dev/arr/compare/v1.0.1...v1.0.2) (2026-10-18)


### Bug Fixes

* clear every setuid and setgid bit, so s6 starts as deploy where the pod allows privilege escalation ([#6](https://github.com/JorisJonkers-dev/arr/issues/6)) ([16cd2aa](https://github.com/JorisJonkers-dev/arr/commit/16cd2aaaa4a7a331572c674e31175c1b8072e9ec))

## [1.0.1](https://github.com/JorisJonkers-dev/arr/compare/v1.0.0...v1.0.1) (2026-10-18)


### Bug Fixes

* give each app's config a claim of its own name, so the three do not share one ([#4](https://github.com/JorisJonkers-dev/arr/issues/4)) ([c91f4b0](https://github.com/JorisJonkers-dev/arr/commit/c91f4b046673e7f41cbee7edc7fd5aa240b29382))

## 1.0.0 (2026-10-18)


### Features

* sonarr, radarr and bazarr as deploy under a read-only root, mounting the media library, and their Project Intent ([622c901](https://github.com/JorisJonkers-dev/arr/commit/622c901c9e41321d8d74c47bbeb94a844a63d492))
