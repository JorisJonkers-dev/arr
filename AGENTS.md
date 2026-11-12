# Agents

Guidance for any coding agent working in this repository.

The repository's agent contract is [CLAUDE.md](CLAUDE.md). The estate-wide conventions (labels, traps) are in the [estate contract](https://github.com/JorisJonkers-dev/workspace/blob/main/CLAUDE.md); read both before non-trivial changes.

This repository holds the estate's Sonarr, Radarr and Bazarr images (`sonarr`, `radarr`, `bazarr`) and their deploy Project declaration (`deploy`). Images must run as 1000:1000 under a read-only root filesystem.

## Build and test

- `scripts/smoke-test.sh sonarr:ci radarr:ci bazarr:ci` smoke-tests the three built images (see `.github/workflows/ci.yml`); run it after any Dockerfile change.
- CI also runs shellcheck over `scripts/*.sh` and the start scripts, and actionlint over the workflows.
