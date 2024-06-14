import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pms_admin/features/navigation/navigation_providers.dart';

class DrawerItem extends ConsumerWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? splashColor;
  final double? minHeight;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? iconSize;

  final IconData iconData;
  final String title;
  final double borderRadius;
  final double padding;
  const DrawerItem({
    super.key,
    this.child,
    this.onPressed,
    required this.iconData,
    required this.title,
    this.iconSize,
    this.splashColor,
    this.minHeight,
    this.borderRadius = 8,
    this.padding = 8,
    this.borderColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActive = ref.watch(selectedPageNameProvider) == title;

    void selectPage() {
      ref.read(selectedPageNameProvider.notifier).setPage(title);
      if (Scaffold.of(context).hasDrawer) {
        Navigator.of(context).pop();
      }
    }

    Color getForegroundColor(bool isActive) {
      return isActive
          ? Theme.of(context).colorScheme.secondary
          // : Colors.grey.shade600;
          : Theme.of(context).colorScheme.onSurfaceVariant;
    }

    Color getBackgroundColor(bool isActive) {
      return isActive
          ? Theme.of(context).colorScheme.primary
          // ? Colors.tealAccent.withOpacity(.2)
          : Colors.transparent;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 5, right: 20),
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        elevation: 0,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: selectPage,
          splashColor: Theme.of(context).colorScheme.tertiary,
          hoverColor: const Color.fromARGB(52, 100, 255, 219),
          hoverDuration: Durations.short4,
          child: Ink(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor ??
                    Theme.of(context).colorScheme.outline, // transparente
                width: 3,
              ),
              color: getBackgroundColor(isActive),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Container(
              constraints: BoxConstraints(
                minHeight: minHeight ?? 0,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 24,
                    child: Icon(
                      iconData,
                      color: getForegroundColor(isActive),
                      size: iconSize,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight:
                            isActive ? FontWeight.w600 : FontWeight.w400,
                        fontSize: 14,
                        color: getForegroundColor(isActive),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
