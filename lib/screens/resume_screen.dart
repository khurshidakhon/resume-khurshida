import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/resume_data.dart';
import '../models/resume_strings.dart';
import '../widgets/animated_section.dart';
import '../widgets/section_header.dart';
import '../widgets/skill_chip.dart';

class ResumeScreen extends StatefulWidget {
  final bool isRussian;
  final VoidCallback onToggleLanguage;

  const ResumeScreen({
    super.key,
    required this.isRussian,
    required this.onToggleLanguage,
  });

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen>
    with TickerProviderStateMixin {
  late AnimationController _heroController;
  late AnimationController _orb1Controller;
  late AnimationController _orb2Controller;
  late AnimationController _pulseController;
  late AnimationController _scanController;

  late Animation<double> _heroOpacity;
  late Animation<Offset> _heroSlide;
  late Animation<double> _orb1Anim;
  late Animation<double> _orb2Anim;
  late Animation<double> _pulseAnim;
  late Animation<double> _scanAnim;

  ResumeStrings get _s =>
      widget.isRussian ? ResumeStrings.ru : ResumeStrings.en;

  @override
  void initState() {
    super.initState();

    _heroController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _heroOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _heroController, curve: Curves.easeOut),
    );
    _heroSlide = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _heroController, curve: Curves.easeOut));

    _orb1Controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat(reverse: true);
    _orb1Anim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _orb1Controller, curve: Curves.easeInOut),
    );

    _orb2Controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat(reverse: true);
    _orb2Anim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _orb2Controller, curve: Curves.easeInOut),
    );

    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnim = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _scanController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    _scanAnim = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _scanController, curve: Curves.linear),
    );

    _heroController.forward();
  }

  @override
  void dispose() {
    _heroController.dispose();
    _orb1Controller.dispose();
    _orb2Controller.dispose();
    _pulseController.dispose();
    _scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isWide = w > 900;
    final hPad =
        isWide ? (w - 860).clamp(0.0, double.infinity) / 2 + 24.0 : 20.0;

    return Scaffold(
      backgroundColor: AppTheme.surface,
      body: CustomScrollView(
        slivers: [
          _buildHero(hPad),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: hPad),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 48),
                AnimatedSection(
                  delay: const Duration(milliseconds: 150),
                  child: _buildSummary(),
                ),
                const SizedBox(height: 52),
                AnimatedSection(
                  delay: const Duration(milliseconds: 250),
                  child: _buildExperience(),
                ),
                const SizedBox(height: 52),
                AnimatedSection(
                  delay: const Duration(milliseconds: 350),
                  child: _buildEducation(),
                ),
                const SizedBox(height: 52),
                AnimatedSection(
                  delay: const Duration(milliseconds: 450),
                  child: _buildSkills(),
                ),
                const SizedBox(height: 52),
                AnimatedSection(
                  delay: const Duration(milliseconds: 550),
                  child: _buildAwards(),
                ),
                const SizedBox(height: 52),
                AnimatedSection(
                  delay: const Duration(milliseconds: 650),
                  child: _buildSocialActivity(),
                ),
                const SizedBox(height: 72),
                AnimatedSection(
                  delay: const Duration(milliseconds: 750),
                  child: _buildFooter(),
                ),
                const SizedBox(height: 48),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  // ─── HERO ────────────────────────────────────────────────────────────────────

  Widget _buildHero(double hPad) {
    return SliverToBoxAdapter(
      child: FadeTransition(
        opacity: _heroOpacity,
        child: SlideTransition(
          position: _heroSlide,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1A0533),
                  Color(0xFF2D0A50),
                  Color(0xFF0F0A1E),
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(child: _buildOrbs()),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: hPad, vertical: 56),
                  child: Column(
                    children: [
                      _buildPhotoAndName(),
                      const SizedBox(height: 32),
                      _buildContactRow(),
                      const SizedBox(height: 28),
                      _buildStatsBadges(),
                      const SizedBox(height: 24),
                      _buildLanguageToggle(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageToggle() {
    final isRu = widget.isRussian;
    return GestureDetector(
      onTap: widget.onToggleLanguage,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.white.withOpacity(0.12)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _langTab('EN', !isRu),
            _langTab('RU', isRu),
          ],
        ),
      ),
    );
  }

  Widget _langTab(String label, bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: active ? AppTheme.purple : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? Colors.white : Colors.white.withOpacity(0.45),
          fontSize: 13,
          fontWeight: active ? FontWeight.w700 : FontWeight.w400,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildOrbs() {
    return AnimatedBuilder(
      animation: Listenable.merge([_orb1Anim, _orb2Anim]),
      builder: (context, _) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            const SizedBox.expand(),
            Positioned(
              top: -60 + _orb1Anim.value * 30,
              right: -40 + _orb1Anim.value * 20,
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.purple.withOpacity(0.35),
                      AppTheme.purple.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -80 + _orb2Anim.value * 25,
              left: -60 + _orb2Anim.value * 15,
              child: Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.purpleLight.withOpacity(0.20),
                      AppTheme.purpleLight.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80 + _orb1Anim.value * 20,
              left: 100 + _orb2Anim.value * 10,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF9333EA).withOpacity(0.18),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPhotoAndName() {
    return LayoutBuilder(builder: (context, constraints) {
      final isNarrow = constraints.maxWidth < 560;
      if (isNarrow) {
        return Column(
          children: [
            _buildPhotoFrame(),
            const SizedBox(height: 24),
            _buildNameBlock(center: true),
          ],
        );
      }
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildPhotoFrame(),
          const SizedBox(width: 36),
          Expanded(child: _buildNameBlock(center: false)),
        ],
      );
    });
  }

  Widget _buildPhotoFrame() {
    return AnimatedBuilder(
      animation: _pulseAnim,
      builder: (context, child) {
        return Transform.scale(
          scale: _pulseAnim.value,
          child: child,
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 148,
            height: 148,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  AppTheme.purple,
                  AppTheme.purpleLight,
                  Colors.transparent,
                  AppTheme.purple,
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _scanAnim,
            builder: (context, _) {
              return ClipOval(
                child: SizedBox(
                  width: 144,
                  height: 144,
                  child: CustomPaint(
                    painter: _ScanPainter(_scanAnim.value),
                  ),
                ),
              );
            },
          ),
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.15), width: 2),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF3B1068),
                  Color(0xFF1E0B3A),
                ],
              ),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/photo.png',
                width: 140,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ..._buildScanCorners(),
        ],
      ),
    );
  }

  List<Widget> _buildScanCorners() {
    const arm = 14.0;
    const thick = 2.5;
    const color = AppTheme.purpleLight;

    Widget corner(AlignmentGeometry align, bool flipX, bool flipY) {
      return Positioned.fill(
        child: Align(
          alignment: align,
          child: Transform.scale(
            scaleX: flipX ? -1 : 1,
            scaleY: flipY ? -1 : 1,
            child: const SizedBox(
              width: arm + 6,
              height: arm + 6,
              child: CustomPaint(
                painter: _CornerPainter(color: color, arm: arm, thick: thick),
              ),
            ),
          ),
        ),
      );
    }

    return [
      corner(Alignment.topLeft, false, false),
      corner(Alignment.topRight, true, false),
      corner(Alignment.bottomLeft, false, true),
      corner(Alignment.bottomRight, true, true),
    ];
  }

  Widget _buildNameBlock({required bool center}) {
    return Column(
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: AppTheme.purple.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppTheme.purpleLight.withOpacity(0.4)),
          ),
          child: Text(
            _s.availableForHire,
            style: const TextStyle(
              color: AppTheme.purpleLight,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          widget.isRussian ? 'Хуршидахон\nТошбекова' : 'Khurshidakhon\nToshbekova',
          textAlign: center ? TextAlign.center : TextAlign.left,
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            letterSpacing: -0.5,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment:
              center ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Container(
              width: 3,
              height: 18,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppTheme.purple, AppTheme.purpleLight],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              _s.title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: AppTheme.purpleLight,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          _s.tagline,
          textAlign: center ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.55),
          ),
        ),
      ],
    );
  }

  Widget _buildContactRow() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 8,
      children: [
        _contactBadge(Icons.email_outlined, ResumeData.email),
        _contactBadge(Icons.phone_outlined, ResumeData.phone),
        _contactBadge(Icons.location_on_outlined, ResumeData.location),
        _contactBadge(Icons.link, ResumeData.linkedin),
      ],
    );
  }

  Widget _contactBadge(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppTheme.purpleLight),
          const SizedBox(width: 7),
          Text(
            label,
            style: const TextStyle(color: AppTheme.textLight, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsBadges() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _statBadge('6+', _s.yearsExp),
        _statDivider(),
        _statBadge('Flutter', _s.mobile),
        _statDivider(),
        _statBadge('Rest API', _s.web),
        _statDivider(),
        _statBadge('Clean', _s.architecture),
      ],
    );
  }

  Widget _statBadge(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.45),
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _statDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 1,
        height: 36,
        color: Colors.white.withOpacity(0.12),
      ),
    );
  }

  // ─── SUMMARY ─────────────────────────────────────────────────────────────────

  Widget _buildSummary() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.purpleMid.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: AppTheme.purple.withOpacity(0.07),
            blurRadius: 24,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppTheme.purple, AppTheme.purpleLight],
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 22),
          Expanded(
            child: Text(
              _s.summary,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }

  // ─── EXPERIENCE ──────────────────────────────────────────────────────────────

  Widget _buildExperience() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: _s.sectionExperience, icon: Icons.work_outline),
        ..._s.experience.asMap().entries.map(
              (e) => AnimatedSection(
                delay: Duration(milliseconds: 80 * e.key),
                child: _ExperienceCard(item: e.value),
              ),
            ),
      ],
    );
  }

  // ─── EDUCATION ───────────────────────────────────────────────────────────────

  Widget _buildEducation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: _s.sectionEducation, icon: Icons.school_outlined),
        ..._s.education.map((e) => _EducationCard(item: e)),
      ],
    );
  }

  // ─── SKILLS ──────────────────────────────────────────────────────────────────

  Widget _buildSkills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: _s.sectionSkills, icon: Icons.psychology_outlined),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: _cardDecor(),
          child: Column(
            children:
                _s.skills.map((cat) => _SkillGroup(category: cat)).toList(),
          ),
        ),
      ],
    );
  }

  // ─── AWARDS ──────────────────────────────────────────────────────────────────

  Widget _buildAwards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
            title: _s.sectionAwards, icon: Icons.emoji_events_outlined),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: _cardDecor(),
          child: Column(
            children: _s.awards.asMap().entries.map((entry) {
              final isLast = entry.key == _s.awards.length - 1;
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppTheme.purple, AppTheme.purpleLight],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.star_outline,
                            color: Colors.white, size: 16),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(entry.value.title,
                                style: Theme.of(context).textTheme.titleMedium),
                            if (entry.value.detail.isNotEmpty) ...[
                              const SizedBox(height: 2),
                              Text(entry.value.detail,
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (!isLast)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(color: AppTheme.divider, height: 1),
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // ─── SOCIAL ACTIVITY ─────────────────────────────────────────────────────────

  Widget _buildSocialActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
            title: _s.sectionSocialActivity,
            icon: Icons.volunteer_activism_outlined),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: _cardDecor(),
          child: Column(
            children: _s.socialActivity.map((item) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: AppTheme.purple,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(item,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // ─── FOOTER ──────────────────────────────────────────────────────────────────

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF1A0533), Color(0xFF2D0A50)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            _s.openToOpportunities,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            ResumeData.email,
            style: TextStyle(
              color: AppTheme.purpleLight,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppTheme.purple, AppTheme.purpleLight],
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              _s.getInTouch,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _cardDecor() {
    return BoxDecoration(
      color: AppTheme.cardBg,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppTheme.purpleMid.withOpacity(0.4)),
      boxShadow: [
        BoxShadow(
          color: AppTheme.purple.withOpacity(0.06),
          blurRadius: 20,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}

// ─── EXPERIENCE CARD ─────────────────────────────────────────────────────────

class _ExperienceCard extends StatefulWidget {
  final ExperienceItem item;
  const _ExperienceCard({required this.item});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: AppTheme.cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _hovered
                ? AppTheme.purple.withOpacity(0.5)
                : AppTheme.purpleMid.withOpacity(0.4),
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.purple
                  .withOpacity(_hovered ? 0.12 : 0.06),
              blurRadius: _hovered ? 28 : 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.item.role,
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 3),
                      Text(
                        widget.item.company,
                        style: const TextStyle(
                          color: AppTheme.purple,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _badge(Icons.calendar_today_outlined, widget.item.period),
                    const SizedBox(height: 4),
                    _badge(Icons.place_outlined, widget.item.location),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),
            const Divider(color: AppTheme.divider, height: 1),
            const SizedBox(height: 14),
            ...widget.item.bullets.map(
              (b) => Padding(
                padding: const EdgeInsets.only(bottom: 7),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: AppTheme.purple,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(b,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
            ),
            if (widget.item.stack.isNotEmpty) ...[
              const SizedBox(height: 12),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppTheme.purpleSoft,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.item.stackLabel.isNotEmpty
                            ? '${widget.item.stackLabel}: '
                            : 'Stack: ',
                        style: const TextStyle(
                          color: AppTheme.purple,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: widget.item.stack,
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _badge(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 12, color: AppTheme.textSecondary),
        const SizedBox(width: 4),
        Text(label,
            style:
                const TextStyle(color: AppTheme.textSecondary, fontSize: 12)),
      ],
    );
  }
}

// ─── EDUCATION CARD ──────────────────────────────────────────────────────────

class _EducationCard extends StatelessWidget {
  final EducationItem item;
  const _EducationCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppTheme.purpleMid.withOpacity(0.4)),
          boxShadow: [
            BoxShadow(
              color: AppTheme.purple.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppTheme.purple, AppTheme.purpleLight],
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.school_outlined,
                  color: Colors.white, size: 22),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.degree,
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 2),
                  Text(item.institution,
                      style: const TextStyle(
                          color: AppTheme.purple,
                          fontSize: 13,
                          fontWeight: FontWeight.w500)),
                  if (item.details.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(item.details,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(item.period,
                    style: const TextStyle(
                        color: AppTheme.textSecondary, fontSize: 12)),
                const SizedBox(height: 2),
                Text(item.location,
                    style: const TextStyle(
                        color: AppTheme.textSecondary, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─── SKILL GROUP ─────────────────────────────────────────────────────────────

class _SkillGroup extends StatelessWidget {
  final SkillCategory category;
  const _SkillGroup({required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                category.category,
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  category.skills.map((s) => SkillChip(label: s)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── CUSTOM PAINTERS ─────────────────────────────────────────────────────────

class _ScanPainter extends CustomPainter {
  final double progress;
  _ScanPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final y = size.height * progress;

    final gradPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          AppTheme.purpleLight.withOpacity(0.5),
          Colors.transparent,
        ],
        stops: const [0, 0.5, 1],
      ).createShader(Rect.fromLTWH(0, y - 20, size.width, 40));

    canvas.drawRect(
      Rect.fromLTWH(0, y - 20, size.width, 40),
      gradPaint,
    );

    canvas.drawLine(
      Offset(0, y),
      Offset(size.width, y),
      Paint()
        ..color = AppTheme.purpleLight.withOpacity(0.8)
        ..strokeWidth = 1.5,
    );
  }

  @override
  bool shouldRepaint(_ScanPainter old) => old.progress != progress;
}

class _CornerPainter extends CustomPainter {
  final Color color;
  final double arm;
  final double thick;

  const _CornerPainter(
      {required this.color, required this.arm, required this.thick});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thick
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawLine(const Offset(0, 0), Offset(arm, 0), paint);
    canvas.drawLine(const Offset(0, 0), Offset(0, arm), paint);
  }

  @override
  bool shouldRepaint(_CornerPainter old) => false;
}
