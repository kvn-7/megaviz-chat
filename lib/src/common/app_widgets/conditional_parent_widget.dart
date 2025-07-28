import 'package:flutter/widgets.dart';

class ConditionalParentWidget extends StatelessWidget {
  const ConditionalParentWidget({
    super.key,
    required this.child,
    required this.condition,
    required this.parentBuilder,
  });

  final Widget child;
  final bool condition;
  final Widget Function(BuildContext context, Widget child) parentBuilder;

  @override
  Widget build(BuildContext context) {
    return condition ? parentBuilder(context, child) : child;
  }
}
