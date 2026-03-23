import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kimbub Factory"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kimbub Factory",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: 5),
                  Text("ผู้นำด้านการผลิตเสื้อผ้าครบวงจร",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text("ธุรกิจของเรา",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              "เราเป็นผู้เชี่ยวชาญด้านการผลิตและจัดจำหน่ายเสื้อผ้าสำเร็จรูปทุกรูปแบบ "
              "มุ่งเน้นคุณภาพมาตรฐานสากล ในราคาที่เหมาะสม",
            ),

            const SizedBox(height: 20),

            const Text("สินค้าและบริการหลัก",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            item("สินค้าเสื้อผ้า", "เสื้อยืด, เชิ้ต, แฟชั่น, ยูนิฟอร์ม"),
            item("OEM/ODM", "ผลิตตามออเดอร์"),
            item("คุณภาพ", "มาตรฐานสูง"),

            const SizedBox(height: 20),

            const Text("โครงสร้างสายงานหลัก",
                style: TextStyle(fontWeight: FontWeight.bold)),
            expand("บริหาร"),
            expand("พัฒนา"),
            expand("ผลิต"),
            expand("การตลาด"),
            expand("Back Office"),

            const SizedBox(height: 20),

            const Text("พนักงาน & งบประมาณ",
                style: TextStyle(fontWeight: FontWeight.bold)),
            item("พนักงาน", "10-12 คน"),
            item("งบประมาณ", "250,000 - 350,000"),

            const SizedBox(height: 20),

            const Text("Business Model",
                style: TextStyle(fontWeight: FontWeight.bold)),
            item("Value", "คุณภาพดี"),
            item("Customer", "ทั่วไป/OEM"),
            item("Channel", "ออนไลน์"),
            item("Relation", "B2B"),
            item("Activity", "ผลิต"),
            item("Resource", "โรงงาน"),

          ],
        ),
      ),
    );
  }

  Widget item(String t, String d) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(d),
        ],
      ),
    );
  }

  Widget expand(String t) {
    return ExpansionTile(
      title: Text(t),
      children: const [
        Padding(
          padding: EdgeInsets.all(8),
          child: Text("รายละเอียด"),
        )
      ],
    );
  }
}
