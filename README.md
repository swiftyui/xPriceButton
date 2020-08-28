# Description

A SwiftUI demo on onChange reimplementation for iOS 13/14

## `onChange` Reimplementation

- Compatible with `iOS13`;
- provided with both `previous value` and new value.

```swift
VStack {
    Text("test")
}
.onChange(of: value) { (oldValue, newValue) in
  // value could be @State or normal properties
  // oldValue is optional
}
```
