# NextID

[English](README.md) · [Türkçe](README.tr.md)

NextID is NextLife's central identity and access management product. It provides a shared identity foundation for people and authorized workloads, so users can securely authenticate across NextLife applications without creating a separate account in every application.

## What does NextID do?

| Capability | Purpose |
|---|---|
| Identity and authentication | Establish a user or authorized workload's identity and manage the authentication lifecycle. |
| Single sign-on (SSO) | Provide shared sign-in across applications that are configured to use NextID. |
| User account and session management | Manage account lifecycle, sessions, logout and credential recovery. |
| Role and group integration | Apply NextRole's approved role and group mappings in NextID; applications enforce their own access controls. |
| Localization and accessibility | Provide NextID-branded login, account, administration and email themes in English and Turkish; accessibility and screen-level verification remain acceptance criteria. |
| Institutional separation | Configure each institution separately while reusing the same product image. |

NextID aims to reduce repeated sign-ins and account-management burden while protecting individuals' identity, privacy and access rights. It is not the institutional role-policy authority or a store for institutions' private configuration.

## Architecture and responsibilities

| Component | Responsibility |
|---|---|
| [NextID-Core](https://github.com/human-centered-computing/nextopensource/tree/main/Core/NextID-Core) | Shared upstream source and core identity capabilities. |
| NextID | Product packaging, identity service, account experience, localization and deployment image. |
| [NextRole](https://github.com/human-centered-computing/nextlife-framework/tree/main/NextRole) | Defines roles, groups and authorization policy; NextID implements approved mappings. |
| [NextConfig](https://github.com/human-centered-computing/nextconfig) | Private, institution-specific configuration, organized by domain and module. |
| [NextLife](https://github.com/human-centered-computing/nextlife-framework) | Uses the shared identity foundation across its modules. |

## Components

- `nextid-core`: identity, session and authorization service built from [NextID-Core](https://github.com/human-centered-computing/nextopensource/tree/main/Core/NextID-Core).
- `nextid-db`: PostgreSQL database.
- `themes/nextid`: NextID user interface themes and translations.

## Run locally

Once the image is published, the deployment uses the following NextID image directly:

```text
ghcr.io/human-centered-computing/nextid:${NEXTID_CORE_IMAGE_TAG:-latest}
```

```bash
cp .env.example .env
# Set unique passwords in .env before starting.
docker compose up -d
```

The isolated pilot is available at http://localhost:8080. The example realm has no real users, clients or institutional secrets.

## Institutional configuration

Institution-specific settings are managed in the independent private [NextConfig](https://github.com/human-centered-computing/nextconfig) repository under institution and module directories. NextRole defines roles and groups; NextID applies the approved mappings in the corresponding realm. No institution-specific configuration is included in this public product repository.

## Build and distribution

`core.lock` pins the reviewed source in NextOpenSource. To build from source rather than pull a released image:

```bash
bash scripts/fetch-core.sh
bash scripts/build-local.sh
NEXTID_IMAGE=nextid NEXTID_CORE_IMAGE_TAG=26.8.2-local docker compose up -d
```

The GitHub Actions workflow builds and checks the image; successful approved main-branch builds publish the NextID image to the organization's GitHub Container Registry. Release tags are created only by a successful run. See [build and deployment notes](docs/BUILD.md).

## Status

Initial public product foundation. Prior candidate builds and synthetic database/realm smoke checks passed. The latest revision, image publication, screen-level testing and independent security and human-benefit verification remain pending. No production deployment is claimed. Upstream notices are retained in [NOTICE](NOTICE); licensing of original product additions must be confirmed before granting redistribution rights.
