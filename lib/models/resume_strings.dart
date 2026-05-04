import 'resume_data.dart';

class ResumeStrings {
  final String name;
  final String title;
  final String tagline;
  final String availableForHire;
  final String summary;
  final String openToOpportunities;
  final String getInTouch;
  final String sectionExperience;
  final String sectionEducation;
  final String sectionSkills;
  final String sectionAwards;
  final String sectionSocialActivity;
  final String yearsExp;
  final String mobile;
  final String web;
  final String architecture;
  final List<ExperienceItem> experience;
  final List<EducationItem> education;
  final List<SkillCategory> skills;
  final List<AwardItem> awards;
  final List<String> socialActivity;

  const ResumeStrings({
    required this.name,
    required this.title,
    required this.tagline,
    required this.availableForHire,
    required this.summary,
    required this.openToOpportunities,
    required this.getInTouch,
    required this.sectionExperience,
    required this.sectionEducation,
    required this.sectionSkills,
    required this.sectionAwards,
    required this.sectionSocialActivity,
    required this.yearsExp,
    required this.mobile,
    required this.web,
    required this.architecture,
    required this.experience,
    required this.education,
    required this.skills,
    required this.awards,
    required this.socialActivity,
  });

  static const ResumeStrings en = ResumeStrings(
    name: 'Khurshidakhon N. Toshbekova',
    title: 'Software Developer',
    tagline: 'Flutter · REST API · Clean Architecture',
    availableForHire: 'AVAILABLE FOR HIRE',
    summary:
        'Software Developer with 3+ years of experience building cross-platform mobile '
        'and web applications. Proficient in Flutter/Dart for mobile development and Vue 2/3 '
        'for web, with a strong focus on clean architecture, real-time features, and scalable '
        'project design. Experienced mentor and team contributor with a background spanning '
        'development, business analysis, and project management.',
    openToOpportunities: 'Open to opportunities',
    getInTouch: 'Get In Touch >>>',
    sectionExperience: 'Experience',
    sectionEducation: 'Education',
    sectionSkills: 'Skills',
    sectionAwards: 'Awards',
    sectionSocialActivity: 'Social Activity',
    yearsExp: 'Years Exp',
    mobile: 'Mobile',
    web: 'Web',
    architecture: 'Architecture',
    experience: [
      ExperienceItem(
        company: 'OOO "Dynatec"',
        role: 'Software Developer',
        period: 'October 2022 – January 2026',
        location: 'Uzbekistan',
        stackLabel: 'Flutter stack',
        stack:
            'Flutter, Postgres, REST API, WebSocket, Google Maps, Clean Architecture, Claude (AI tool)',
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
        stack:
            'Vue 2/3, Postgres, REST API, WebSocket, Python (partial), Clean Architecture, Claude (AI tool)',
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
        stack:
            'Flutter (basics), Camera, Google Maps, Clean Architecture, Microsoft Office tools',
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
        stack:
            'HTML, CSS, Bootstrap, JavaScript · Java, MySQL, Eclipse, Firebase, Android Studio',
        bullets: [
          'Developed websites for Inha University, Nizambaeva Models Agency, and Common Invest Group.',
          'Developed desktop queue-management system for clinics.',
          'Built a messenger application "Chatting".',
        ],
      ),
    ],
    education: [
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
    ],
    skills: [
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
        skills: [
          'Clean Architecture',
          'BLoC',
          'Scalable components',
          'ERP systems'
        ],
      ),
      SkillCategory(
        category: 'Tools',
        skills: ['Git', 'Android Studio', 'VS Code', 'Trello', 'Active Collab'],
      ),
      SkillCategory(
        category: 'Languages',
        skills: ['Uzbek (native)', 'Russian (advanced)', 'English (advanced)'],
      ),
    ],
    awards: [
      AwardItem(title: "Dean's List", detail: 'Top students of the university'),
      AwardItem(
          title: 'Technovation Challenge Uzbekistan',
          detail: '"Best Social Application"'),
      AwardItem(
          title: 'Top 100 Innovative Women Projects of Uzbekistan', detail: ''),
    ],
    socialActivity: [
      'Volunteer at charity fair "Time of Miracles" (2019)',
      'Volunteer at Touch Math Festival (2018)',
      'Volunteer at Google I/O Extended (2017)',
      'Volunteer at Touch Math Festival (2016)',
    ],
  );

  static const ResumeStrings ru = ResumeStrings(
    name: 'Хуршидахон Н. Тошбекова',
    title: 'Разработчик ПО',
    tagline: 'Flutter · REST API · Чистая архитектура',
    availableForHire: 'ОТКРЫТА К ПРЕДЛОЖЕНИЯМ',
    summary:
        'Разработчик ПО с опытом 3+ лет в создании кроссплатформенных мобильных '
        'и веб-приложений. Экспертиза в Flutter/Dart для мобильной разработки с упором на чистую архитектуру, функции реального времени и масштабируемое '
        'проектирование. Опытный ментор и командный игрок с бэкграундом в разработке, '
        'бизнес-анализе и управлении проектами.',
    openToOpportunities: 'Открыта к новым возможностям',
    getInTouch: 'Написать мне >>>',
    sectionExperience: 'Опыт работы',
    sectionEducation: 'Образование',
    sectionSkills: 'Навыки',
    sectionAwards: 'Достижения',
    sectionSocialActivity: 'Социальная активность',
    yearsExp: 'лет опыта',
    mobile: 'Мобайл',
    web: 'Веб',
    architecture: 'Архитектура',
    experience: [
      ExperienceItem(
        company: 'ООО «Dynatec»',
        role: 'Разработчик ПО',
        period: 'Октябрь 2022 – Январь 2026',
        location: 'Узбекистан',
        stackLabel: 'Flutter стек',
        stack:
            'Flutter, Postgres, REST API, WebSocket, Google Maps, Clean Architecture, Claude (AI-инструмент)',
        bullets: [
          'Разработка и поддержка кроссплатформенных приложений на Flutter/Dart.',
          'Сканирование BLE-устройств, логика подключения и визуализация данных.',
          'Построение масштабируемой архитектуры проекта и переиспользуемых компонентов.',
          'Работа с REST API: обработка ошибок, интерсепторы, обновление токенов.',
          'Реализация WebSocket для обновлений в реальном времени.',
          'Интеграция карт (Flutter Google Maps и другие пакеты).',
          'Работа с маркерами, кастомными иконками и инфо-окнами.',
        ],
      ),
      ExperienceItem(
        company: 'ООО «Dynatec»',
        role: 'Разработчик ПО (Vue / ERP)',
        period: 'Октябрь 2022 – Январь 2026',
        location: 'Узбекистан',
        stackLabel: 'Vue стек',
        stack:
            'Vue 2/3, Postgres, REST API, WebSocket, Python (частично), Clean Architecture, Claude (AI-инструмент)',
        bullets: [
          'Разработка ERP-системы с нуля для B2C.',
          'Разработка и поддержка приложений на Vue 2/3.',
          'Реализация мультиязычной поддержки: EN/ES/NL/RU/UZ.',
          'Страницы с генерацией QR-кодов.',
          'Работа с REST API: обработка ошибок, интерсепторы, обновление токенов.',
          'Реализация WebSocket для данных в реальном времени.',
        ],
      ),
      ExperienceItem(
        company: '#ITGIRLS',
        role: 'Ментор Flutter/Dart',
        period: 'Январь 2022 – Декабрь 2022',
        location: 'Узбекистан',
        stackLabel: 'Стек',
        stack:
            'Flutter (основы), Camera, Google Maps, Clean Architecture, Microsoft Office',
        bullets: [
          'Обучение Flutter и Dart с нуля.',
          'Проверка домашних заданий и предоставление обратной связи по коду.',
          'Подготовка учебных материалов по Flutter для начинающих.',
        ],
      ),
      ExperienceItem(
        company: 'ООО «Deloitte and Touche»',
        role: 'Бизнес-аналитик',
        period: 'Октябрь 2019 – Декабрь 2020',
        location: 'Узбекистан',
        stackLabel: '',
        stack: '',
        bullets: [
          'Выявление IT-рисков в бизнес-процессах.',
          'Разработка рекомендаций по улучшению IT-процессов и безопасности.',
          'Презентация проектов компании клиентам.',
          'Проведение интервью и переговоров с клиентами.',
        ],
      ),
      ExperienceItem(
        company: 'Bazis Digital',
        role: 'Менеджер проектов',
        period: 'Август 2019 – Октябрь 2019',
        location: 'Узбекистан',
        stackLabel: 'Стек',
        stack: 'Active Collab, Trello, Microsoft Office',
        bullets: [
          'Планирование, координация и завершение проектов компании в срок и в рамках бюджета.',
        ],
      ),
      ExperienceItem(
        company: 'Technovation Challenge',
        role: 'Ментор',
        period: 'Февраль 2017 – Май 2017',
        location: 'Узбекистан',
        stackLabel: 'Стек',
        stack: 'AppInventor, Google Maps',
        bullets: [
          'Обучение девушек созданию Android-приложений на AppInventor.',
          'Подготовка учебных материалов и заданий (учебная программа Technovation).',
          'Помощь в создании бизнес-планов для приложений.',
        ],
      ),
      ExperienceItem(
        company: 'Фриланс',
        role: 'Веб-разработчик и бэкенд-разработчик',
        period: '2017 – 2019',
        location: 'Узбекистан',
        stackLabel: 'Стек',
        stack:
            'HTML, CSS, Bootstrap, JavaScript · Java, MySQL, Eclipse, Firebase, Android Studio',
        bullets: [
          'Разработка сайтов для Inha University, Nizambaeva Models Agency и Common Invest Group.',
          'Разработка десктопной системы управления очередью для клиник.',
          'Создание мессенджера «Chatting».',
        ],
      ),
    ],
    education: [
      EducationItem(
        institution: 'Университет Инха в Ташкенте',
        degree: 'Бакалавр по специальности «Информационные и коммуникационные технологии»',
        period: 'Окончила май 2019',
        location: 'Ташкент, Узбекистан',
        details: 'Факультет компьютерных и информационных технологий',
      ),
      EducationItem(
        institution: 'CISCO Networking Academy',
        degree: 'Сертификат по сетевым технологиям',
        period: 'Окончила август 2017',
        location: 'Ташкент, Узбекистан',
        details: '',
      ),
      EducationItem(
        institution: 'Udemy',
        degree: 'Полный курс Flutter & Dart',
        period: 'Завершила август 2021',
        location: 'Онлайн',
        details: '',
      ),
    ],
    skills: [
      SkillCategory(
        category: 'Мобайл',
        skills: ['Flutter', 'Dart', 'BLE интеграция', 'Google Maps'],
      ),
      SkillCategory(
        category: 'Веб',
        skills: ['Vue 2/3', 'HTML', 'CSS', 'Bootstrap', 'JavaScript'],
      ),
      SkillCategory(
        category: 'Бэкенд и данные',
        skills: ['REST API', 'WebSocket', 'PostgreSQL', 'Firebase', 'MySQL'],
      ),
      SkillCategory(
        category: 'Архитектура',
        skills: [
          'Чистая архитектура',
          'BLoC',
          'Масштабируемые компоненты',
          'ERP-системы'
        ],
      ),
      SkillCategory(
        category: 'Инструменты',
        skills: ['Git', 'Android Studio', 'VS Code', 'Trello', 'Active Collab'],
      ),
      SkillCategory(
        category: 'Языки',
        skills: [
          'Узбекский (родной)',
          'Русский (продвинутый)',
          'Английский (продвинутый)'
        ],
      ),
    ],
    awards: [
      AwardItem(
          title: 'Список декана', detail: 'Лучшие студенты университета'),
      AwardItem(
          title: 'Technovation Challenge Узбекистан',
          detail: '«Лучшее социальное приложение»'),
      AwardItem(
          title: 'Топ-100 инновационных женских проектов Узбекистана',
          detail: ''),
    ],
    socialActivity: [
      'Волонтёр благотворительной ярмарки «Время чудес» (2019)',
      'Волонтёр Touch Math Festival (2018)',
      'Волонтёр Google I/O Extended (2017)',
      'Волонтёр Touch Math Festival (2016)',
    ],
  );
}
