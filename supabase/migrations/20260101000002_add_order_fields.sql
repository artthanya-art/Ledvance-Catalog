-- =============================================================================
-- OSRAM Thailand Catalog — add order code + stock description (migration 3 of 3)
-- Adds two columns to products and fills them in for every SKU that has a
-- matching row in the internal Stock file (87 of 337 SKUs — the rest are left
-- NULL since no corresponding stock record was found).
-- =============================================================================

alter table products add column if not exists order_code text;  -- รหัสสั่งซื้อ (Stock Item)
alter table products add column if not exists stock_desc text;  -- คำอธิบายสินค้า (จากไฟล์ Stock)

update products set order_code = 'L1OSMAC730340055', stock_desc = 'หลอดไฟบัพ LED BULB Eco 5W 3000K E27' where category_key = 'led-bulb' and code = 'AC73034';
update products set order_code = 'L1OSMAC730350055', stock_desc = 'หลอดไฟบัพ LED BULB Eco 5W 6500K E27' where category_key = 'led-bulb' and code = 'AC73035';
update products set order_code = 'L1OSMAC730360055', stock_desc = 'หลอดไฟบัพ LED BULB Eco 7W 3000K E27' where category_key = 'led-bulb' and code = 'AC73036';
update products set order_code = 'L1OSMAC736500055', stock_desc = 'หลอดไฟบัพ LED BULB Eco 7W 4000K E27' where category_key = 'led-bulb' and code = 'AC73650';
update products set order_code = 'L1OSMAC730370055', stock_desc = 'หลอดไฟบัพ LED BULB Eco 7W 6500K E27' where category_key = 'led-bulb' and code = 'AC73037';
update products set order_code = 'L1OSMAC730380055', stock_desc = 'หลอดไฟบัพ LED BULB Eco 9W 3000K E27' where category_key = 'led-bulb' and code = 'AC73038';
update products set order_code = 'L1OSMAC736510055', stock_desc = 'หลอดไฟบัพ LED BULB Eco 9W 4000K E27' where category_key = 'led-bulb' and code = 'AC73651';
update products set order_code = 'L1OSMAC730390055', stock_desc = 'หลอดไฟบัพ LED BULB Eco 9W 6500K E27' where category_key = 'led-bulb' and code = 'AC73039';
update products set order_code = 'L1OSMAC730400055', stock_desc = 'หลอดไฟบัพ LED BULB Eco 12W 3000K E27' where category_key = 'led-bulb' and code = 'AC73040';
update products set order_code = 'L1OSMAC736520055', stock_desc = 'หลอดไฟบัพ LED BULB Eco 12W 4000K E27' where category_key = 'led-bulb' and code = 'AC73652';
update products set order_code = 'L1OSMAC730410055', stock_desc = 'หลอดไฟบัพ LED BULB Eco 12W 6500K E27' where category_key = 'led-bulb' and code = 'AC73041';
update products set order_code = 'L1OSMAC730420055', stock_desc = 'หลอดไฟบัพ LED BULB Eco 14W 3000K E27' where category_key = 'led-bulb' and code = 'AC73042';
update products set order_code = 'L1OSMAC730430055', stock_desc = 'หลอดไฟบัพ LED BULB Eco 14W 6500K E27' where category_key = 'led-bulb' and code = 'AC73043';
update products set order_code = 'L1OSMAC741970055', stock_desc = 'LVSTICK 10W/827220-240VE2710X1G4MVNOSRAM' where category_key = 'led-stick-bulb' and code = 'AC74197';
update products set order_code = 'L1OSMAC741980055', stock_desc = 'LVSTICK 10W/840220-240VE2710X1G4MVNOSRAM' where category_key = 'led-stick-bulb' and code = 'AC74198';
update products set order_code = 'L1OSMAC741990055', stock_desc = 'LVSTICK 10W/865220-240VE2710X1G4MVNOSRAM' where category_key = 'led-stick-bulb' and code = 'AC74199';
update products set order_code = 'L1OSMAC716390055', stock_desc = 'LDE G45 4W 400-827FILE27 G1 Filament series' where category_key = 'led-filament' and code = 'AC71639';
update products set order_code = 'L1OSMAC716400055', stock_desc = 'LDE A60 6W 860-827FILE27 G1 Filament series' where category_key = 'led-filament' and code = 'AC71640';
update products set order_code = 'L1OSMAC716410055', stock_desc = 'หลอดวินเทจ LED Filament LDE ST64 4W 470-827FILE27 G1' where category_key = 'led-filament' and code = 'AC74641';
update products set order_code = 'L1OSMAD100070055S', stock_desc = 'OST8SET-0.6M 10W/865 DE SET THOSRAM 135lm/w' where category_key = 't8-tube' and code = 'AD10007';
update products set order_code = 'L1OSMAD100130055S', stock_desc = 'OST8SET-1.2M 20W/865 DE SET THOSRAM 135lm/w' where category_key = 't8-tube' and code = 'AD10013';
update products set order_code = 'L1OSMAD100160055S', stock_desc = 'OST8SET-1.2M 28W/865 DE SET THOSRAM 135lm/w' where category_key = 't8-tube' and code = 'AD10016';
update products set order_code = 'L4OSMAC73136', stock_desc = 'Osram LED strip HV 9W 3000K CRI80 220V IP65' where category_key = 'led-strips' and code = 'AC73136';
update products set order_code = 'L4OSMAC73137', stock_desc = 'Osram LED strip HV 9W 4000K CRI80 220V IP65' where category_key = 'led-strips' and code = 'AC73137';
update products set order_code = 'L4OSMAC73138', stock_desc = 'Osram LED strip HV 9W 6500K CRI80 220V IP65' where category_key = 'led-strips' and code = 'AC73138';
update products set order_code = 'L4OSMAC733970055', stock_desc = 'Osram LED ECO HV POWER CORD AND TAIL CAP for strip 9W' where category_key = 'led-strips' and code = 'AC73397';
update products set order_code = 'L4OSMAC733990055', stock_desc = 'Osram LED ECO HV ACCESSORY PACK-CONNECTOR for strip 9W' where category_key = 'led-strips' and code = 'AC73399';
update products set order_code = 'L1OSMAC73055', stock_desc = 'โคมไฟติดราง แทรคไลท์ LED LDVSP TX026TR WH 12W 930 36X1 OSRAM' where category_key = 'track-light-tr' and code = 'AC73055';
update products set order_code = 'L1OSMAC73057', stock_desc = 'โคมไฟติดราง แทรคไลท์ LED LDVSP TX026TR WH 12W 940 36X1 OSRAM' where category_key = 'track-light-tr' and code = 'AC73057';
update products set order_code = 'L1OSMAC73056', stock_desc = 'โคมไฟติดราง แทรคไลท์ LED LDVSP TX026TR BK 12W 930 36X1 OSRAM' where category_key = 'track-light-tr' and code = 'AC73056';
update products set order_code = 'L1OSMAC73058', stock_desc = 'โคมไฟติดราง แทรคไลท์ LED LDVSP TX026TR BK 12W 940 36X1 OSRAM' where category_key = 'track-light-tr' and code = 'AC73058';
update products set order_code = 'L1OSMAC73061', stock_desc = 'โคมไฟติดราง แทรคไลท์ LED LDVSP TX026TR WH 20W 930 36X1 OSRAM' where category_key = 'track-light-tr' and code = 'AC73061';
update products set order_code = 'L1OSMAC73063', stock_desc = 'โคมไฟติดราง แทรคไลท์ LED LDVSP TX026TR WH 20W 940 36X1 OSRAM' where category_key = 'track-light-tr' and code = 'AC73063';
update products set order_code = 'L1OSMAC73062', stock_desc = 'โคมไฟติดราง แทรคไลท์ LED LDVSP TX026TR BK 20W 930 36X1 OSRAM' where category_key = 'track-light-tr' and code = 'AC73062';
update products set order_code = 'L1OSMAC73064', stock_desc = 'โคมไฟติดราง แทรคไลท์ LED LDVSP TX026TR BK 20W 940 36X1 OSRAM' where category_key = 'track-light-tr' and code = 'AC73064';
update products set order_code = 'L1OSMAC73079', stock_desc = 'โคมไฟติดราง แทรคไลท์ LED LDVSP TX026SF WH 12W 930 36X1 OSRAM' where category_key = 'track-light-sf' and code = 'AC73079';
update products set order_code = 'L1OSMAC73081', stock_desc = 'โคมไฟติดราง แทรคไลท์ LED LDVSP TX026SF WH 12W 940 36X1 OSRAM' where category_key = 'track-light-sf' and code = 'AC73081';
update products set order_code = 'L1OSMAC73080', stock_desc = 'โคมไฟติดราง แทรคไลท์ LED LDVSP TX026SF BK 12W 930 36X1 OSRAM' where category_key = 'track-light-sf' and code = 'AC73080';
update products set order_code = 'L1OSMAC73082', stock_desc = 'โคมไฟติดราง แทรคไลท์ LED LDVSP TX026SF BK 12W 940 36X1 OSRAM' where category_key = 'track-light-sf' and code = 'AC73082';
update products set order_code = 'L2OSMAC957850055', stock_desc = 'ดาวน์ไลท์ฝังฝ้า LED เหลี่ยม S145 9W 830WV 60X1G1MVNOSRAM' where category_key = 'downlight-slim-sq' and code = 'AC95785';
update products set order_code = 'L2OSMAC957870055', stock_desc = 'ดาวน์ไลท์ฝังฝ้า LED เหลี่ยม S145 9W 865WV 60X1G1MVNOSRAM' where category_key = 'downlight-slim-sq' and code = 'AC95787';
update products set order_code = 'L2OSMAC957880055', stock_desc = 'ดาวน์ไลท์ฝังฝ้า LED เหลี่ยม S170 12W 830WV 60X1G1MVNOSRAM' where category_key = 'downlight-slim-sq' and code = 'AC95788';
update products set order_code = 'L2OSMAC957900055', stock_desc = 'ดาวน์ไลท์ฝังฝ้า LED เหลี่ยม S170 12W 865WV 60X1G1MVNOSRAM' where category_key = 'downlight-slim-sq' and code = 'AC95790';
update products set order_code = 'L2OSMAC957910055', stock_desc = 'ดาวน์ไลท์ฝังฝ้า LED เหลี่ยม S215 18W 830WV 40X1G1MVNOSRAM' where category_key = 'downlight-slim-sq' and code = 'AC95791';
update products set order_code = 'L2OSMAC957930055', stock_desc = 'ดาวน์ไลท์ฝังฝ้า LED เหลี่ยม S215 18W 865WV 40X1G1MVNOSRAM' where category_key = 'downlight-slim-sq' and code = 'AC95793';
update products set order_code = 'L2OSMAC795450055', stock_desc = 'LDVAL DL-FMLS R90 8W 830 60X1 MVN  OSRAM Downlight Series' where category_key = 'downlight-ceiling' and code = 'AC79545';
update products set order_code = 'L2OSMAC795460055', stock_desc = 'โคมไฟดาวน์ไลท์ติดลอย LED หน้ากลม R90 8W 840 60X1 MVN OSRAM' where category_key = 'downlight-ceiling' and code = 'AC79546';
update products set order_code = 'L2OSMAC795470055', stock_desc = 'โคมไฟดาวน์ไลท์ติดลอย LED หน้ากลม R90 8W 865 60X1 MVN OSRAM' where category_key = 'downlight-ceiling' and code = 'AC79547';
update products set order_code = 'L2OSMAC795480055', stock_desc = 'LDVAL DL-FMLS R120 12W 830 48X1 MVNOSRAM Downlight Series' where category_key = 'downlight-ceiling' and code = 'AC79548';
update products set order_code = 'L2OSMAC795490055', stock_desc = 'โคมไฟดาวน์ไลท์ติดลอย LED หน้ากลม R120 12W 840 48X1 OSRAM' where category_key = 'downlight-ceiling' and code = 'AC79549';
update products set order_code = 'L2OSMAC795500055', stock_desc = 'โคมไฟดาวน์ไลท์ติดลอย LED หน้ากลม R120 12W 865 48X1 OSRAM' where category_key = 'downlight-ceiling' and code = 'AC79550';
update products set order_code = 'L2OSMAC795510055', stock_desc = 'LDVAL DL-FMLS R155 18W 830 36X1 MVNOSRAM Downlight Series' where category_key = 'downlight-ceiling' and code = 'AC79551';
update products set order_code = 'L2OSMAC795520055', stock_desc = 'โคมไฟดาวน์ไลท์ติดลอย LED หน้ากลม R155 18W 840 36X1 OSRAM' where category_key = 'downlight-ceiling' and code = 'AC79552';
update products set order_code = 'L2OSMAC795530055', stock_desc = 'โคมไฟดาวน์ไลท์ติดลอย LED หน้ากลม R155 18W 865 36X1 OSRAM' where category_key = 'downlight-ceiling' and code = 'AC79553';
update products set order_code = 'L2OSMAC795570055', stock_desc = 'LDVAL DL-FMLS SQ90 8W 830 60X1 MVN OSRAM Downlight Series' where category_key = 'downlight-ceiling' and code = 'AC79557';
update products set order_code = 'L2OSMAC795580055', stock_desc = 'LDVAL DL-FMLS SQ90 8W 840 60X1 MVN OSRAM Downlight Series' where category_key = 'downlight-ceiling' and code = 'AC79558';
update products set order_code = 'L2OSMAC795590055', stock_desc = 'LDVAL DL-FMLS SQ90 8W 865 60X1 MVN OSRAM Downlight Series' where category_key = 'downlight-ceiling' and code = 'AC79559';
update products set order_code = 'L2OSMAC795600055', stock_desc = 'LDVAL DL-FMLS SQ120 12W 830 48X1MVNOSRAM Downlight Series' where category_key = 'downlight-ceiling' and code = 'AC79560';
update products set order_code = 'L2OSMAC795610055', stock_desc = 'LDVAL DL-FMLS SQ120 12W 840 48X1MVNOSRAM Downlight Series' where category_key = 'downlight-ceiling' and code = 'AC79561';
update products set order_code = 'L2OSMAC795620055', stock_desc = 'LDVAL DL-FMLS SQ120 12W 865 48X1MVNOSRAM Downlight Series' where category_key = 'downlight-ceiling' and code = 'AC79562';
update products set order_code = 'L2OSMAC795630055', stock_desc = 'LDVAL DL-FMLS SQ155 18W 830 36X1MVNOSRAM Downlight Series' where category_key = 'downlight-ceiling' and code = 'AC79563';
update products set order_code = 'L2OSMAC795640055', stock_desc = 'LDVAL DL-FMLS SQ155 18W 840 36X1MVNOSRAM Downlight Series' where category_key = 'downlight-ceiling' and code = 'AC79564';
update products set order_code = 'L2OSMAC795650055', stock_desc = 'LDVAL DL-FMLS SQ155 18W 865 36X1MVNOSRAM Downlight Series' where category_key = 'downlight-ceiling' and code = 'AC79565';
update products set order_code = 'L2OSMAC858480055', stock_desc = 'Osram highbay Dome 100W 6500K 150lm/Watt 90D SP 6KV PF0.92 C' where category_key = 'highbay-light' and code = 'AC85848';
update products set order_code = 'L2OSMAC858520055', stock_desc = 'Osram highbay Dome 150W 6500K 150lm/Watt 90D SP 6 KV PF0.92' where category_key = 'highbay-light' and code = 'AC85852';
update products set order_code = 'L2OSMAC858560055', stock_desc = 'Osram highbay Dome 200W 6500K 150lm/Watt 90D SP 6KV PF0.92 C' where category_key = 'highbay-light' and code = 'AC85856';
update products set order_code = 'L2OSMAC734300055', stock_desc = 'สปอร์ตไลท์ LED Osram Floodlight Value 10W 3000K' where category_key = 'floodlight' and code = 'AC73430';
update products set order_code = 'L2OSMAC734310055', stock_desc = 'สปอร์ตไลท์ LED Osram Floodlight Value 10W 6500K' where category_key = 'floodlight' and code = 'AC73431';
update products set order_code = 'L2OSMAC734320055', stock_desc = 'สปอร์ตไลท์ LED Osram Floodlight Value 20W 3000K' where category_key = 'floodlight' and code = 'AC73432';
update products set order_code = 'L2OSMAC734330055', stock_desc = 'สปอร์ตไลท์ LED Osram Floodlight Value 20W 6500K' where category_key = 'floodlight' and code = 'AC73433';
update products set order_code = 'L2OSMAC734340055', stock_desc = 'สปอร์ตไลท์ LED Osram Floodlight Value 30W 3000K' where category_key = 'floodlight' and code = 'AC73434';
update products set order_code = 'L2OSMAC734350055', stock_desc = 'สปอร์ตไลท์ LED Osram Floodlight Value 30W 6500K' where category_key = 'floodlight' and code = 'AC73435';
update products set order_code = 'L2OSMAC734360055', stock_desc = 'สปอร์ตไลท์ LED Osram Floodlight Value 50W 3000K' where category_key = 'floodlight' and code = 'AC73436';
update products set order_code = 'L2OSMAC734370055', stock_desc = 'สปอร์ตไลท์ LED Osram Floodlight Value 50W 6500K' where category_key = 'floodlight' and code = 'AC73437';
update products set order_code = 'L2OSMAC734380055', stock_desc = 'สปอร์ตไลท์ LED Osram Floodlight Value 100W 3000K' where category_key = 'floodlight' and code = 'AC73438';
update products set order_code = 'L2OSMAC734390055', stock_desc = 'สปอร์ตไลท์ LED Osram Floodlight Value 100W 6500K' where category_key = 'floodlight' and code = 'AC73439';
update products set order_code = 'L2OSMAC734410055', stock_desc = 'สปอร์ตไลท์ LED Osram Floodlight Value 150W 6500K' where category_key = 'floodlight' and code = 'AC73441';
update products set order_code = 'L2OSMAC734420055', stock_desc = 'LDV FL 200W 830 WV DOB 5X1 G1MVN OSRAM' where category_key = 'floodlight' and code = 'AC73442';
update products set order_code = 'L2OSMAC734430055', stock_desc = 'สปอร์ตไลท์ LED Osram Floodlight Value 200W 6500K' where category_key = 'floodlight' and code = 'AC73443';
update products set order_code = 'L2OSMAC698150055', stock_desc = 'Osram street light SA06 50W 6500K CRI80 75D SP4KV PF0.9 IP66' where category_key = 'street-light' and code = 'AC69815';
update products set order_code = 'L2OSMAC698160055', stock_desc = 'Osram street light SA06 100W 6500K CRI80 75D SP6KV PF0.9 IP6' where category_key = 'street-light' and code = 'AC69816';
update products set order_code = 'L2OSMAC698170055', stock_desc = 'Osram street light SA06 150W 6500K CRI80 75D SP6KV PF0.9 IP6' where category_key = 'street-light' and code = 'AC69817';
update products set order_code = 'L2OSMAC698180055', stock_desc = 'Osram street light SA06 200W 6500K CRI80 75D SP6KV PF0.9 IP6' where category_key = 'street-light' and code = 'AC69818';
update products set order_code = 'L2OSMAD09377', stock_desc = 'LV SSL TC 150W 865' where category_key = 'street-light-solar' and code = 'AD09377';
update products set order_code = 'L2OSMAD09378', stock_desc = 'LV SSL TC 300W 865' where category_key = 'street-light-solar' and code = 'AD09378';
update products set order_code = 'L2OSMAD09379', stock_desc = 'LV SSL TC 400W 865' where category_key = 'street-light-solar' and code = 'AD09379';
update products set order_code = 'L2OSMAD09372', stock_desc = 'LV SFL 120W 865 CUBE' where category_key = 'floodlight-solar' and code = 'AD09372';
