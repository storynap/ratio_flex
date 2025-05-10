# ratio_flex

A Flutter package that provides `RatioFlex`, `RatioRow`, and `RatioColumn` widgets for simplified flex ratio distribution.

## Features

- `RatioFlex`: A flexible layout widget similar to Flutter's built-in `Flex` that supports custom flex ratios
- `RatioRow`: A Row widget that automatically applies flex ratios to its children
- `RatioColumn`: A Column widget that automatically applies flex ratios to its children
- Control the flex behavior with the `flexFit` property
- Optional `flexes` parameter (defaults to 1 for all children if not provided)
- Customizable spacing between children

## Usage

### RatioFlex

Similar to Flutter's built-in `Flex` widget, `RatioFlex` can be used as either a row or column by specifying the `direction`:

```dart
// Use as a Row
RatioFlex(
  direction: Axis.horizontal, // Creates a row layout
  children: [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ],
  flexes: [1, 2, 1], // 1:2:1 ratio
  flexFit: FlexFit.tight,
)

// Use as a Column
RatioFlex(
  direction: Axis.vertical, // Creates a column layout
  children: [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ],
  flexes: [2, 1, 2], // 2:1:2 ratio
  flexFit: FlexFit.loose,
)

// With spacing between children
RatioFlex(
  direction: Axis.horizontal,
  children: [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ],
  spacing: 16.0, // Adds 16 pixels of space between each child
)
```

### RatioRow

```dart
// With custom flex ratios
RatioRow(
  children: [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ],
  flexes: [1, 2, 1], // 1:2:1 ratio
  flexFit: FlexFit.tight, // Same as Expanded (default)
)

// With default equal flex (all flex: 1)
RatioRow(
  children: [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ],
  // No flexes provided, all children get flex: 1
)

// With horizontal spacing between children
RatioRow(
  children: [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ],
  spacing: 8.0, // Adds 8 pixels of horizontal space between each child
)
```

### RatioColumn

```dart
// With custom flex ratios
RatioColumn(
  children: [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ],
  flexes: [3, 1, 2], // 3:1:2 ratio
  flexFit: FlexFit.loose, // Same as regular Flexible
)

// With default equal flex (all flex: 1)
RatioColumn(
  children: [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ],
  // No flexes provided, all children get flex: 1
)

// With vertical spacing between children
RatioColumn(
  children: [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ],
  spacing: 12.0, // Adds 12 pixels of vertical space between each child
)
```

## Additional Parameters

All widgets support standard layout parameters:

- `mainAxisAlignment`
- `crossAxisAlignment`
- `mainAxisSize`
- `textDirection`
- `verticalDirection`
- `textBaseline`
- `clipBehavior`
- `spacing` - Controls the space between each child:
  - For `RatioRow`: horizontal spacing (width)
  - For `RatioColumn`: vertical spacing (height)
  - For `RatioFlex`: depends on direction (width for horizontal, height for vertical)

## Requirements

- Flutter: >=2.0.0
- Dart: >=2.17.0

## License

This package is licensed under the MIT License.