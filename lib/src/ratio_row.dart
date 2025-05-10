import 'package:flutter/material.dart';

/// A widget that creates a Row with children wrapped in Flexible widgets
/// based on the provided flex ratios and flex fit.
class RatioRow extends StatelessWidget {
  /// List of child widgets to be displayed in the row
  final List<Widget> children;

  /// List of flex values corresponding to each child
  /// If not provided, all children will have a flex value of 1
  final List<int>? flexes;

  /// The flex fit to use for all children (tight is equivalent to Expanded, loose is regular Flexible)
  final FlexFit flexFit;

  /// Optional row properties
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;

  /// Creates a RatioRow widget.
  ///
  /// If [flexes] is provided, it must have the same length as [children].
  /// If [flexes] is not provided, all children will have a flex value of 1.
  ///
  /// The [flexFit] parameter determines the fit behavior of children:
  /// - [FlexFit.tight] (default): Forces children to fill available space (equivalent to Expanded)
  /// - [FlexFit.loose]: Allows children to use only as much space as they need
  const RatioRow({
    Key? key,
    required this.children,
    this.flexes,
    this.flexFit = FlexFit.tight,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
  })  : assert(flexes == null || children.length == flexes.length,
            'If flexes is provided, it must have the same length as children'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final effectiveFlexes = flexes ?? List<int>.filled(children.length, 1);

    final wrappedChildren = List<Widget>.generate(
      children.length,
      (index) {
        final child = children[index];
        final flex = effectiveFlexes[index];

        return Flexible(
          flex: flex,
          fit: flexFit,
          child: child,
        );
      },
    );

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: wrappedChildren,
    );
  }
}
