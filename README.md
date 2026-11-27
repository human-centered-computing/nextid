# NextID

[English](README.md) · [Türkçe](README.tr.md)

NextID is the central identity and access management distribution for NextLife applications. The package includes NextID Core, PostgreSQL, custom themes, localization and Docker Compose configuration.

## Components

- `nextid-core`: identity, session and authorization service built from [NextID-Core](https://github.com/human-centered-computing/nextopensource/tree/main/Core/NextID-Core).
- `nextid-db`: PostgreSQL database.
- `themes/nextid`: NextID user interface themes and translations.

## Run locally

The deployment uses the following NextID image directly:

```text
ghcr.io/human-centered-computing/nextid:${NEXTID_CORE_IMAGE_TAG:-latest}
```

```bash
cp .env.example .env
# Set unique passwords in .env before starting.
docker compose up -d
```

The isolated pilot is available at http://localhost:8080. The example realm has no real users, clients or institutional secrets.

## Build and distribution

`core.lock` pins the reviewed source in NextOpenSource. To build from source rather than pull a released image:

```bash
bash scripts/fetch-core.sh
bash scripts/build-local.sh
NEXTID_IMAGE=nextid NEXTID_CORE_IMAGE_TAG=26.8.2-local docker compose up -d
```

The GitHub Actions workflow builds and checks the image; successful approved main-branch builds publish the NextID image to the organization's GitHub Container Registry. Release tags are created only by a successful run. See [build and deployment notes](docs/BUILD.md).

## Status

Initial public product foundation. Build, runtime and security verification are not yet complete. No production deployment is claimed. Upstream notices are retained in [NOTICE](NOTICE); licensing of original product additions must be confirmed before granting redistribution rights.
