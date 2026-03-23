import 'package:flutter/material.dart';
import 'kimbub.dart'; // import ไฟล์ data/widget ของคุณเอง

// ══════════════════════════════════════════════════════════════
//  BUSINESS UNITS PAGE  (หน้าแรก — carousel บริษัทในเครือ)
// ══════════════════════════════════════════════════════════════

class BusinessUnitsPage extends StatefulWidget {
  const BusinessUnitsPage({super.key});

  @override
  State<BusinessUnitsPage> createState() => _BusinessUnitsPageState();
}

class _BusinessUnitsPageState extends State<BusinessUnitsPage> {
  final PageController _pageController = PageController(viewportFraction: 0.78);
  int _currentPage = 2; // Kimbub Factory อยู่กลาง

  final List<_BizUnit> _units = [
    _BizUnit(
      name: 'Kimbub Store',
      tag: 'ร้านค้าปลีก',
      tagColor: Color(0xFF5B7FA6),
      gradient: [Color(0xFF2C3E7A), Color(0xFF4A6FA5)],
      icon: Icons.storefront_rounded,
    ),
    _BizUnit(
      name: 'Kimbub Online',
      tag: 'ร้านค้าออนไลน์',
      tagColor: Color(0xFF5C8A6A),
      gradient: [Color(0xFF2D6A4F), Color(0xFF52B788)],
      icon: Icons.shopping_bag_rounded,
    ),
    _BizUnit(
      name: 'Kimbub Factory',
      tag: 'โรงงานผลิต',
      tagColor: Color.fromARGB(255, 225, 216, 219),
      gradient: [Color.fromARGB(255, 232, 115, 173), Color.fromARGB(255, 240, 236, 238)],
      icon: Icons.factory_rounded,
      isMain: true,
      hasImage: true,
    ),
    _BizUnit(
      name: 'NextGen Store',
      tag: 'ร้านค้าออนไลน์',
      tagColor: Color(0xFF5B7FA6),
      gradient: [Color(0xFF1A237E), Color(0xFF3949AB)],
      icon: Icons.rocket_launch_rounded,
    ),
    _BizUnit(
      name: 'Kimbub Logistics',
      tag: 'โลจิสติกส์',
      tagColor: Color(0xFFB07840),
      gradient: [Color(0xFF5D4037), Color(0xFF8D6E63)],
      icon: Icons.local_shipping_rounded,
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(_currentPage);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final unit = _units[_currentPage];
    return Scaffold(
      backgroundColor: const Color(0xFFE8EEF8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Top label ──
            const Padding(
              padding: EdgeInsets.only(left: 24, top: 20, bottom: 4),
              child: Text(
                'BUSINESS UNITS',
                style: TextStyle(fontSize: 11, letterSpacing: 2, color: Colors.blueGrey, fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24, bottom: 20),
              child: Text(
                'บริษัทภายในเครือ',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1A237E)),
              ),
            ),

            // ── Carousel ──
            SizedBox(
              height: 450, // สูงขึ้นเพื่อให้โลโก้ใหญ่
              child: PageView.builder(
                controller: _pageController,
                itemCount: _units.length,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemBuilder: (context, index) {
                  final u = _units[index];
                  final isActive = index == _currentPage;
                  return AnimatedScale(
                    scale: isActive ? 1.0 : 0.85,
                    duration: const Duration(milliseconds: 300),
                    child: GestureDetector(
                      onTap: isActive && u.isMain
                          ? () => Navigator.push(context, MaterialPageRoute(builder: (_) => CompanyProfileShell()))
                          : null,
                      child: _BizCard(unit: u, isActive: isActive),
                    ),
                  );
                },
              ),
            ),

            // ── Dots ──
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_units.length, (i) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: i == _currentPage ? 18 : 7,
                  height: 7,
                  decoration: BoxDecoration(
                    color: i == _currentPage ? const Color(0xFF3949AB) : Colors.blueGrey.shade200,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),

            // ── Unit info ──
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    unit.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(children: [
                    _tagChip(unit.tag, unit.tagColor),
                    const SizedBox(width: 8),
                    if (unit.isMain) _tagChip('Manufacturing', Colors.blueGrey),
                  ]),
                ],
              ),
            ),

            const Spacer(),

            // ── Welcome button ──
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CompanyProfileShell()),
              ),
              child: Container(
                margin: const EdgeInsets.all(16),
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1A237E), Color(0xFF5C6BC0)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(color: const Color(0xFF3949AB).withOpacity(0.4), blurRadius: 16, offset: const Offset(0, 6)),
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome to the company', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tagChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  _BizUnit & _BizCard
// ══════════════════════════════════════════════════════════════

class _BizUnit {
  final String name;
  final String tag;
  final Color tagColor;
  final List<Color> gradient;
  final IconData icon;
  final bool isMain;
  final bool hasImage;

  const _BizUnit({
    required this.name,
    required this.tag,
    required this.tagColor,
    required this.gradient,
    required this.icon,
    this.isMain = false,
    this.hasImage = false,
  });
}

class _BizCard extends StatelessWidget {
  final _BizUnit unit;
  final bool isActive;

  const _BizCard({required this.unit, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          colors: unit.gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: isActive
            ? [BoxShadow(color: unit.gradient.first.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 10))]
            : [],
      ),
      child: Stack(
        children: [
          Positioned(top: -40, right: -40, child: _circle(160, Colors.white.withOpacity(0.06))),
          Positioned(bottom: -20, left: -20, child: _circle(120, Colors.white.withOpacity(0.05))),
          Positioned(
            top: 16,
            left: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(unit.tag, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
            ),
          ),
          if (unit.hasImage)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/logokim.jpg',
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.precision_manufacturing_rounded, color: Colors.white, size: 60),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Kimbub',
                    style: TextStyle(color: Color.fromARGB(255, 23, 23, 23), fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: 1),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFB300),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'FACTORY',
                      style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 4),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _featureTag(Icons.content_cut, 'ตัดเย็บ'),
                      const SizedBox(width: 10),
                      _featureTag(Icons.verified, 'QC'),
                      const SizedBox(width: 10),
                      _featureTag(Icons.local_shipping_rounded, 'ส่งมอบ'),
                    ],
                  ),
                ],
              ),
            )
          else
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(unit.icon, color: Colors.white.withOpacity(0.9), size: 60),
                  const SizedBox(height: 16),
                  Text(unit.name,
                      style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          Positioned(
            bottom: 16,
            left: 20,
            child: Text(
              unit.name,
              style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          if (isActive)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white.withOpacity(0.3), width: 1.5),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _circle(double size, Color color) =>
      Container(width: size, height: size, decoration: BoxDecoration(color: color, shape: BoxShape.circle));

  Widget _featureTag(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, color: Colors.white, size: 13),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(color: Colors.white, fontSize: 11)),
      ]),
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  COMPANY PROFILE SHELL  (9 tabs navigation)
// ══════════════════════════════════════════════════════════════

class CompanyProfileShell extends StatefulWidget {
  const CompanyProfileShell({super.key});

  @override
  State<CompanyProfileShell> createState() => _CompanyProfileShellState();
}

class _CompanyProfileShellState extends State<CompanyProfileShell> {
  int _currentTab = 0;

  final List<_TabItem> _tabs = const [
    _TabItem(icon: Icons.info_outline_rounded, label: 'แนะนำ'),
    _TabItem(icon: Icons.account_tree_rounded, label: 'องค์กร'),
    _TabItem(icon: Icons.grid_view_rounded, label: 'Layout'),
    _TabItem(icon: Icons.hub_rounded, label: 'BM'),
    _TabItem(icon: Icons.computer_rounded, label: 'ERP/IT'),
    _TabItem(icon: Icons.account_balance_rounded, label: 'การเงิน'),
    _TabItem(icon: Icons.diamond_rounded, label: 'CRM'),
    _TabItem(icon: Icons.campaign_rounded, label: 'Promotion/PDCA'),
    _TabItem(icon: Icons.layers_rounded, label: 'POS'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EEF8),
      body: Column(
        children: [
          _buildTopBar(context),
          _buildTabBar(),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      height: 60 + MediaQuery.of(context).padding.top,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1A237E), Color(0xFF3949AB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
              onPressed: () => Navigator.pop(context),
            ),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Kimbub Factory', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Company Profile', style: TextStyle(color: Colors.white60, fontSize: 12)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left, color: Colors.white, size: 18),
                  onPressed: _currentTab > 0 ? () => setState(() => _currentTab--) : null,
                  padding: EdgeInsets.zero, constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 6),
                Text('${_currentTab + 1}/${_tabs.length}',
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(width: 6),
                IconButton(
                  icon: const Icon(Icons.chevron_right, color: Colors.white, size: 18),
                  onPressed: _currentTab < _tabs.length - 1 ? () => setState(() => _currentTab++) : null,
                  padding: EdgeInsets.zero, constraints: const BoxConstraints(),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: List.generate(_tabs.length, (i) {
            final tab = _tabs[i];
            final isActive = i == _currentTab;
            return GestureDetector(
              onTap: () => setState(() => _currentTab = i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFF3949AB) : Colors.transparent,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(tab.icon, size: 16, color: isActive ? Colors.white : Colors.grey),
                    if (isActive) ...[
                      const SizedBox(width: 6),
                      Text(tab.label, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_currentTab) {
      case 0: return KimbubFactoryData.buildAbout();
      case 1: return KimbubFactoryData.buildOrg();
      case 2: return KimbubFactoryData.buildLayout();
      case 3: return KimbubFactoryData.buildBM();
      case 4: return KimbubFactoryData.buildIT();
      case 5: return KimbubFactoryData.buildFinance();
      case 6: return KimbubFactoryData.buildCRM();
      case 7: return KimbubFactoryData.buildPDCA();
      case 8: return KimbubFactoryData.buildPOS();
      default: return KimbubFactoryData.buildAbout();
    }
  }
}

class _TabItem {
  final IconData icon;
  final String label;
  const _TabItem({required this.icon, required this.label});
}