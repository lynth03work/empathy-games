# Empathy Games — prototype

Bộ mini-game rèn **empathy accuracy** cho người thường xuyên trình bày / thuyết phục khách hàng.
Giả thuyết: người ta trả lời Q&A kém không phải vì thiếu kỹ năng nói, mà vì **không dựng đúng
hình dung về người ngồi đối diện**. Game bắt người chơi lặp đi lặp lại 2 việc: *tiếp nhận thông
tin có chọn lọc* và *tưởng tượng có căn cứ*.

Repo này đang có **game 1 / 3**.

| Game | File | Trạng thái |
|---|---|---|
| **Read the Room** (Guess the Person) | `index.html` | ✅ prototype chơi được |
| Objection Radar | — | ⏳ chưa dựng |
| Mirror | — | ⏳ chưa dựng |

**Preview live:** https://prototypes-eta-cyan.vercel.app/empathy-guess-the-person

---

## Chạy thử

Không cần build, không cần cài gì. Chọn 1 trong 2:

```bash
# cách 1 — mở thẳng
open index.html

# cách 2 — chạy server (nếu muốn test trên điện thoại cùng wifi)
python3 -m http.server 8000
# rồi vào http://localhost:8000
```

Trên desktop, cạnh khung điện thoại có **thanh nút nhảy nhanh** (Hub / Intro / Round 1 /
Bridge / Round 2 / Result) để demo từng màn mà không phải chơi lại từ đầu.

---

## Luật chơi hiện tại

3 vòng, ~4 phút:

1. **Collect clues** — 60 giây, tap 6 đồng nghiệp để nghe họ kể về Vera Lam (khách hàng bạn
   sắp pitch). Mỗi clue là **hành vi quan sát được**, không ai mô tả ngoại hình hay nói thẳng
   bà ấy muốn gì. Đủ 3 clue là được đi tiếp.
2. **Build the person** — 5 câu (Environment / Objects / Appearance / Decision style /
   Activity) + 1 ô tự viết một chi tiết không ai nhắc tới.
3. **See the result** — illustration ghép động theo lựa chọn, % người chơi khác chọn gì,
   điểm **Observation** (dùng được bao nhiêu clue) và **Imagination** (chọn khác số đông +
   chi tiết tự thêm), và 1 câu hành động mang vào buổi pitch.

Điểm quan trọng nhất về mặt học: màn kết gắn nhãn từng lựa chọn là **Evidence** (có clue chống
lưng, kèm câu nói gốc) hay **Your guess** (không ai nói, tự lấp) — để người chơi thấy ranh giới
giữa *dữ kiện* và *suy diễn của mình*.

---

## Sửa ở đâu

Tất cả nằm trong **1 file `index.html`** — HTML + CSS + JS + minh hoạ SVG. Cố tình không tách
file để ai cũng mở sửa được ngay. Search theo mốc dưới đây:

| Muốn sửa | Search trong file | Ghi chú |
|---|---|---|
| Lời thoại 6 đồng nghiệp, tên, chức danh | `const PEOPLE` | `quote` là clue; `art` quy định tóc/da/áo |
| 5 câu hỏi + các đáp án + % người chơi khác | `const QUESTIONS` | `ev` = id người đã nói ra clue chống lưng cho đáp án đó (`null` = không ai nói); `pct` = % hiển thị ở bar |
| Câu "Take this into the room" | `const TAKEAWAYS` | map theo đáp án của câu *Decision style* |
| Icon nhỏ trong các ô chọn | `const ICONS` | SVG thuần, viewBox 76×76 |
| Mặt người (tóc, kính, màu da) | `function head` | 6 kiểu tóc: 0 bob · 1 xoăn · 2 buộc đuôi · 3 tóc ngắn + râu · 4 khăn trùm · 5 tóc dài |
| Tranh kết quả ghép theo lựa chọn | `function portrait` | mỗi lựa chọn swap 1 lớp SVG (nền / prop / màu áo / vật cầm tay) |
| Màu, font, bo góc | `:root` ở đầu file | đổi 1 chỗ, cả game đổi theo |
| Nội dung từng màn hình | `<section class="screen"` | 6 màn: `s-hub`, `s-intro`, `s-r1`, `s-mid`, `s-r2`, `s-res` |

**Cấu trúc file:**

```
index.html
├─ <style>            design tokens + toàn bộ CSS
├─ 6 × <section>      các màn hình (ẩn/hiện bằng class .on)
└─ <script>
   ├─ ART             hàm dựng SVG: head(), ICONS, portrait()
   ├─ CONTENT         PEOPLE, QUESTIONS, TAKEAWAYS  ← sửa nội dung ở đây
   ├─ STATE + FLOW    timer, thu clue, chọn đáp án
   └─ RESULT          tính điểm, bar %, ô share
```

## Art direction

Tham chiếu: **NYT Games** (nytimes.com/crosswords) + trang BFCM của Attentive.

- Nền kem `#FAF6EF`, mực `#121212`, viền đen **2px**, bo góc nhỏ (5–6px)
- Tiêu đề: **Fraunces** (thay cho Karnak của NYT) — luôn nặng, luôn siết chữ
- Chữ nền: **Libre Franklin**
- Màu khối phẳng lấy từ bảng NYT: tím `#B4A7EE`, vàng `#F7DA21`, xanh lá `#A5CB8C`,
  xanh dương `#9BBEE8`, hồng `#EFC3D7`
- Minh hoạ: **SVG hình học vẽ tay trong file**, không dùng ảnh stock — để đổi màu và ghép
  lớp theo lựa chọn người chơi. Đừng thay bằng ảnh bitmap.

---

## Làm việc chung

```bash
git checkout -b <tên>/<việc-đang-làm>   # vd: ly/round2-copy
# sửa index.html
git add -A && git commit -m "Round 2: viết lại 5 câu hỏi"
git push -u origin <tên>/<việc-đang-làm>
```

Rồi mở Pull Request trên GitHub để review trước khi vào `main`.

Vì cả game nằm trong 1 file, **hai người sửa cùng lúc dễ đụng nhau**. Cách tránh: chia theo
vùng (một người lo `CONTENT` — thoại và câu hỏi; một người lo `<style>` + `ART`), và commit
nhỏ, push sớm.

## Deploy preview

```bash
./deploy.sh
```

Script copy `index.html` sang thư mục `prototypes` local rồi đẩy lên Vercel, giữ nguyên link
preview cũ đã chia sẻ cho team.
