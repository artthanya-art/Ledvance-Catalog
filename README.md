# OSRAM Thailand — แคตตาล็อกสินค้าออนไลน์

เว็บแคตตาล็อกสินค้าไฟส่องสว่าง OSRAM Thailand (Catalogue 2026/2027)
23 หมวดหมู่ 337 รายการสินค้า พร้อมค้นหา/ตัวกรอง มุมมองการ์ด-ลิสต์
และระบบนำเข้าข้อมูลจาก Excel

## โครงสร้างไฟล์
```
index.html                                        เว็บไซต์ทั้งหมด (ไฟล์เดียว ไม่มี build step)
supabase/
  config.toml                                      ไฟล์ config มาตรฐานของ Supabase CLI
  migrations/
    20260101000000_initial_schema.sql               สร้างตาราง categories + products, RLS
    20260101000001_seed_data.sql                     seed ข้อมูลสินค้า 337 รายการ
```

## รันทดสอบในเครื่อง
เปิดไฟล์ `index.html` ในเบราว์เซอร์ได้โดยตรง หรือรัน local server เช่น `npx serve .`
ไม่เชื่อม Supabase ก็ใช้งานได้ปกติ — เว็บจะแสดงข้อมูลชุดที่ฝังไว้ในไฟล์

## Deploy เว็บขึ้น Vercel
static HTML ล้วน ไม่ต้องตั้งค่า build command — import repo เข้า Vercel, Framework Preset
เลือก "Other", กด Deploy

---

## เชื่อม Supabase ผ่าน GitHub Integration (ตามที่คุณใช้อยู่)

repo นี้จัดโครงสร้างเป็นไฟล์ migration มาตรฐานของ Supabase CLI ไว้แล้ว (โฟลเดอร์
`supabase/migrations/`) พร้อมสำหรับ Supabase's GitHub integration โดยตรง —
push ขึ้น GitHub แล้ว Supabase จะรัน migration ให้อัตโนมัติ ไม่ต้องเปิด SQL Editor เอง

### ขั้นตอน

1. **สร้างโปรเจกต์ Supabase** (ถ้ายังไม่มี) ที่ [supabase.com](https://supabase.com)

2. **ก่อน push** — เปิดไฟล์ `supabase/migrations/20260101000000_initial_schema.sql`
   แล้วตัดสินใจเรื่องสิทธิ์เขียนข้อมูล (สำหรับปุ่ม "นำเข้า Excel" ในเว็บ) — มี 2 ทางเลือกเป็น
   คอมเมนต์ไว้ในไฟล์ ต้องเลือกเปิดใช้ 1 แบบก่อน commit:
   - **Option A** — ให้ anon key เขียนได้เลย (เร็ว เหมาะกับใช้งานภายใน ไม่เปิดสาธารณะ)
   - **Option B** — ต้อง sign in ผ่าน Supabase Auth ก่อนถึงเขียนได้ (ปลอดภัยกว่า แนะนำถ้าเว็บเข้าถึงได้จากสาธารณะ)

   (ถ้ายังไม่แน่ใจ ข้ามขั้นตอนนี้ไปก่อนได้ — เว็บจะยังอ่านข้อมูลจาก Supabase ได้ปกติ
   แค่ปุ่ม "นำเข้า Excel" จะบันทึกไม่ได้จนกว่าจะเปิด policy นี้ทีหลัง แล้ว push migration ใหม่มาเพิ่ม)

3. **เชื่อม GitHub ↔ Supabase** — Supabase Dashboard → Project Settings → Integrations →
   GitHub → เลือก repo นี้ → เลือก branch ที่จะ deploy (เช่น `main`)

4. **Push** — commit ไฟล์ทั้งหมดแล้ว push ขึ้น branch ที่เชื่อมไว้ Supabase จะรัน
   ไฟล์ทั้งสองใน `supabase/migrations/` ให้อัตโนมัติตามลำดับชื่อไฟล์ (schema ก่อน แล้ว seed)
   — เช็คผลได้ที่ Supabase Dashboard → Database → Migrations

5. **เอา URL + anon key มาใส่ในเว็บ** — Project Settings → API → คัดลอก
   **Project URL** และ **anon public** key (ห้ามใช้ service_role key ในเว็บฝั่ง client)

   เปิด `index.html` หาบรรทัดนี้ (ใกล้ต้นๆ ของแท็ก `<script>` สุดท้าย):
   ```js
   const SUPABASE_URL = "";       // e.g. "https://xxxxxxxxxxxx.supabase.co"
   const SUPABASE_ANON_KEY = "";  // Project Settings → API → anon public key
   ```
   ใส่ค่าที่คัดลอกมา บันทึกไฟล์ แล้ว commit + push ขึ้น GitHub repo อีกครั้ง (ไฟล์นี้ไม่ใช่
   migration จะไม่ไปกระทบฝั่ง Supabase — แค่ทำให้เว็บรู้ว่าจะต่อกับโปรเจกต์ไหน)

6. Vercel จะ deploy เวอร์ชันใหม่ให้อัตโนมัติเมื่อ push (ถ้าตั้ง auto-deploy ไว้แล้ว)
   เว็บจะโหลดข้อมูลจาก Supabase ทันทีที่เปิดหน้า ถ้าเชื่อมไม่สำเร็จจะ fallback กลับไปใช้
   ข้อมูลที่ฝังในไฟล์เงียบๆ ไม่ล่ม

### แก้ไข schema ในอนาคต
เพิ่มไฟล์ migration ใหม่ในโฟลเดอร์เดียวกัน ตั้งชื่อด้วย timestamp ที่ใหม่กว่าไฟล์ล่าสุดเสมอ
(เช่น `20260215103000_add_column.sql`) แล้ว push — Supabase จะรันเฉพาะไฟล์ใหม่ที่ยังไม่เคยรัน
ห้ามแก้ไฟล์ migration เก่าที่ push ไปแล้ว (ให้เพิ่มไฟล์ใหม่แทน)

### หลังจากนั้น
- ปุ่ม "นำเข้า Excel" ในเว็บจะพยายามบันทึกทั้งลง Supabase (ถาวร ทุกคนเห็น) และอัปเดตหน้าจอทันที
- ถ้าบันทึกลง Supabase ไม่สำเร็จ (เช่น ยังไม่เปิด policy ให้เขียน) เว็บจะแจ้งเตือนพร้อม
  error message และอัปเดตให้เห็นเฉพาะเบราว์เซอร์นั้นไปก่อน
- โครงสร้างคอลัมน์ในไฟล์ Excel ที่ import ต้องตรงกับที่ export ออกมาจากเว็บก่อนหน้านี้
  (หัวตาราง "หมวดหมู่", "รุ่นสินค้า (Model No.)", "รหัสสินค้า (Basic Code)" ฯลฯ)
- รูปสินค้ายังคงอิงตามหมวดหมู่เดิมเสมอ ไม่ได้ดึงจาก Excel หรือ Supabase
