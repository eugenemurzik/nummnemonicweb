/// Text of the privacy policy for the NumMnemonic mobile app.
///
/// Paragraphs are separated into list entries. A paragraph whose lines all
/// start with `- ` is rendered as a bulleted list. Occurrences of the support
/// email address are rendered as `mailto:` links.
abstract final class PrivacyPolicyContent {
  static const title = 'Privacy Policy for Nummnemonic';

  static const lastUpdated = 'February 4, 2026';

  static const intro =
      'Nummnemonic respects your privacy. This Privacy Policy explains how '
      'information is collected and used when you use the Nummnemonic mobile '
      'application.';

  static const sections = <({String title, List<String> paragraphs})>[
    (
      title: 'Information We Collect',
      paragraphs: [
        'Depending on how you use the app, we may collect the following types '
            'of information:',
        '- Account information: your email address, used solely for account '
            'authentication (Firebase Authentication).\n'
            '- App usage information (analytics): app interactions (such as '
            'screens viewed and features used), basic usage statistics, and '
            'app performance signals.\n'
            '- Device and app information: such as operating system version '
            'and app version.',
        'We do not collect your name for identification, and we do not collect '
            'the content of your personal notes or learning materials as '
            '“analytics content.”',
      ],
    ),
    (
      title: 'How We Use Information',
      paragraphs: [
        'We use the collected information to:',
        '- Provide login functionality and secure access to your account\n'
            '- Improve app stability and performance\n'
            '- Understand which features are most useful and improve user '
            'experience',
        'We do not use your data for advertising.',
      ],
    ),
    (
      title: 'Analytics',
      paragraphs: [
        'We use Firebase Analytics, a service provided by Google, to understand '
            'how users interact with the app and to improve functionality, '
            'performance, and user experience.',
        'Firebase Analytics may collect:',
        '- Anonymous or aggregated usage data (e.g., screens viewed, feature '
            'usage)\n'
            '- Device identifiers used for analytics purposes (e.g., app '
            'instance identifiers)\n'
            '- Device and app information (e.g., OS version, app version).',
        'Note: We do not use Firebase Analytics for cross-app tracking. If we '
            'ever introduce tracking-related features (e.g., ads attribution '
            'using device advertising identifiers), we will update this policy '
            'and, where required, request permission.',
      ],
    ),
    (
      title: 'Third-Party Services',
      paragraphs: [
        'We use the following third-party services provided by Google LLC:',
        '- Firebase Authentication – to manage user authentication (login)\n'
            '- Firebase Analytics – to collect and analyze usage metrics and '
            'improve the app.',
      ],
    ),
    (
      title: 'Data Storage',
      paragraphs: [
        'All learning and progress data is stored locally on your device.',
        'Your email address is stored as part of your account authentication '
            'with Firebase Authentication. Analytics data (if enabled) is '
            'processed through Firebase Analytics.',
      ],
    ),
    (
      title: 'Data Sharing',
      paragraphs: [
        'We do not sell your personal data. Data is shared only with trusted '
            'service providers (such as Google Firebase) to operate '
            'authentication and analytics as described in this policy.',
      ],
    ),
    (
      title: 'Data Retention',
      paragraphs: [
        'Account information (email) is retained for as long as your account '
            'remains active or as needed to provide authentication. Analytics '
            'data is retained only as long as necessary for performance '
            'analysis and improvement purposes (typically in aggregated form).',
      ],
    ),
    (
      title: 'Data Deletion',
      paragraphs: [
        'You may request deletion of your account by contacting us at: '
            'nummnemonic@proton.me.',
      ],
    ),
    (
      title: 'Children’s Privacy',
      paragraphs: ['This app is not directed to children under the age of 13.'],
    ),
    (
      title: 'Contact',
      paragraphs: [
        'If you have questions about this Privacy Policy, contact us at '
            'nummnemonic@proton.me.',
      ],
    ),
  ];
}
