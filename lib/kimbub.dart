import 'package:flutter/material.dart';
import 'poskim.dart';

class KimbubFactoryData {
  // ── Brand Colors (ตาม UI ในรูป) ──
  static const Color primaryColor = Color(0xFF8B3A5A);   // Dusty Rose Deep
  static const Color accentColor  = Color(0xFFB05070);   // Muted Berry
  static const Color successColor = Color(0xFF4A7C6F);   // Sage Teal
  static const Color warningColor = Color(0xFFB07840);   // Warm Sand
  static const Color bgColor      = Color(0xFFE8EEF8);   // Light Blue-Gray

  // ════════════════════════════════════════════════════
  //  TAB 1 — แนะนำ (About)
  // ════════════════════════════════════════════════════
  static Widget buildAbout() {
    return Container(
      color: bgColor,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Header Banner — สีม่วงเข้มตาม screenshot
          _buildHeaderBanner('Kimbub Factory', 'ผู้นำด้านการผลิตเสื้อผ้าครบวงจร'),
          const SizedBox(height: 28),

          _buildSectionTitle('ธุรกิจของเรา'),
          const SizedBox(height: 12),
          _buildWhiteCard(
            child: const Text(
              'เราเป็นผู้เชี่ยวชาญด้านการผลิตและจัดจำหน่ายเสื้อผ้าสำเร็จรูปทุกรูปแบบ มุ่งเน้นคุณภาพมาตรฐานสากล ในราคาที่เหมาะสม ตอบโจทย์ทั้งปลีกและส่ง',
              style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.6),
            ),
          ),
          const SizedBox(height: 28),

          _buildSectionTitle('สินค้าและบริการหลัก'),
          const SizedBox(height: 14),
          _buildIconListCard(Icons.checkroom_rounded,      'สินค้าสำเร็จรูป',      'เสื้อยืด, เชิ้ต, แฟชั่น, ยูนิฟอร์ม',      warningColor),
          _buildIconListCard(Icons.precision_manufacturing_rounded, 'รับผลิต OEM/ODM', 'ผลิตตามออเดอร์ ปรับแบรนด์ตามใจลูกค้า', const Color(0xFF5B7FA6)),
          _buildIconListCard(Icons.verified_rounded,       'คุณค่าที่เรามอบให้',   'งานมาตรฐานสากล ตรงเวลา ราคาคุ้มค่า',     successColor),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════
  //  TAB 2 — องค์กร (Org)
  // ════════════════════════════════════════════════════
  static Widget buildOrg() {
    return Container(
      color: bgColor,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSectionTitle('โครงสร้างสายงานหลัก'),
          const SizedBox(height: 14),
          _orgExpandTile('1. สายงานบริหารจัดการสูงสุด', const Color(0xFF5C5FA6), [
            '• ผู้บริหารบริษัท: กำหนดกลยุทธ์, วางตำแหน่งแบรนด์, นโยบายคุณภาพ',
          ]),
          _orgExpandTile('2. สายงานพัฒนาผลิตภัณฑ์และวัตถุดิบ', const Color(0xFF5B7FA6), [
            '• ฝ่ายพัฒนาผลิตภัณฑ์: วิเคราะห์เทรนด์แฟชั่น',
            '• ฝ่ายจัดหาวัตถุดิบ: จัดหาผ้า ด้าย อุปกรณ์, ดีล Supplier',
            '• ฝ่ายควบคุมคุณภาพ (QC): ตรวจสอบมาตรฐานก่อนส่งมอบ',
          ]),
          _orgExpandTile('3. สายงานปฏิบัติการผลิต', warningColor, [
            '• ฝ่ายโรงงานผลิต: ตัดเย็บตามแผนงาน',
            '• ผู้จัดการโรงงาน: ควบคุมประสิทธิภาพและบริหารแรงงาน',
          ]),
          _orgExpandTile('4. สายงานการตลาดและลูกค้าสัมพันธ์', accentColor, [
            '• ฝ่ายการตลาด: วางแผนโปรโมชั่น, สร้างแบรนด์',
            '• ฝ่ายขาย / CRM: ดูแลออเดอร์, วิเคราะห์ความต้องการลูกค้า',
          ]),
          _orgExpandTile('5. สายงานสนับสนุน (Back Office)', successColor, [
            '• ฝ่าย HR: สรรหา ฝึกอบรม, สวัสดิการพนักงาน',
            '• ฝ่ายบัญชี/การเงิน: ควบคุมต้นทุน กำไร, บริหารงบ',
            '• ฝ่ายไอที: ดูแลระบบ ERP สต็อกและระบบขาย',
          ]),

          const SizedBox(height: 28),
          _buildSectionTitle('พนักงาน & งบประมาณ'),
          const SizedBox(height: 14),
          _buildIconListCard(Icons.people_alt_rounded, 'จำนวนพนักงานรวม',
              '10 - 12 คน (ช่างเย็บ 5, QC 2, ดีไซเนอร์ 1, แอดมิน 2, บัญชี 1)', const Color(0xFF7A8C99)),
          _buildIconListCard(Icons.payments_rounded, 'งบประมาณค่าแรง',
              '250,000 – 350,000 บาท/เดือน', const Color(0xFFA05060)),
          _buildIconListCard(Icons.factory_rounded, 'งบดำเนินงาน (OPEX)',
              '300,000 – 500,000 บาท/เดือน', warningColor),
          _buildIconListCard(Icons.campaign_rounded, 'งบการตลาด (Marketing)',
              '30,000 – 70,000 บาท/เดือน', primaryColor),

          const SizedBox(height: 14),
          // Summary highlight bar (สีม่วงเข้ม)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ประมาณการรายจ่ายรวมสูงสุด',
                    style: TextStyle(color: Colors.white, fontSize: 14)),
                Text('920,000 บาท/เดือน',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════
  //  TAB 3 — Layout (แผนผังโรงงาน)
  // ════════════════════════════════════════════════════
  static Widget buildLayout() {
    return Container(
      color: bgColor,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSectionTitle('แผนผังโรงงาน (Factory Layout)'),
          const SizedBox(height: 20),
          // Floor plan image / fallback
          Container(
            height: 420,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/kim.jpg',
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => _floorPlanFallback(),
              ),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            '* แผนผังแสดงสัดส่วนพื้นที่การทำงานภายในโรงงาน Kimbub Factory',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  static Widget _floorPlanFallback() {
    // แสดงห้องต่างๆ แบบ simple grid เมื่อไม่มีรูป
    final rooms = [
      ('ห้องประชุม', Colors.brown.shade100),
      ('ห้องน้ำหญิง', Colors.blue.shade50),
      ('ห้องน้ำชาย', Colors.blue.shade50),
      ('Stock', Colors.grey.shade100),
      ('ห้องพักพนักงาน', Colors.orange.shade50),
      ('พื้นที่พักผ่อน', Colors.green.shade50),
      ('ส่วนผลิต / ตัดเย็บ', Colors.amber.shade50),
      ('ห้องรับแขก', Colors.purple.shade50),
      ('CEO', Colors.red.shade50),
      ('ลานจอดรถ', Colors.grey.shade200),
    ];
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('แผนผังโรงงาน (ภาพร่าง)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              physics: const NeverScrollableScrollPhysics(),
              children: rooms.map((r) => Container(
                decoration: BoxDecoration(color: r.$2, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade300)),
                child: Center(child: Text(r.$1, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500))),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════
  //  TAB 4 — Business Model Canvas
  // ════════════════════════════════════════════════════
  static Widget buildBM() {
    return Container(
      color: bgColor,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildSectionTitle('Business Model Canvas'),
          const SizedBox(height: 18),
          _buildIconListCard(Icons.star_rounded, '1. Value Proposition',
              'เสื้อผ้าคุณภาพดี ราคาเหมาะสม, ผลิตตามแบบออเดอร์ลูกค้าได้, ตรงต่อเวลา, ดีไซน์ทันสมัยตรงเทรนด์, รองรับทั้งปลีกและส่ง',
              warningColor),
          _buildIconListCard(Icons.group_work_rounded, '2. Customer Segments',
              'ลูกค้าทั่วไป, ร้านเสื้อผ้า/ตัวแทนจำหน่าย, องค์กร/บริษัท/โรงงาน, แบรนด์ที่จ้างผลิต (OEM)',
              const Color(0xFF5B7FA6)),
          _buildIconListCard(Icons.hub_rounded, '3. Channels',
              'ร้านค้าปลีก, ขายตรงลูกค้าองค์กร (Uniform), เว็บไซต์บริษัท, แพลตฟอร์มออนไลน์, โซเชียลมีเดีย',
              const Color(0xFF5C5FA6)),
          _buildIconListCard(Icons.favorite_rounded, '4. Relationships',
              'บริการหลังการขาย, ติดต่อประสานงาน B2B โดยตรง, โปรโมชั่นลูกค้าประจำ, รับฟังความคิดเห็นพัฒนาสินค้า',
              accentColor),
          _buildIconListCard(Icons.construction_rounded, '5. Key Activities',
              'ออกแบบแพทเทิร์น, ผลิตและตัดเย็บ, QC สินค้า, การตลาดและการขาย, จัดการออเดอร์และส่งมอบ',
              warningColor),
          _buildIconListCard(Icons.inventory_2_rounded, '6. Key Resources',
              'โรงงานและเครื่องจักรตัดเย็บ, พนักงานตัดเย็บและช่างฝีมือ, นักออกแบบเสื้อผ้า, วัตถุดิบ, แบรนด์',
              const Color(0xFF7A8C99)),
          _buildIconListCard(Icons.handshake_rounded, '7. Key Partners',
              'ผู้ผลิตและจำหน่ายผ้า, Supplier วัตถุดิบ, บริษัทขนส่ง, ร้านค้าปลีก, แพลตฟอร์มออนไลน์',
              successColor),
          _buildIconListCard(Icons.payments_rounded, '8. Cost Structure',
              'ค่าวัตถุดิบ, ค่าแรงพนักงาน, ค่าเครื่องจักรและบำรุงรักษา, ค่าโลจิสติกส์และขนส่ง, ค่าโฆษณา',
              const Color(0xFFA05060)),
          _buildIconListCard(Icons.monetization_on_rounded, '9. Revenue Streams',
              'รายได้จากขายปลีกเสื้อผ้าสำเร็จรูป, รายได้จากการรับจ้างผลิต (OEM), รายได้จากการขายส่ง',
              successColor),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════
  //  TAB 5 — ERP/IT (Software Ecosystem)
  // ════════════════════════════════════════════════════
  static Widget buildIT() {
    return Container(
      color: bgColor,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Software Ecosystem',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)),
          const Text('ระบบบริหารจัดการครบวงจร',
              style: TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(height: 24),

          _itSectionLabel('1. ระบบ ERP (การผลิตและคลังสินค้า)'),
          _buildIconListCard(Icons.inventory_2_rounded,       'ระบบจัดการสต็อกผ้า',    'ตรวจสอบจำนวนม้วนผ้า ด้าย และวัสดุอุปกรณ์แบบ Real-time', primaryColor),
          _buildIconListCard(Icons.shopping_cart_checkout_rounded, 'ระบบจัดซื้อวัตถุดิบ', 'จัดการการสั่งซื้อผ้าและอะไหล่จากซัพพลายเออร์',          primaryColor),
          _buildIconListCard(Icons.settings_suggest_rounded,  'ระบบควบคุมงานผลิต',    'ติดตามสถานะการตัดเย็บ (Cutting/Sewing)',                   primaryColor),
          _buildIconListCard(Icons.calculate_rounded,         'ระบบบัญชีและการเงิน',  'คำนวณต้นทุนการผลิตต่อตัวและกำไรสุทธิ',                    primaryColor),
          _buildIconListCard(Icons.bar_chart_rounded,         'ระบบรายงานยอดขาย',     'สรุปสถิติแยกตามไซส์ สี และคอลเลกชัน',                     primaryColor),

          const SizedBox(height: 20),
          _itSectionLabel('2. ระบบส่วนงานขายและสำนักงาน'),
          _buildIconListCard(Icons.point_of_sale_rounded, 'ระบบ POS (Point of Sale)', 'จัดการยอดขายหน้าร้านโรงงานและออกใบเสร็จ', successColor),
          _buildIconListCard(Icons.hub_rounded,           'ระบบขายออนไลน์ Sync',    'เชื่อมต่อ Facebook, Line OA และ TikTok Shop',           successColor),
          _buildIconListCard(Icons.videocam_rounded,      'ระบบความปลอดภัย (CCTV)', 'ตรวจสอบความเรียบร้อยในโรงงานผ่านมือถือ',              successColor),

          const SizedBox(height: 20),
          _itSectionLabel('3. การใช้บริการภายนอก (Outsource)'),
          _buildIconListCard(Icons.local_shipping_rounded, 'บริษัทขนส่งสินค้า', 'การกระจายเสื้อผ้าให้ลูกค้าปลีกและส่งทั่วประเทศ', warningColor),
          _buildIconListCard(Icons.fact_check_rounded,     'บริษัทบัญชี (Audit)', 'ตรวจสอบความถูกต้องและเตรียมยื่นภาษี',            warningColor),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  static Widget _itSectionLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.blueGrey)),
    );
  }

  // ════════════════════════════════════════════════════
  //  TAB 6 — การเงิน (Finance)
  // ════════════════════════════════════════════════════
  static Widget buildFinance() {
    return Container(
      color: bgColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('สรุปรายรับ-รายจ่าย (Monthly)'),
            const SizedBox(height: 20),

            // Center profit card
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 12)],
                ),
                child: Column(children: [
                  const Text('กำไรสุทธิเฉลี่ย', style: TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 8),
                  Text('฿101,500',
                      style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: successColor)),
                ]),
              ),
            ),
            const SizedBox(height: 20),

            // รายรับ / รายจ่าย
            Row(children: [
              Expanded(child: _miniStatCard('รายรับรวม', '450,000', successColor, Icons.trending_up)),
              const SizedBox(width: 14),
              Expanded(child: _miniStatCard('รายจ่ายรวม', '348,500', accentColor, Icons.trending_down)),
            ]),
            const SizedBox(height: 24),

            _buildSectionTitle('รายการงบประมาณพิเศษ'),
            const SizedBox(height: 14),
            _expenseBarCard('งบประมาณ Outsource', '45,000 บาท', 0.13, warningColor),
            _expenseBarCard('งบการตลาดคงเหลือ', '30,000 บาท', 0.40, primaryColor),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ════════════════════════════════════════════════════
  //  TAB 7 — CRM
  // ════════════════════════════════════════════════════
  static Widget buildCRM() {
    return Container(
      color: bgColor,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('ภาพรวม CRM'),
            const SizedBox(height: 16),

            Row(children: [
              Expanded(child: _miniStatCard('ลูกค้าทั้งหมด', '86 ราย', const Color(0xFF5B7FA6), Icons.people)),
              const SizedBox(width: 14),
              Expanded(child: _miniStatCard('Lead ใหม่', '12 ราย', warningColor, Icons.trending_up)),
            ]),
            const SizedBox(height: 14),
            Row(children: [
              Expanded(child: _miniStatCard('ปิดการขายเดือนนี้', '18 ดีล', successColor, Icons.check_circle)),
              const SizedBox(width: 14),
              Expanded(child: _miniStatCard('Follow-up วันนี้', '5 งาน', accentColor, Icons.notifications_active_rounded)),
            ]),

            const SizedBox(height: 24),
            _buildSectionTitle('Sales Pipeline'),
            const SizedBox(height: 14),
            _expenseBarCard('สอบถามราคา',  '8 ดีล',  0.80, const Color(0xFF5B7FA6)),
            _expenseBarCard('เสนอราคาแล้ว', '6 ดีล', 0.60, warningColor),
            _expenseBarCard('กำลังเจรจา',  '4 ดีล',  0.40, primaryColor),
            _expenseBarCard('ปิดการขาย',   '10 ดีล', 0.90, successColor),

            const SizedBox(height: 24),
            _buildSectionTitle('Lead ล่าสุด'),
            const SizedBox(height: 14),
            _crmLeadTile('ABC Apparel',        'OEM เสื้อ 500 ตัว',        'เสนอราคาแล้ว', warningColor),
            _crmLeadTile('IT Camp University', 'เสื้อกิจกรรม 200 ตัว',     'กำลังเจรจา',   primaryColor),
            _crmLeadTile('NextGen Brand',      'ผลิต Hoodie 300 ตัว',       'สอบถามราคา',   const Color(0xFF5B7FA6)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ════════════════════════════════════════════════════
  //  TAB 8 — Promotion / PDCA
  // ════════════════════════════════════════════════════
  static Widget buildPDCA() {
    return Container(
      color: bgColor,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Promotion Strategy',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: primaryColor)),
          const Text('วงจรบริหารจัดการแคมเปญ',
              style: TextStyle(color: Colors.grey, fontSize: 13)),
          const SizedBox(height: 24),

          _pdcaStep('P', 'PLAN: การวางแผน',
              '• วิเคราะห์ยอดขายเชิงลึกจากระบบ POS\n• คัดเลือกสินค้า Best Seller มาจัดทำโปรโมชัน\n• ตั้งเป้าหมายเติบโต 15%',
              const Color(0xFF5B7FA6)),
          _pdcaStep('D', 'DO: การปฏิบัติงาน',
              '• จัดทำสื่อประชาสัมพันธ์และโปสเตอร์\n• กระจายข่าวสารผ่านช่องทาง Line OA\n• อบรมพนักงานให้เสนอขาย (Upselling)',
              warningColor),
          _pdcaStep('C', 'CHECK: การตรวจสอบ',
              '• ติดตามยอดขายหลังเริ่มโปรโมชัน 1 เดือน\n• เปรียบเทียบข้อมูล Before vs After\n• วิเคราะห์ผลตอบรับกลุ่มลูกค้า',
              primaryColor),
          _pdcaStep('A', 'ACT: การปรับปรุง',
              '• สำเร็จ → ดำเนินการทำซ้ำ\n• ไม่ตามเป้า → ปรับปรุงเงื่อนไขใหม่\n• สรุปบทเรียนทำเป็นมาตรฐาน',
              successColor, isLast: true),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ════════════════════════════════════════════════════
  //  TAB 9 — POS (ระบบโรงงาน)
  // ════════════════════════════════════════════════════
  static Widget buildPOS() => const POSkimScreen();

  // ══════════════════════════════════════════════════════════════
  //  SHARED HELPER WIDGETS
  // ══════════════════════════════════════════════════════════════

  // Header banner สีม่วงเข้มตาม screenshot
  static Widget _buildHeaderBanner(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 6),
          Text(subtitle,
              style: const TextStyle(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }

  // Section title with left bar (สีม่วงเข้ม)
  static Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4, height: 20,
          decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(2)),
        ),
        const SizedBox(width: 10),
        Text(title,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor)),
      ],
    );
  }

  // White card wrapper
  static Widget _buildWhiteCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
      ),
      child: child,
    );
  }

  // Icon list card (ใช้ในทุก tab)
  static Widget _buildIconListCard(IconData icon, String title, String sub, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
      ),
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 22),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(height: 3),
            Text(sub, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ]),
        ),
      ]),
    );
  }

  // Org expand tile
  static Widget _orgExpandTile(String title, Color color, List<String> items) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        leading: Icon(Icons.account_tree_rounded, color: color, size: 20),
        title: Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 14)),
        iconColor: color,
        collapsedIconColor: color,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 56, right: 16, bottom: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.map((i) => Text(i,
                  style: const TextStyle(fontSize: 13, height: 1.7, color: Colors.black87))).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // Mini stat card
  static Widget _miniStatCard(String label, String value, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
      ]),
    );
  }

  // Expense bar card (Finance + CRM)
  static Widget _expenseBarCard(String title, String val, double progress, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
      ),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title, style: const TextStyle(fontSize: 13)),
          Text(val, style: const TextStyle(fontWeight: FontWeight.bold)),
        ]),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            color: color,
            backgroundColor: color.withOpacity(0.12),
            minHeight: 7,
          ),
        ),
      ]),
    );
  }

  // CRM Lead tile
  static Widget _crmLeadTile(String company, String detail, String status, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
      ),
      child: Row(children: [
        Container(
          width: 36, height: 36,
          decoration: BoxDecoration(color: color.withOpacity(0.12), borderRadius: BorderRadius.circular(10)),
          child: Icon(Icons.business_rounded, color: color, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(company, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(detail, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ])),
        Text(status, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold)),
      ]),
    );
  }

  // PDCA Step
  static Widget _pdcaStep(String letter, String title, String content, Color color, {bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(children: [
            Container(
              width: 40, height: 40,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Center(child: Text(letter,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
            ),
            if (!isLast)
              Expanded(child: Container(width: 2, margin: const EdgeInsets.symmetric(vertical: 4),
                  color: color.withOpacity(0.2))),
          ]),
          const SizedBox(width: 14),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)],
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title,
                    style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 14)),
                const SizedBox(height: 8),
                Text(content, style: const TextStyle(fontSize: 13, height: 1.6)),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
