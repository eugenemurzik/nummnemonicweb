/// External links and contact details used across the site.
abstract final class AppLinks {
  static final Uri appStore = Uri.parse(
    'https://apps.apple.com/app/id6757535911',
  );

  static final Uri googlePlay = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.nummnemonic.com',
  );

  static const supportEmail = 'nummnemonic@proton.me';

  static final supportEmailUri = Uri(scheme: 'mailto', path: supportEmail);
}
