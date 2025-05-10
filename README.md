# ratio_flex

A Flutter package that provides `RatioFlex`, `RatioRow`, and `RatioColumn` widgets for simplified flex ratio distribution.

## Features

- `RatioFlex`: A flexible layout widget similar to Flutter's built-in `Flex` that supports custom flex ratios
- `RatioRow`: A Row widget that automatically applies flex ratios to its children
- `RatioColumn`: A Column widget that automatically applies flex ratios to its children
- Control the flex behavior with the `flexFit` property
- Optional `flexes` parameter (defaults to 1 for all children if not provided)

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

## Requirements

- Flutter: >=2.0.0
- Dart: >=2.17.0

## License

This package is licensed under the MIT License.