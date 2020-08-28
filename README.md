# Description

This is one of my own challenges: every project is limited to be done within `24 hours`

A SwiftUI demo on `onChange` reimplementation for iOS 13/14

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
