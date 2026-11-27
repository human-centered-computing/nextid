# NextID

> Übersetzungsstatus: KI-unterstützter Entwurf, menschliche Sprachprüfung ausstehend.

[English](README.md) · [Türkçe](README.tr.md) · [Deutsch](README.de.md) · [العربية](README.ar.md)

NextID ist das zentrale Identitäts- und Zugriffsmanagement von NextLife. Menschen und autorisierte Softwarekomponenten erhalten eine gemeinsame Identitätsgrundlage für sichere Anmeldung bei integrierten Anwendungen, ohne separate Konten.

## Was leistet NextID?

| Fähigkeit | Zweck |
|---|---|
| Identität und Authentifizierung | Identität und Authentifizierungslebenszyklus verwalten. |
| Single Sign-on | Gemeinsame Anmeldung bei integrierten Anwendungen. |
| Konten und Sitzungen | Lebenszyklus, Abmeldung und Wiederherstellung verwalten. |
| Rollen und Gruppen | Genehmigte Zuordnungen von NextRole umsetzen; Anwendungen erzwingen ihre Zugriffskontrollen. |
| Lokalisierung und Barrierefreiheit | NextID-Anmelde-, Konto-, Verwaltungs- und E-Mail-Themen auf Englisch und Türkisch; Prüfung der Oberflächen und Barrierefreiheit bleibt erforderlich. |
| Institutionelle Trennung | Gemeinsames Produktimage, getrennte Konfigurationen. |

Ziel ist weniger Anmelde- und Verwaltungsaufwand bei Schutz von Identität, Privatsphäre und Zugriffsrechten; NextID ist weder die Autorität für institutionelle Rollenrichtlinien noch der Speicher privater Konfigurationen.

## Architektur und Zuständigkeiten

| Komponente | Zuständigkeit |
|---|---|
| [NextID-Core](https://github.com/human-centered-computing/nextopensource/tree/main/Core/NextID-Core) | Gemeinsamer Quellcode und Identitätsgrundlage |
| NextID | Produktpaketierung, Identitätsdienst, Kontenerlebnis, Lokalisierung und Image |
| [NextRole](https://github.com/human-centered-computing/nextlife-framework/tree/main/NextRole) | Rollen, Gruppen und Zugriffsrichtlinien |
| [NextConfig](https://github.com/human-centered-computing/nextconfig) | Private Konfiguration je Institution/Domain und Modul |
| [NextLife](https://github.com/human-centered-computing/nextlife-framework) | Gemeinsame Identitätsgrundlage der Module |

## Komponenten

- `nextid-core`: Identitäts-, Sitzungs- und Autorisierungsdienst aus NextID-Core.
- `nextid-db`: PostgreSQL.
- `themes/nextid`: Oberflächenthemen und Übersetzungen.

## Lokal ausführen

Nach Veröffentlichung verwendet die Distribution das Image:

```text
ghcr.io/human-centered-computing/nextid:${NEXTID_CORE_IMAGE_TAG:-latest}
```

```bash
cp .env.example .env
# Set unique passwords in .env before starting.
docker compose up -d
```

Isolierter Pilot: http://localhost:8080. Beispielrealm ohne reale Nutzer, Clients oder institutionelle Geheimnisse.

## Institutionelle Konfiguration

Private [NextConfig](https://github.com/human-centered-computing/nextconfig)-Verzeichnisse nach Institution und Modul. NextRole definiert Rollen/Gruppen, NextID setzt genehmigte Zuordnungen im Realm um. Keine institutionellen Einstellungen in diesem öffentlichen Produktrepository.

## Build und Distribution

`core.lock` fixiert den geprüften Quellstand. Lokaler Quellbuild:

```bash
bash scripts/fetch-core.sh
bash scripts/build-local.sh
NEXTID_IMAGE=nextid NEXTID_CORE_IMAGE_TAG=26.8.2-local docker compose up -d
```

GitHub Actions baut und prüft; erfolgreiche genehmigte Builds des Hauptzweigs veröffentlichen im Container Registry der Organisation. Tags entstehen erst bei erfolgreichem Lauf. Siehe [Build und Bereitstellung](docs/BUILD.md).

## Status

Öffentliche Produktgrundlage; Kandidatenbuilds und synthetische Datenbank-/Realm-Smoke-Tests waren erfolgreich. Veröffentlichung, Oberflächenprüfung, unabhängige Sicherheits- und Nutzenvalidierung gesondert verifizieren. Keine Produktionsbereitstellung behauptet. [NOTICE](NOTICE) enthält Upstream-Hinweise; Lizenz eigener Ergänzungen vor Gewährung von Weiterverbreitungsrechten klären.
