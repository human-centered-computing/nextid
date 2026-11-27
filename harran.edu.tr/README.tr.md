# harran.edu.tr — NextID kurum yapılandırması

[English](README.md) · [Türkçe](README.tr.md)

Bu klasör, Harran'ın NextID dağıtımına ait tek kurum yapılandırma alanıdır. Ürün kaynakları, ortak NextID-Core ve genel imaj derleme dosyaları mevcut konumlarında kalır. Harran'a özel tüm NextID yapılandırmaları doğrudan bu klasör altında tutulur.

| Alan | Sorumluluk |
|---|---|
| [Realm yapılandırması](realm-config/README.md) | Kuruma özel kimlik, realm ayarları, istemci tanımları ve kimlik doğrulama politikası |
| [Rol ve gruplar](roles-and-groups/README.md) | NextRole tarafından tanımlanan rollerin ve grupların ilgili NextID realm'inde uygulanması |
| [Dağıtım yapılandırması](deployment/README.md) | Kuruma özel Docker, ağ, alan adı, TLS ve dış sistem entegrasyon ayarları |

Ürün imajı: `ghcr.io/human-centered-computing/nextid`. Kurum yapılandırması imajdan ayrı tutulur.

Bu bir yapılandırma alanıdır; çalışan bir altyapı kümesi oluşturulmamıştır. Gerçek kurum kullanıcıları, özel erişim eşlemeleri, parolalar, anahtarlar ve üretim ayarları taşınmamıştır. Depo herkese açık olduğundan hassas ayarlar onaylı erişim kısıtlı bir alanda saklanır ve çalışma anında aktarılır. Etkinleştirme öncesinde kurum sorumlusu ve kabul ölçütleri kaydedilir.
