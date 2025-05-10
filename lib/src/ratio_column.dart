import 'package:flutter/material.dart';
import 'ratio_flex.dart';

/// A widget that creates a Column with children wrapped in Flexible widgets
/// based on the provided flex ratios and flex fit.
///
/// This is a convenience class that extends [RatioFlex] with a vertical direction.
class RatioColumn extends RatioFlex {
  /// Creates a RatioColumn widget.
  ///
  /// If [flexes] is provided, it must have the same length as [children].
  /// If [flexes] is not provided, all children will have a flex value of 1.
  ///
  /// The [flexFit] parameter determines the fit behavior of children:
  /// - [FlexFit.tight] (default): Forces children to fill available space (equivalent to Expanded)
  /// - [FlexFit.loose]: Allows children to use only as much space as they need
  const RatioColumn({
    super.key,
    required super.children,
    super.flexes,
    super.flexFit,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.clipBehavior,
  }) : super(direction: Axis.vertical);
}
