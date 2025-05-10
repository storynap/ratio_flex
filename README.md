# ratio_flex

A Flutter package that provides `RatioRow` and `RatioColumn` widgets for simplified flex ratio distribution.

## Features

- `RatioRow`: A Row widget that automatically applies flex ratios to its children
- `RatioColumn`: A Column widget that automatically applies flex ratios to its children
- Control the flex behavior with the `flexFit` property
- Optional `flexes` parameter (defaults to 1 for all children if not provided)

## Usage

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

Both `RatioRow` and `RatioColumn` support all standard layout parameters:

- `mainAxisAlignment`
- `crossAxisAlignment`
- `mainAxisSize`
- `textDirection`
- `verticalDirection`
- `textBaseline`

## Requirements

- Flutter: >=2.0.0
- Dart: >=2.17.0

## License

This package is licensed under the MIT License.