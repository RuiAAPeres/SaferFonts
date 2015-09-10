# SaferFonts

The goal of SaferFonts is to provide font's names in a safer manner, compared to a more tradional way.

Let's imagine we want to set a `UILabel`'s font:

```swift
myLabel.font = UIFont(name: "ArialMT", size: 14)!
```

This approach is error prone and inherently invites for duplication.

1. We could easily mispell `"ArialMT"`.
2. If we need to use the same font in some other place, we might be tempted to just copy/paste it.

SaferFonts, in this case, just bundles the font in a convinient enum that you can use:

```swift
myLabel.font = UIFont(name: ArialMT.Default.rawValue, size: 14)!
```

As you might have noticed by now, SaferFont is not a 3rd party library that you can just get using Carthage or Cocopods, but an approach and a databasee of fonts that you can freely use.

###ArialMT

```swift
enum ArialMT : String {
    case Default = "ArialMT"
    case Bold = "Arial-BoldMT"
    case Italic = "Arial-ItalicMT"
    case BoldItalic = "Arial-BoldItalicMT"
}
```
