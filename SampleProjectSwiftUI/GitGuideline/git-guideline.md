## Branch ve PR akışı

### Master (`master`)

- Ana branch'tir ve korunur; doğrudan commit atılmaz.
- Release branch'leri bu branch'ten oluşturulur.
- Tamamlanan `release/*` branch'lerinden PR ile değişiklik alır.

### Release (`release/*`)

- `master` branch'inden oluşturulur.
- Korunur; doğrudan commit atılmaz.
- İlgili feature branch'leri bu branch'ten oluşturulur.
- Doğrulanan `feature/*` branch'lerinden PR ile değişiklik alır.
- Feature'dan bağımsız defect'ler için bu branch'ten `bugfix/*` branch'leri oluşturulur; testten geçen düzeltmeler PR ile geri alınır.
- Regresyonda bulunan hatalar için bu branch'ten `reg/bugfix/*` branch'leri oluşturulur; düzeltmeler PR ile geri alınır.
- Hotfix sürümlerinde ilgili `hotfix/*` branch'inden PR ile düzeltme alır.
- Release tamamlandığında `master` branch'ine PR açılır.

### Feature (`feature/*`)

- İlgili `release/*` branch'inden oluşturulur.
- Korunur; doğrudan commit atılmaz.
- `dev/feature/*` ve `dev/bugfix/*` çalışma branch'leri bu branch'ten oluşturulur.
- Çalışma branch'lerinden yalnızca PR ile değişiklik alır.
- Test/QA doğrulamasından sonra ilgili `release/*` branch'ine PR açılır.

### Dev Feature (`dev/feature/*`)

- İlgili `feature/*` branch'inden oluşturulur.
- Feature geliştirmeleri bu branch'te yapılır ve commit'ler bu branch'e atılır.
- Değişiklikler için ilgili `feature/*` branch'ine PR açılır.

### Dev Bugfix (`dev/bugfix/*`)

- Feature'a ait hatalar için ilgili `feature/*` branch'inden, bağımsız defect'ler için ilgili `bugfix/*` branch'inden oluşturulur.
- Testte bulunan bug'lar bu branch'te düzeltilir ve commit'ler bu branch'e atılır.
- Düzeltmeler için oluşturulduğu `feature/*` veya `bugfix/*` branch'ine PR açılır.

### Bağımsız Defect Bugfix (`bugfix/*`)

- Feature'dan bağımsız defect'ler için ilgili `release/*` branch'inden oluşturulur.
- Korunur; doğrudan commit atılmaz. Düzeltmeler için bu branch'ten `dev/bugfix/*` branch'i oluşturulur.
- Düzeltmeler `dev/bugfix/*` branch'inden PR ile alınır.
- Test/QA doğrulaması başarılı olduktan sonra ilgili `release/*` branch'ine PR açılır.
- Bu akış release `master`'a alınmadan önce tamamlanır.

### Regresyon Bugfix (`reg/bugfix/*`)

- Release `master`'a alınmadan önce regresyonda bulunan hataları düzeltmek için ilgili `release/*` branch'inden oluşturulur.
- Düzeltmeler bu branch'te yapılır ve commit'ler bu branch'e atılır.
- Düzeltmelerin doğrulanmasının ardından ilgili `release/*` branch'ine PR açılır.
- Regresyon tamamlandıktan sonra release branch'inden `master`'a PR açılır.

### Hotfix (`hotfix/*`)

- Canlıdaki hataları düzeltmek için `master`'dan yeni bir `release/*` branch'i oluşturulur (örnek: `release/v1.1.1`).
- Hotfix branch'i bu release branch'inden oluşturulur (örnek: `hotfix/MOB-2`).
- Düzeltmeler hotfix branch'inde yapılır ve commit'ler bu branch'e atılır.
- Test/QA doğrulamasından sonra ilgili release branch'ine PR açılır.
- Düzeltme release branch'ine alındıktan sonra release branch'inden `master`'a PR açılır.

### Ortak PR ve test kuralları

- PR açılmadan veya güncellenmeden önce kaynak branch, hedef branch'in son değişikliklerini içerecek şekilde güncellenir.
- Test/QA bir doğrulama adımıdır; ayrı bir test branch'i oluşturulmaz.

### Akış diyagramı

```mermaid
---
config:
    gitGraph:
        mainBranchName: 'master'
---
gitGraph LR:
    commit id: "Initial Commit"

    checkout master
    branch release/v1.1.0
    checkout release/v1.1.0

    branch feature/MOB-1
    checkout feature/MOB-1

    branch dev/feature/MOB-1-1
    checkout dev/feature/MOB-1-1
    commit id: "Feature geliştirmesi"
    checkout feature/MOB-1
    merge dev/feature/MOB-1-1 id: "dev/feature/MOB-1-1 to feature/MOB-1"

    branch dev/bugfix/MOB-1-2
    checkout dev/bugfix/MOB-1-2
    commit id: "Bug fix"
    checkout feature/MOB-1
    merge dev/bugfix/MOB-1-2 id: "dev/bugfix/MOB-1-2 to feature/MOB-1"

    %% Test/QA doğrulaması branch oluşturmaz.
    checkout release/v1.1.0
    merge feature/MOB-1 id: "feature/MOB-1 to release/v1.1.0"

    %% Master'a alınmadan önce regresyonda bulunan hata düzeltilir.
    branch reg/bugfix/MOB-3
    checkout reg/bugfix/MOB-3
    commit id: "Regresyon hata düzeltmesi"
    checkout release/v1.1.0
    merge reg/bugfix/MOB-3 id: "reg/bugfix/MOB-3 to release/v1.1.0"

    %% Feature'dan bağımsız defect için Bugfix ve çalışma branch'i oluşturulur.
    branch bugfix/MOB-4
    checkout bugfix/MOB-4
    branch dev/bugfix/MOB-4-1
    checkout dev/bugfix/MOB-4-1
    commit id: "Bağımsız defect düzeltmesi"
    checkout bugfix/MOB-4
    merge dev/bugfix/MOB-4-1 id: "dev/bugfix/MOB-4-1 to bugfix/MOB-4"

    %% Test/QA başarılı olduktan sonra Bugfix, Release'e PR ile alınır.
    checkout release/v1.1.0
    merge bugfix/MOB-4 id: "bugfix/MOB-4 to release/v1.1.0"

    %% Doğrulamalar tamamlandıktan sonra Release, Master'a PR ile alınır.
    checkout master
    merge release/v1.1.0 id: "release/v1.1.0 to master"

    %% Canlıdaki hata için yeni bir hotfix sürümü oluşturulur.
    branch release/v1.1.1
    checkout release/v1.1.1
    branch hotfix/MOB-2
    checkout hotfix/MOB-2
    commit id: "Canlı hata düzeltmesi"

    %% Test/QA sonrası düzeltme PR ile Release'e, ardından Master'a alınır.
    checkout release/v1.1.1
    merge hotfix/MOB-2 id: "hotfix/MOB-2 to release/v1.1.1"
    checkout master
    merge release/v1.1.1 id: "release/v1.1.1 to master"
```

---

### Akış Diyagramı (Figma Görünümü)

![Git Akış Diyagramı](./git-guideline.svg)

Tam boyutta görüntülemek için: [git guideline](./git-guideline.svg)
