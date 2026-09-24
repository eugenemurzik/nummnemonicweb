/// External links and contact details used across the site.
abstract final class AppLinks {
  static final appStore = Uri.parse(
    'https://apps.apple.com/us/app/nummnemonic-remember-numbers/id6757535911',
  );

  static final googlePlay = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.nummnemonic.com',
  );

  static const supportEmail = 'nummnemonic@proton.me';

  static final supportEmailUri = Uri(scheme: 'mailto', path: supportEmail);
}
