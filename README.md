# NumMnemonic web

Landing page and privacy policy for the NumMnemonic app, built with Flutter
Web and hosted on Firebase Hosting.

## Development

The Flutter version is pinned in `.fvmrc` and CI reads it from there.

```sh
fvm install
fvm flutter pub get
fvm flutter run -d chrome
```

Checks run by CI:

```sh
fvm flutter analyze
fvm flutter test
fvm flutter build web --release --wasm
```

## Structure

```
lib/
├── main.dart            # entry point: URL strategy, web semantics
├── app.dart             # MaterialApp.router + theme
├── config/              # store links, support email
├── routing/router.dart  # go_router routes: /, /privacy, 404
└── ui/
    ├── core/
    │   ├── layout/      # WindowSize breakpoints, MaxWidthSection, ResponsiveGrid
    │   ├── theme/       # colors and Material 3 theme
    │   └── widgets/     # SitePage shell, footer, store badges, links
    └── features/
        ├── home/        # landing page, one widget per section
        ├── privacy/     # privacy policy text and page
        └── not_found/
```

Layout decisions use Material 3 window size classes (compact < 600,
medium < 840, expanded ≥ 840). Tests in `test/` render every page at all three
sizes and fail on layout overflow.

## Deployment

GitHub Actions (`.github/workflows/firebase-hosting-pull-request.yml`):

- Pull requests to `main` deploy to a Firebase preview channel that expires
  after 7 days.
- Pushes to `main` deploy to the live site.
