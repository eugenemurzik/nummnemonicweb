import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import '../../../../core/layout/max_width_section.dart';
import '../../../../core/widgets/section_heading.dart';

const _screenshots = [
  (
    asset: 'assets/images/screenshot_associations.webp',
    label: 'Turn digits into associations: numbers listed with a word for each',
  ),
  (
    asset: 'assets/images/screenshot_custom_system.webp',
    label: 'Build your own memory system: edit the word for each number',
  ),
  (
    asset: 'assets/images/screenshot_pin_breakdown.webp',
    label: 'Never forget PINs again: a number broken down into memorable words',
  ),
];

/// Width / height of the source screenshots (1284 × 2778).
const _aspectRatio = 1284 / 2778;
const _gap = 32.0;
const _maxItemWidth = 260.0;
const _minItemWidthInRow = 180.0;

class ScreenshotsSection extends StatelessWidget {
  const ScreenshotsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaxWidthSection(
      child: Column(
        spacing: 40,
        children: [
          const SectionHeading('See It In Action'),
          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final count = _screenshots.length;
              final fitsInRow =
                  width >= count * _minItemWidthInRow + (count - 1) * _gap;

              if (fitsInRow) {
                final itemWidth = math.min(
                  _maxItemWidth,
                  (width - (count - 1) * _gap) / count,
                );
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: _gap,
                  children: [
                    for (final shot in _screenshots)
                      _Screenshot(
                        asset: shot.asset,
                        label: shot.label,
                        width: itemWidth,
                      ),
                  ],
                );
              }

              // Too narrow for a row: swipeable carousel that peeks the next
              // screenshot so it is obvious there is more.
              final itemWidth = math.min(_maxItemWidth, width * 0.72);
              return SizedBox(
                height: itemWidth / _aspectRatio,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: count,
                  separatorBuilder: (_, _) => const SizedBox(width: 16),
                  itemBuilder: (context, index) => _Screenshot(
                    asset: _screenshots[index].asset,
                    label: _screenshots[index].label,
                    width: itemWidth,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Screenshot extends StatelessWidget {
  const _Screenshot({
    required this.asset,
    required this.label,
    required this.width,
  });

  final String asset;
  final String label;
  final double width;

  @override
  Widget build(BuildContext context) {
    final pixelRatio = MediaQuery.devicePixelRatioOf(context);

    return Container(
      width: width,
      height: width / _aspectRatio,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        asset,
        fit: BoxFit.cover,
        semanticLabel: label,
        // Decode at display size instead of the full source resolution.
        cacheWidth: (width * pixelRatio).round(),
      ),
    );
  }
}
