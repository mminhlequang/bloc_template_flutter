import 'package:_iwu_pack/_iwu_pack.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WidgetDialogContainer extends StatelessWidget {
  final Widget child;
  final String? heroTag;
  const WidgetDialogContainer({super.key, required this.child, this.heroTag});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Material(
        color: Colors.black26,
        child: Center(
          child: Hero(
            tag: heroTag ?? 'WidgetFormCreateSubjects',
            child: Material(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(24),
                  padding: const EdgeInsets.all(32),
                  width: 680,
                  decoration: BoxDecoration(
                      color: appColorBackground,
                      borderRadius: BorderRadius.circular(26)),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
