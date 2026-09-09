# Orran — prototype

App rèn **empathy accuracy** cho người thường xuyên trình bày và thuyết phục khách hàng.
Giả thuyết: người ta trả lời Q&A kém không phải vì thiếu kỹ năng nói, mà vì **không dựng đúng
hình dung về người ngồi đối diện**. Mỗi ngày một session ~4 phút, 3 game, lặp đi lặp lại hai
việc: *tiếp nhận thông tin có chọn lọc* và *suy luận có căn cứ*.

**Preview:**
- App Orran → https://prototypes-eta-cyan.vercel.app/orran
- Game 3 chạy riêng → https://prototypes-eta-cyan.vercel.app/empathy-guess-the-person

| File | Nội dung | Trạng thái |
|---|---|---|
| `index.html` | **App Orran** — onboarding, Home 4 tab, Daily Practice, Game 1 + Game 2 | ✅ chơi được |
| `read-the-room.html` | **Game 3 · Guess the Person** (chạy độc lập) | ✅ chơi được, chưa gắn vào hub |

---

## Có gì trong app

**Onboarding** → splash → survey 3 câu → màn plan.
Survey map thẳng vào 4 skill: Active Listening / Observation / Perspective Taking / Imagination.
Câu 1–2 hạ điểm skill tương ứng, câu 3 gắn cờ **GOAL**. Kết quả ra thanh skill ở Home và Profile.

**Home (4 tab)**
- **Home** — thẻ Daily practice + tiến độ 3 game + thanh skill
- **Library** — game xếp theo skill
- **Discover** — workplace knowledge, mở khoá khi xong session
- **Profile** — skill score, training history, insights, settings

**Daily Practice** — Game 1 → Game 2 → Game 3, mỗi game: Instruction → Tutorial (lần đầu) →
Play → Point earned → Progress x/3. Xong 3/3 → Point summary → Congrats → Unlock New Discovery.

**Game 1 · Who Holds the Decision?** (đầy đủ)
- **Round 1 Observe** — xem cuộc họp 6 khoảnh khắc, lưu clue; xác định quyết định đang bàn;
  gắn mỗi clue vào đúng người và đánh dấu **Fact / My read**; phát hiện stakeholder vắng mặt.
- **Round 2 Map** — với từng người: chọn loại quyền lực (8 power card, mỗi card kèm câu hỏi
  nhận diện), chọn điều họ đang bảo vệ, đặt mức ưu tiên. Rồi chọn *ai cần thấu hiểu nhất*.
- **Round 3 Update** — 1 clip + 1 email mới xuất hiện, người chơi giữ hoặc đổi thứ tự ưu tiên.
- **Result** — điểm /100, rank, bản đồ quyền lực thật, bài học, điểm thưởng nếu tìm ra
  stakeholder ẩn.

**Game 2 · Same Situation** (đầy đủ) — cơ chế lõi *self perspective → switch perspective*:
- **Round 1 · You** — bạn đang pitch, Diễm ngắt lời hỏi về số liệu bạn chưa chuẩn bị. Đồng hồ
  15 giây; hết giờ thì lựa chọn “khựng lại” được chọn thay bạn. Sau đó bạn đánh giá Diễm là
  người thế nào.
- **Khoảng lặng 2 giây** — “Diễm gật đầu, không nói gì thêm, rời phòng họp.”
- **Round 2 · Her** — bạn *là* Diễm, biết tuần trước sếp vừa mắng vì vendor đưa số liệu sai.
  Câu bạn chọn ở round 1 được dùng **nguyên văn** làm dữ kiện. Có 1 **lựa chọn bẫy** (“chị hiểu
  bạn còn junior…”) — bấm vào sẽ bị chặn lại vì Diễm chưa đủ thông tin để nói câu đó, rồi khoá lại.
- **Wrap-up** — so đánh giá ban đầu với bối cảnh thật, cho phép sửa lại đánh giá.

**Game 2 không chấm điểm** — đúng chủ đích trong Figma: không phản hồi đúng/sai, không kết luận
đạo đức, để người chơi tự ngẫm. Vẫn cộng điểm tích luỹ cho vòng lặp ngày, nhưng nói rõ “no score”.

**Game 3** đã dựng xong nhưng **chưa đẩy lên hub** theo yêu cầu — trong flow vẫn là stub, bấm
“Simulate finish (demo)” để xem trọn vòng lặp ngày.

### Thang điểm Game 1 (khớp bảng 100 điểm)

| Hành động | Điểm |
|---|---|
| Xác định đúng quyết định | +15 |
| Clue liên quan | +4/clue, tối đa +20 |
| Phân biệt đúng Fact / My read | +10 |
| Gán đúng power | +10/người, tối đa +30 |
| Đọc đúng điều họ bảo vệ | +5 |
| Chọn đúng người cần ưu tiên | +10 |
| Cập nhật khi có clue mới | +10 |
| Bỏ sót clue · chọn người nói nhiều · đánh dấu suy đoán là fact · không cập nhật | −5 … −10 |

Rank: 90–100 Insight Detective · 75–89 Power Mapper · 60–74 Clue Collector · <60 Case Reopened.
Dưới 70 thì màn kết hiện cảnh báo chưa mở được level sau. Điểm thưởng **+120** nếu tìm ra Quân —
người không có mặt trong phòng họp.

---

## Chạy thử

Không cần build:

```bash
open index.html          # hoặc read-the-room.html
python3 -m http.server 8000   # nếu muốn test trên điện thoại cùng wifi
```

Trên desktop, cạnh khung điện thoại có **thanh nút nhảy nhanh** để demo từng màn không phải
chơi lại từ đầu.

## Sửa ở đâu

Mỗi file tự chứa HTML + CSS + JS + minh hoạ SVG. Search theo mốc:

| Muốn sửa | Search |
|---|---|
| 3 câu survey + cách map vào skill | `const SURVEY` |
| 4 nhân vật: tên, chức danh, quyền lực thật, điều họ bảo vệ | `const CAST` |
| 8 loại quyền lực + câu hỏi nhận diện | `const POWERS` |
| Lời thoại trong cuộc họp | `const MOMENTS` |
| 3 đáp án “quyết định đang bàn” | `const DECISIONS` |
| Clip + email ở round 3 | `const TWIST` |
| Công thức chấm điểm | `function scoreG1` |
| Rank và mô tả | `const RANKS` |
| Kịch bản Game 2: thoại, lựa chọn, option bẫy, đoạn kể sau mỗi lựa chọn | `const G2_R1` · `G2_READ` · `G2_R2` |
| Nội dung tab Library / Discover / Profile | `renderLibrary` · `renderDiscover` · `renderProfile` |
| Mặt người (tóc, kính, màu da) | `function head` |
| Cảnh phòng họp | `function meetingScene` |
| Màu, font, bo góc | `:root` đầu file |

## Art direction

Tham chiếu **NYT Games** + trang BFCM của Attentive.

- Nền kem `#FAF6EF`, mực `#121212`, viền đen **2px**, bo góc nhỏ
- Tiêu đề **Fraunces**, chữ nền **Libre Franklin**
- Màu khối phẳng: tím `#B4A7EE`, vàng `#F7DA21`, xanh lá `#A5CB8C`, xanh dương `#9BBEE8`, hồng `#EFC3D7`
- Minh hoạ **SVG vẽ tay trong file**, không dùng ảnh stock — để đổi màu và ghép lớp theo lựa chọn

Nội dung game để **tiếng Anh**; ghi chú cho team để tiếng Việt.

---

## Làm việc chung

```bash
git checkout -b <tên>/<việc>
git add -A && git commit -m "..."
git push -u origin <tên>/<việc>
```

Rồi mở Pull Request. Cả app nằm trong 1 file nên **hai người sửa cùng lúc dễ đụng nhau** —
chia theo vùng (một người lo `CONTENT`/copy, một người lo `<style>` + SVG), commit nhỏ, push sớm.

## Deploy preview

```bash
./deploy.sh
```

Copy 2 file sang thư mục `prototypes` local rồi deploy Vercel. Đừng sửa trực tiếp file bên
`prototypes/` — sẽ bị ghi đè.
