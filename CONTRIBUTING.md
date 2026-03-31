# Contributing Guide

Tai lieu nay mo ta quy trinh dong gop code cho du an Digital Travel ERP.
Muc tieu: dong bo cach lam viec, merge nhanh, giam loi khi release.

## 1) Branch strategy

- `main`: nhanh on dinh de demo/release, khong commit truc tiep.
- `dev`: nhanh tich hop chinh, nhan PR tu `feature/*`.
- `feature/*`: nhanh phat trien tinh nang, tao tu `dev`.

Dat ten branch de nhin la biet viec gi dang lam:

- `feature/auth-jwt`
- `feature/booking-create`
- `feature/tour-search-filter`
- `fix/payment-callback`

### Flow lam viec

```powershell
git switch dev
git pull origin dev
git switch -c feature/<ten-ngan-gon>
```

Sau khi code xong:

```powershell
git add .
git commit -m "feat(scope): mo ta ngan gon"
git push -u origin feature/<ten-ngan-gon>
```

Mo Pull Request: `feature/*` -> `dev`.
Chi merge `dev` -> `main` khi da test va chuan bi demo/release.

## 2) Commit message convention

Su dung mau Conventional Commits rut gon:

`<type>(<scope>): <subject>`

Loai commit khuyen nghi:

- `feat`: them tinh nang
- `fix`: sua loi
- `refactor`: doi cau truc, khong doi hanh vi
- `test`: bo sung/chinh sua test
- `docs`: cap nhat tai lieu
- `chore`: viec he thong/build/tooling

Vi du:

- `feat(auth): add jwt login endpoint`
- `fix(booking): prevent overbooking when seats are full`
- `docs(readme): update week-1 progress`

## 3) Pull Request rules

Moi PR can co:

- Tieu de ro rang, ngan gon
- Mo ta "tai sao thay doi" va "thay doi gi"
- Link task/use case (neu co)
- Huong dan test nhanh hoac bang chung test
- Screenshot/Swagger response neu thay doi API/UI

Khuyen nghi:

- 1 PR chi nen giai quyet 1 van de chinh
- Trach PR qua lon (> 500 dong thay doi neu khong can thiet)
- Resolve conversation truoc khi merge

## 4) Review checklist

Truoc khi request review, tu kiem tra:

- [ ] Build pass tren may local
- [ ] Test lien quan pass (hoac ghi ro ly do chua co test)
- [ ] Khong commit file rac (log, secrets, file tam)
- [ ] Dat ten class/package bien ro rang, dung convention
- [ ] Khong pha vo API/hanh vi cu ma khong ghi chu
- [ ] Cap nhat `README.md`/tai lieu neu doi cach dung

## 5) Local quality gate (toi thieu)

Chay truoc khi mo PR:

```powershell
./mvnw.cmd test
```

Neu thay doi lien quan compile/build, chay them:

```powershell
./mvnw.cmd clean verify
```

## 6) Khong commit thong tin nhay cam

Tuyet doi khong commit:

- Mat khau DB, API key, token that
- File env local (`.env`, `application-local.yml`...)
- Du lieu ca nhan that cua khach hang

Neu lo commit thong tin nhay cam:

1. Thu hoi/rotate secret ngay lap tuc.
2. Tao commit xoa secret.
3. Thong bao cho team de kiem tra anh huong.

## 7) Nguyen tac merge

- Uu tien squash merge vao `dev` de lich su gon gang.
- Khong force-push len nhanh chung (`main`, `dev`).
- Release branch (neu can) tao tu `dev`, merge nguoc ve `dev` sau khi hotfix.

---

Cam on ban da dong gop. Lam nho, review nhanh, merge deu.

