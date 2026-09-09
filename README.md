# LEDVANCE Thailand — แคตตาล็อกสินค้าออนไลน์

เว็บแคตตาล็อกสินค้าไฟส่องสว่าง LEDVANCE Thailand (Catalogue 2026/2027)
สร้างจากไฟล์ PDF แคตตาล็อกจริง มี 23 หมวดหมู่ 337 รายการสินค้า
พร้อมระบบค้นหา ตัวกรอง (สีไฟ/กำลังไฟ/ความสว่าง/ขั้วหลอด/การรับประกัน)
และมุมมองแบบการ์ด/ลิสต์

## โครงสร้างไฟล์
- `index.html` — เว็บไซต์ทั้งหมด (HTML/CSS/JS + ข้อมูลสินค้า) อยู่ในไฟล์เดียว ไม่มี build step

## รันทดสอบในเครื่อง
เปิดไฟล์ `index.html` ในเบราว์เซอร์ได้โดยตรง หรือรัน local server เช่น:
```
npx serve .
```

## Deploy ขึ้น Vercel
โปรเจกต์นี้เป็น static HTML ล้วน ไม่ต้องตั้งค่า build command หรือ output directory ใดๆ
เมื่อ import repo เข้า Vercel แล้วปล่อยค่า Framework Preset เป็น "Other" ระบบจะ serve `index.html` ให้อัตโนมัติ
