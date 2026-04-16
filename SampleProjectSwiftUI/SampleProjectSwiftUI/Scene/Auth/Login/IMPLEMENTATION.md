# Login Ekranı Implementasyonu

## Proje Yapısına Uyumlu Dosyalar

İki dosya oluşturdum ve projede kullanılan desenlere uygun şekilde yapılandırdım:

1. **[LoginSceneModel.swift](LoginSceneModel.swift)** - View Model
2. **[LoginScene.swift](LoginScene.swift)** - View

## Mimari Yapı

### Scene-ViewModel Deseni
Projedeki diğer sahneler (RecipesScene, OnboardingScene, vb.) ile aynı deseni takip eder:
- `LoginScene<ViewModel: LoginSceneModel>` - Generic View yapısı
- `LoginSceneModel: BaseSceneModel` - ViewModel yapısı
- `BaseScene` wrapper ile içerik yönetimi

### Durum Yönetimi
```swift
@Published var email: String
@Published var password: String
@Published var emailError: String?
@Published var passwordError: String?
```

## Görselindeki Tasarımla Uyum

### 1. Email Alanı (E-mail Adresi)
- **Ikon**: `envelope.fill` (posta simgesi)
- **Placeholder**: "E-mail Adresi"
- **Valdiasyon**: Real-time email format kontrolü
- **Hata Durumu**: Kırmızı border (Color.appAction2) ve hata metni

### 2. Şifre Alanı (Sifre)
- **Ikon**: `lock.fill` (kilit simgesi)
- **Placeholder**: "Şifre"
- **Göz İkonu**: Şifreyi göster/gizle toggle
- **Valdiasyon**: 6 karakter minimum kontrol
- **Hata Durumu**: Kırmızı border ve hata metni

### 3. Girişş Yap Butonu
- **Stil**: `PrimaryLargeButton()` - Projede tanımlanmış stil
- **Boyut**: 56pt yükseklik, ful width
- **Aktiflik**: Email ve şifre boş değilken deaktif

### 4. Şifrenizi mi unuttunuz? Linki
- **Konum**: Şifre alanının altında, sağ tarafta
- **İşlev**: TODO - Forgot password ekranına yönlendirmesi yapılacak

### 5. Hesabın mı yok? - Üye Ol
- **Konum**: Ekranın alt kısmında
- **İşlev**: TODO - Registration ekranına yönlendirmesi yapılacak

## Kullanılan Projek Özellikleri

### Renk Sistemi (AssetsKit)
```swift
Color.appPrimary      // Ana renk (buton)
Color.appText         // Metin rengi
Color.appElevation0   // Input alanı arka planı
Color.appElevation1   // Ekran arka planı
Color.appFocus        // Fields border rengi (varsayılan)
Color.appAction2      // Hata rengi (kırmızı)
Color.appPureWhite    // Beyaz renk
```

### Font Sistemi (FontsKit)
```swift
.font(.font(.nunitoExtraBold, size: .xxLarge)) // Başlık
.font(.font(.nunitoBold, size: .small))        // Vurgu linki
.font(.font(.nunitoSemiBold, size: .medium))   // Normal metin
```

### Yerelleştirme (LocalizationKit)
```swift
L10n.Login.title           // "Giriş Yap"
L10n.Login.bottomText      // "Hesabın mı yok?"
L10n.Login.forgotPassword  // "Şifrenizi mi unuttunuz?"
```

## Validasyon Mantığı

### Email Validasyonu
1. Boş kontrol
2. Format validasyonu (regex)
3. Hata gösterimi

### Şifre Validasyonu
1. Boş kontrol
2. Minimum 6 karakter kontrolü
3. Hata gösterimi

## Sonraki Adımlar (TODOs)

1. **Network Katmanı Bağlantısı**
   - `loginRequest()` fonksiyonunda gerçek API çağrısı yapılacak
   - Network package'ı ile entegrasyon

2. **Navigation**
   - Başarılı giriş sonrası ana ekrana yönlendirme
   - "Şifrenizi mi unuttunuz?" → Forgot password screen
   - "Üye Ol" → Registration screen

3. **AppDestinations Güncelleme**
   - LoginScene navigasyon'a eklenmesi (Auth destinasyonları)

4. **Error Handling**
   - Network hataları
   - Giriş başarısızlığı senaryoları
   - Toast/Alert gösterimleri

## Özellikler

✅ Real-time form validasyonu  
✅ Şifre göster/gizle toggle  
✅ Responsive layout (ScrollView)  
✅ Erişilebilir UI components  
✅ Projede tanımlanmış stil ve renkler  
✅ Türkçe lokalizasyon  
✅ MVVM mimarisi  
✅ Type-safe navigation hazırlığı
