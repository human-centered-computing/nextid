# NextID

[English](README.md) · [Türkçe](README.tr.md) · [Deutsch](README.de.md) · [العربية](README.ar.md)

NextID, NextLife'ın merkezi kimlik ve erişim yönetimi ürünüdür. İnsanlar ve yetkilendirilmiş yazılım bileşenleri için ortak kimlik temeli sağlar. Böylece kullanıcılar her uygulama için ayrı bir hesap oluşturmak zorunda kalmadan NextLife uygulamalarında güvenli biçimde kimlik doğrulayabilir.

## NextID ne yapar?

| Yetenek | Amaç |
|---|---|
| Kimlik ve kimlik doğrulama | Kullanıcının veya yetkili yazılım bileşeninin kimliğini doğrular ve kimlik doğrulama yaşam döngüsünü yönetir. |
| Tek oturum açma (SSO) | NextID ile bütünleştirilen uygulamalarda ortak oturum açma sağlar. |
| Hesap ve oturum yönetimi | Hesap yaşam döngüsünü, oturumları, çıkışı ve kimlik bilgisi kurtarmayı yönetir. |
| Rol ve grup entegrasyonu | NextRole'un onaylı rol ve grup eşlemelerini NextID'de uygular; uygulamalar kendi erişim kontrollerini yürütür. |
| Yerelleştirme ve erişilebilirlik | Giriş, hesap, yönetim ve e-posta ekranları için NextID temaları ile İngilizce ve Türkçe desteği sağlar; erişilebilirlik ve ekran bazında doğrulama kabul ölçütüdür. |
| Kurumsal ayrım | Ortak ürün imajını kullanırken her kurumun yapılandırmasını ayrı yönetir. |

NextID'nin amacı, insanların tekrarlanan giriş ve hesap yönetimi yükünü azaltırken kimliğini, gizliliğini ve erişim haklarını korumaktır. Kurumsal rol politikalarının sahibi veya kurumların gizli yapılandırmalarının saklandığı yer değildir.

## Mimari ve sorumluluklar

| Bileşen | Sorumluluk |
|---|---|
| [NextID-Core](https://github.com/human-centered-computing/nextopensource/tree/main/Core/NextID-Core) | Ortak kaynak kodu ve temel kimlik yetenekleri. |
| NextID | Ürün paketleme, kimlik servisi, hesap deneyimi, yerelleştirme ve dağıtım imajı. |
| [NextRole](https://github.com/human-centered-computing/nextlife-framework/tree/main/NextRole) | Rol, grup ve yetki politikalarını tanımlar; NextID onaylı eşlemeleri uygular. |
| [NextConfig](https://github.com/human-centered-computing/nextconfig) | Kurumların alan adı ve modül bazında ayrılmış gizli yapılandırmaları. |
| [NextLife](https://github.com/human-centered-computing/nextlife-framework) | Ortak kimlik temelini modüllerinde kullanır. |

## Bileşenler

- `nextid-core`: kimlik, oturum ve yetkilendirme servisi; [NextID-Core](https://github.com/human-centered-computing/nextopensource/tree/main/Core/NextID-Core) temelinden derlenir.
- `nextid-db`: PostgreSQL veritabanı.
- `themes/nextid`: NextID kullanıcı arayüzü temaları ve çevirileri.

## Yerel çalıştırma

İmaj yayınlandıktan sonra dağıtım doğrudan aşağıdaki NextID imajını kullanır:

```text
ghcr.io/human-centered-computing/nextid:${NEXTID_CORE_IMAGE_TAG:-latest}
```

```bash
cp .env.example .env
# Başlatmadan önce .env içinde benzersiz parolalar belirleyin.
docker compose up -d
```

İzole pilot http://localhost:8080 adresinde çalışır. Örnek realm gerçek kullanıcı, istemci veya kurumsal gizli bilgi içermez.

## Kurum yapılandırmaları

Kuruma özgü ayarlar bağımsız gizli [NextConfig](https://github.com/human-centered-computing/nextconfig) deposunda kurum ve modül klasörleri altında yönetilir. NextRole rol ve grupları tanımlar, NextID onaylı eşlemeleri ilgili realm'de uygular. Bu açık ürün deposu kurum yapılandırmalarını içermez.

## Derleme ve dağıtım

`core.lock`, NextOpenSource içindeki onaylı kaynak sürümünü sabitler. Yayınlanmış imaj yerine kaynaktan derlemek için:

```bash
bash scripts/fetch-core.sh
bash scripts/build-local.sh
NEXTID_IMAGE=nextid NEXTID_CORE_IMAGE_TAG=26.8.2-local docker compose up -d
```

GitHub Actions iş akışı imajı derleyip kontrol eder; onaylı ana dalın başarılı derlemeleri imajı organizasyonun GitHub Container Registry adresinde yayınlar. Sürüm etiketleri yalnızca başarılı çalıştırma sonucunda oluşur. Bkz. [derleme ve dağıtım notları](docs/BUILD.md).

## Durum

Herkese açık ilk ürün temeli. Önceki aday sürümlerin derleme ve sentetik veritabanı/realm çalışma kontrolleri başarılıdır. Son sürüm, imaj yayını, ekran bazında testler, bağımsız güvenlik ve insan faydası doğrulaması henüz tamamlanmamıştır. Üretim ortamına dağıtım iddia edilmez. Üst kaynak bildirimleri [NOTICE](NOTICE) dosyasında korunur; özgün ürün eklerinin yeniden dağıtım lisansı ayrıca kesinleştirilmelidir.
