class ResumeData {
  static const String name = 'Khurshidakhon N. Toshbekova';
  static const String title = 'Software Developer';
  static const String tagline = 'Flutter · Vue · Clean Architecture · 6+ years of experience';
  static const String email = 'toshbekova.khurshidakhon@gmail.com';
  static const String phone = '+99890 942 32 36';
  static const String location = 'Tashkent, Uzbekistan';
  static const String linkedin = 'linkedin.com/in/khurshida-toshbekova';

  static const String summary =
      'Software Developer with 3+ years of experience building cross-platform mobile '
      'and web applications. Proficient in Flutter/Dart for mobile development with a strong focus on clean architecture, real-time features, and scalable '
      'project design. Experienced mentor and team contributor with a background spanning '
      'development, business analysis, and project management.';

  static const List<ExperienceItem> experience = [
    ExperienceItem(
      company: 'OOO "Dynatec"',
      role: 'Software Developer',
      period: 'October 2022 – January 2026',
      location: 'Uzbekistan',
      stackLabel: 'Flutter stack',
      stack: 'Flutter, Postgres, REST API, WebSocket, Google Maps, Clean Architecture, Claude (AI tool)',
      bullets: [
        'Development and maintenance of cross-platform applications using Flutter/Dart.',
        'BLE device scanning, connection logic, and data visualization.',
        'Building scalable project architecture and reusable components.',
        'Working with REST API, error handling, interceptors, token refresh.',
        'Implementing WebSocket for real-time updates.',
        'Map integration (Flutter Google Maps and other packages).',
        'Working with markers, custom icons, and info windows.',
      ],
    ),
    ExperienceItem(
      company: 'OOO "Dynatec"',
      role: 'Software Developer (Vue / ERP)',
      period: 'October 2022 – January 2026',
      location: 'Uzbekistan',
      stackLabel: 'Vue stack',
      stack: 'Vue 2/3, Postgres, REST API, WebSocket, Python (partial), Clean Architecture, Claude (AI tool)',
      bullets: [
        'Building an ERP system from scratch for B2C.',
        'Development and maintenance of applications using Vue 2/3.',
        'Implementing multilingual support: EN/ES/NL/RU/UZ.',
        'Pages with QR-code generation.',
        'Working with REST API, error handling, interceptors, token refresh.',
        'Implementing WebSocket for real-time data.',
      ],
    ),
    ExperienceItem(
      company: '#ITGIRLS',
      role: 'Flutter/Dart Mentor',
      period: 'January 2022 – December 2022',
      location: 'Uzbekistan',
      stackLabel: 'Stack',
      stack: 'Flutter (basics), Camera, Google Maps, Clean Architecture, Microsoft Office tools',
      bullets: [
        'Teaching Flutter and Dart from scratch.',
        'Reviewing assignments and providing code feedback.',
        'Preparing beginner-friendly Flutter lessons.',
      ],
    ),
    ExperienceItem(
      company: 'OOO "Deloitte and Touche"',
      role: 'Business Analyst',
      period: 'October 2019 – December 2020',
      location: 'Uzbekistan',
      stackLabel: '',
      stack: '',
      bullets: [
        'Identifying IT risks in business processes.',
        'Providing recommendations for improving IT processes and security.',
        'Presenting company projects to clients.',
        'Conducting client interviews and negotiations.',
      ],
    ),
    ExperienceItem(
      company: 'Bazis Digital',
      role: 'Project Manager',
      period: 'August 2019 – October 2019',
      location: 'Uzbekistan',
      stackLabel: 'Stack',
      stack: 'Active Collab, Trello, Microsoft Office tools',
      bullets: [
        'Planning, coordinating, and completing company projects within deadlines and budget.',
      ],
    ),
    ExperienceItem(
      company: 'Technovation Challenge',
      role: 'Mentor',
      period: 'February 2017 – May 2017',
      location: 'Uzbekistan',
      stackLabel: 'Stack',
      stack: 'AppInventor, Google Maps',
      bullets: [
        'Teaching girls to build Android applications using AppInventor.',
        'Preparing lesson materials and assignments (Technovation Curriculum).',
        'Supporting creation of business plans for the applications.',
      ],
    ),
    ExperienceItem(
      company: 'Freelance',
      role: 'Web Developer & Backend Developer',
      period: '2017 – 2019',
      location: 'Uzbekistan',
      stackLabel: 'Stack',
      stack: 'HTML, CSS, Bootstrap, JavaScript · Java, MySQL, Eclipse, Firebase, Android Studio',
      bullets: [
        'Developed websites for Inha University, Nizambaeva Models Agency, and Common Invest Group.',
        'Developed desktop queue-management system for clinics.',
        'Built a messenger application "Chatting".',
      ],
    ),
  ];

  static const List<EducationItem> education = [
    EducationItem(
      institution: 'Inha University in Tashkent',
      degree: 'B.Sc. in Information Communication Engineering',
      period: 'Graduated May 2019',
      location: 'Tashkent, Uzbekistan',
      details: 'School of Computer and Information Engineering',
    ),
    EducationItem(
      institution: 'CISCO Networking Academy',
      degree: 'Networking Certificate',
      period: 'Graduated August 2017',
      location: 'Tashkent, Uzbekistan',
      details: '',
    ),
    EducationItem(
      institution: 'Udemy',
      degree: 'Flutter & Dart Complete Guide',
      period: 'Completed August 2021',
      location: 'Online',
      details: '',
    ),
  ];

  static const List<SkillCategory> skills = [
    SkillCategory(
      category: 'Mobile',
      skills: ['Flutter', 'Dart', 'BLE integration', 'Google Maps'],
    ),
    SkillCategory(
      category: 'Web',
      skills: ['Vue 2/3', 'HTML', 'CSS', 'Bootstrap', 'JavaScript'],
    ),
    SkillCategory(
      category: 'Backend & Data',
      skills: ['REST API', 'WebSocket', 'PostgreSQL', 'Firebase', 'MySQL'],
    ),
    SkillCategory(
      category: 'Architecture',
      skills: ['Clean Architecture', 'BLoC', 'Scalable components', 'ERP systems'],
    ),
    SkillCategory(
      category: 'Tools',
      skills: ['Git', 'Android Studio', 'VS Code', 'Trello', 'Active Collab'],
    ),
    SkillCategory(
      category: 'Languages',
      skills: ['Uzbek (native)', 'Russian (advanced)', 'English (advanced)'],
    ),
  ];

  static const List<AwardItem> awards = [
    AwardItem(title: "Dean's List", detail: 'Top students of the university'),
    AwardItem(
        title: 'Technovation Challenge Uzbekistan',
        detail: '"Best Social Application"'),
    AwardItem(
        title: 'Top 100 Innovative Women Projects of Uzbekistan', detail: ''),
  ];

  static const List<String> socialActivity = [
    'Volunteer at charity fair "Time of Miracles" (2019)',
    'Volunteer at Touch Math Festival (2018)',
    'Volunteer at Google I/O Extended (2017)',
    'Volunteer at Touch Math Festival (2016)',
  ];
}

class ExperienceItem {
  final String company;
  final String role;
  final String period;
  final String location;
  final String stackLabel;
  final String stack;
  final List<String> bullets;

  const ExperienceItem({
    required this.company,
    required this.role,
    required this.period,
    required this.location,
    required this.stackLabel,
    required this.stack,
    required this.bullets,
  });
}

class EducationItem {
  final String institution;
  final String degree;
  final String period;
  final String location;
  final String details;

  const EducationItem({
    required this.institution,
    required this.degree,
    required this.period,
    required this.location,
    required this.details,
  });
}

class SkillCategory {
  final String category;
  final List<String> skills;

  const SkillCategory({required this.category, required this.skills});
}

class AwardItem {
  final String title;
  final String detail;

  const AwardItem({required this.title, required this.detail});
}
