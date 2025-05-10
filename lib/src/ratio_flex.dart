import 'package:flutter/material.dart';

/// A widget that creates a flex layout (row or column) with children wrapped in Flexible widgets
/// based on provided flex ratios, similar to Flutter's built-in [Flex] widget.
///
/// This class handles the common logic of wrapping children with [Flexible] widgets
/// based on provided flex ratios and can be used as either a row or column based on the
/// [direction] parameter.
class RatioFlex extends StatelessWidget {
  /// The direction to use for the main axis.
  /// If [Axis.horizontal], the children are arranged in a row.
  /// If [Axis.vertical], the children are arranged in a column.
  final Axis direction;

  /// List of child widgets to be displayed
  final List<Widget> children;

  /// List of flex values corresponding to each child
  /// If not provided, all children will have a flex value of 1
  final List<int>? flexes;

  /// The flex fit to use for all children (tight is equivalent to Expanded, loose is regular Flexible)
  final FlexFit flexFit;

  /// Optional layout properties
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final Clip clipBehavior;

  /// Creates a RatioFlex widget.
  ///
  /// If [flexes] is provided, it must have the same length as [children].
  /// If [flexes] is not provided, all children will have a flex value of 1.
  ///
  /// The [direction] parameter determines whether this is a row or column:
  /// - [Axis.horizontal]: Arranges children in a row (left to right).
  /// - [Axis.vertical]: Arranges children in a column (top to bottom).
  ///
  /// The [flexFit] parameter determines the fit behavior of children:
  /// - [FlexFit.tight] (default): Forces children to fill available space (equivalent to Expanded)
  /// - [FlexFit.loose]: Allows children to use only as much space as they need
  const RatioFlex({
    Key? key,
    required this.direction,
    required this.children,
    this.flexes,
    this.flexFit = FlexFit.tight,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
  })  : assert(flexes == null || children.length == flexes.length,
            'If flexes is provided, it must have the same length as children'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      children: _buildFlexibleChildren(),
    );
  }

  /// Builds a list of children wrapped with [Flexible] widgets based on flex values.
  List<Widget> _buildFlexibleChildren() {
    final effectiveFlexes = flexes ?? List<int>.filled(children.length, 1);

    return List<Widget>.generate(
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
  }
}
