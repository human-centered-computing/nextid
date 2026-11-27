# harran.edu.tr — NextID institutional configuration

[English](README.md) · [Türkçe](README.tr.md)

This directory is the single configuration workspace for Harran's NextID deployment. Product source, shared NextID-Core and generic image build files remain at their established locations. All Harran-specific NextID configuration belongs here, not in another cluster folder or in the product root.

| Area | Responsibility |
|---|---|
| [Realm configuration](realm-config/README.md) | Institution-specific identity, realm settings, client definitions and authentication policy |
| [Roles and groups](roles-and-groups/README.md) | NextRole-defined role and group mappings implemented in the relevant NextID realm |
| [Deployment configuration](deployment/README.md) | Institution-specific Docker, networking, hostname, TLS and external integration settings |

The product image is `ghcr.io/human-centered-computing/nextid`. A tenant's configuration is separate from that image.

This is a configuration workspace, not a created or running infrastructure cluster. No institutional users, private access mappings, secrets, credentials or production configuration have been imported. The repository is public; sensitive configuration must remain in an approved restricted store and be injected at deployment. The human institution owner and acceptance criteria are to be recorded before activation.
