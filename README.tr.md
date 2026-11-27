# NextID

[English](README.md) · [Türkçe](README.tr.md)

NextID, NextLife uygulamaları için merkezi kimlik ve erişim yönetimi dağıtımıdır. Paket; NextID Core, PostgreSQL, özel temalar, yerelleştirme ve Docker Compose yapılandırmasını içerir.

## Bileşenler

- `nextid-core`: kimlik, oturum ve yetkilendirme servisi; [NextID-Core](https://github.com/human-centered-computing/nextopensource/tree/main/Core/NextID-Core) temelinden derlenir.
- `nextid-db`: PostgreSQL veritabanı.
- `themes/nextid`: NextID kullanıcı arayüzü temaları ve çevirileri.

## Yerel çalıştırma

Dağıtım doğrudan aşağıdaki NextID imajını kullanır:

```text
ghcr.io/human-centered-computing/nextid:${NEXTID_CORE_IMAGE_TAG:-latest}
```

```bash
cp .env.example .env
# Başlatmadan önce .env içinde benzersiz parolalar belirleyin.
docker compose up -d
```

İzole pilot http://localhost:8080 adresinde çalışır. Örnek realm gerçek kullanıcı, istemci veya kurumsal gizli bilgi içermez.

## Derleme ve dağıtım

`core.lock`, NextOpenSource içindeki onaylı kaynak sürümünü sabitler. Yayınlanmış imaj yerine kaynaktan derlemek için:

```bash
bash scripts/fetch-core.sh
bash scripts/build-local.sh
NEXTID_IMAGE=nextid NEXTID_CORE_IMAGE_TAG=26.8.2-local docker compose up -d
```

GitHub Actions iş akışı imajı derleyip kontrol eder; onaylı ana dalın başarılı derlemeleri imajı organizasyonun GitHub Container Registry adresinde yayınlar. Sürüm etiketleri yalnızca başarılı çalıştırma sonucunda oluşur. Bkz. [derleme ve dağıtım notları](docs/BUILD.md).

## Durum

Herkese açık ilk ürün temeli. Derleme, çalışma ve güvenlik doğrulamaları henüz tamamlanmamıştır. Üretim ortamına dağıtım iddia edilmez. Üst kaynak bildirimleri [NOTICE](NOTICE) dosyasında korunur; özgün ürün eklerinin yeniden dağıtım lisansı ayrıca kesinleştirilmelidir.
