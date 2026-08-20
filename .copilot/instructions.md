# Git Operations - Strict User Authorization Policy

## Kural

**ÖNEMLİ**: Herhangi bir git işlemi yapılmadan MUTLAKA kullanıcıdan açık onay alınmalıdır.

Git işlemi yapılacaksa:
1. İşlem öncesinde tam olarak ne yapılacağını açıkla
2. Kullanıcıdan onay iste
3. Ancak izin verilirse işlemi gerçekleştir

## Yasaklı Git İşlemleri (Kullanıcı Açıkça İstemediği Sürece)

Aşağıdaki işlemler **YAPILMAMALI**:

### 1. Branch İşlemleri
- ❌ Yeni branch oluşturma (`git checkout -b`, `git branch`)
- ❌ Branch'i değiştirme (`git checkout`, `git switch`)
- ❌ Branch silme (`git branch -d`, `git branch -D`)
- ❌ Branch merge etme (`git merge`)
- ❌ Branch rebase etme (`git rebase`)

### 2. Commit İşlemleri
- ❌ Commit atma (`git commit`)
- ❌ Commit'leri squash etme
- ❌ Commit'leri amend etme (`git commit --amend`)
- ❌ Otomatik commit mesajı yazma (skill: commit, create-draft-pr, create-pr, update-pr vb.)

### 3. Push/Pull İşlemleri
- ❌ Kodları push etme (`git push`)
- ❌ Remote'tan pull etme (`git pull`)
- ❌ Branch'i publish etme (skill: sync)

### 4. Stash/Reset İşlemleri
- ❌ Değişiklikleri stash etme (`git stash`)
- ❌ Commit'leri reset etme (`git reset`)

### 5. Tag İşlemleri
- ❌ Tag oluşturma (`git tag`)
- ❌ Tag silme

## İzin Verilen İşlemler

Aşağıdaki işlemler açık kullanıcı isteği olmasa bile yapılabilir:

- ✅ Git status'u kontrol etme (`git status`)
- ✅ Dosya değişikliklerini görme (`git diff`, `git show`)
- ✅ Commit history'yi görme (`git log`)
- ✅ Dosyaları okuma ve anlama
- ✅ Kod analizi ve inceleme

## Kullanıcının Söyleyebileceği İfadeler

Kullanıcı aşağıdaki ifadeleri kullanırsa git işlemi yapabilirsin:

- "Commit at"
- "Branch oluştur"
- "Branch'i değiştir"
- "Branch sil"
- "Değişiklikleri push et"
- "Kodları merge et"
- "Rebase et"
- "Kodu hazırla ve commit et"
- "PR oluştur"
- "Değişiklikleri commit'le"
- Benzer açık git komutu istekler

## Skill Kısıtlaması

Git işlemleriyle ilgili şu skilllar **KULLANILMAMALI**:

- `commit` - Açık izin olmadan
- `create-draft-pr` - Açık izin olmadan
- `create-pr` - Açık izin olmadan
- `update-pr` - Açık izin olmadan
- `sync` - Açık izin olmadan
- `merge` - Açık izin olmadan
- `sync-upstream` - Açık izin olmadan

## Örnek Senaryolar

### ✅ DOĞRU: İzin isteme
Kullanıcı: "Bu dosyayı düzelt"
Sen: "Dosyayı düzelttim. Değişiklikleri commit etmek ister misin?"

### ✅ DOĞRU: İzin isteme
Kullanıcı: "Yeni bir branch'te çalış"
Sen: "Yeni branch oluşturmadan önce ne yapacağını açıklamak istiyorum. Tamam mı?"

### ❌ YANLIŞ: İzin istemeden git işlemi yapmak
Kullanıcı: "Bu dosyayı düzelt"
Sen: (dosya düzelt → **commit at** → push et) ❌

### ❌ YANLIŞ: Skill'i izin istemeden kullanmak
Kullanıcı: "Bu kodu refactor et"
Sen: (skill: commit kullanarak otomatik commit at) ❌

## Örnek Doğru Konuşma

```
Kullanıcı: "Bu dosyayı düzelt ve kodunu kontrol et"

Sen: "Dosyayı düzelttim. Şu değişiklikleri yaptım: [değişiklikler]
     Commit atıp push etmek ister misin?"

Kullanıcı: "Evet, at"

Sen: (Commit at ve push et) ✅
```

## Özet

**Herhangi bir git işlemi yapmadan ÖNCE mutlaka kullanıcıya sor ve izin al.**

Şüphe varsa sor. İzin olmadan git işlemi yapmayın.

---

# Working Directory - Mevcut Proje İçerisinde Çalış

## Kural

**ÖNEMLİ**: Asla worktrees klasörü oluşturma ve orada çalışma. Her zaman mevcut proje klasörü içerisinde çalış.

## Yasaklı İşlemler

- ❌ Yeni worktree oluşturma (`git worktree add` vb.)
- ❌ Worktrees klasöründe proje açma
- ❌ Worktrees klasöründe file oluşturma veya değiştirme
- ❌ Worktrees klasöründe herhangi bir işlem yapma

## İzin Verilen İşlemler

- ✅ Mevcut proje klasörü içerisinde çalışma
- ✅ Mevcut projede dosya oluşturma, düzenleme, silme
- ✅ Mevcut projede git işlemleri yapma (izin ile)
- ✅ Mevcut projede branch'ler ile çalışma (izin ile)

## Proje Yapısı

Ana proje klasörü:
```
/Users/ahmetimirze/Documents/Github/iOS-Guidelines/
├── .git/
├── .copilot/
├── .swiftlint.yml
├── README.md
├── SampleProject/
├── SampleProjectSwiftUI/
├── Templates/
├── project-folder-structure.md
├── resources-guideline.md
├── swift-guideline.md
└── ... diğer dosyalar
```

Tüm çalışmalar bu klasör içerisinde yapılmalıdır.

## Worktrees Nedir ve Neden Kaçınılmalı

Git worktree'leri aynı repository'nin farklı branch'lerinde aynı anda çalışmak için kullanılır. Fakat bu proje için:

- ❌ Karmaşıklık artar
- ❌ Dosya senkronizasyon sorunları
- ❌ Confusing directory structure
- ❌ Gereksiz disk kullanımı

Bunun yerine:
- ✅ Tek bir proje klasörü kullan
- ✅ Branch'ler arası geçiş yap (izin ile)
- ✅ Stash kullan ihtiyaç varsa

## Mevcut Proje Klasörü

Şu anda çalışılan proje:
```
/Users/ahmetimirze/Documents/Github/iOS-Guidelines/
```

Bu klasör içerisinde tüm işlemleri yap. Worktrees klasörüne hiç bakma.

## Örnek Senaryolar

### ✅ DOĞRU: Mevcut proje klasöründe çalışma
```
/Users/ahmetimirze/Documents/Github/iOS-Guidelines/
└── Dosyaları burada oluştur/düzenle
```

### ❌ YANLIŞ: Worktrees klasöründe çalışma
```
/Users/ahmetimirze/Documents/Github/iOS-Guidelines.worktrees/
└── Burada hiç çalışma!
```

## Özet

**Tüm işlemleri mevcut proje klasörü içerisinde yap. Worktrees'e hiç bakma.**
