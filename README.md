# Why "Safer"?

Let's imagine we want to set a `UILabel`'s font:

```swift
myLabel.font = UIFont(name: "ArialMT", size: 14)!
```

This approach is error prone and inherently invites for duplication.

1. We could easily misspell `"ArialMT"` and  crash the app. Since `UIFont`'s `name:size:` returns an optional (and in this particular case it doesn't make sense to use optional binding) for pragmatic reasons we would just force unwrapp it. 
2. If we need to use the same font in some other place, we might be tempted to just copy/paste it.

SaferFonts, in this case, just bundles the font in a convenient `enum`:

```swift
myLabel.font = UIFont(name: ArialMT.Default.rawValue, size: 14)!
```

As you might have noticed by now, SaferFont is not a 3rd party library that you can just get using Carthage or Cocopods. It would be a significant burden to use a library with dozens of fonts, when you just need one or two. So instead, this can be viewed as an approach and a database of fonts that you can use. 

###The Font Protocol

The [Font protocol](https://github.com/RuiAAPeres/SaferFonts/blob/master/Font.swift) (suggested by [renatorodrigues](https://github.com/renatorodrigues)), can also be used to make this enum easier to consume. For example with `ArialMT` :

```swift
let arialFont = UIFont(font: HelveticaNeue.Bold, size: 15)
```

In order to make the enum compliant with it:

```swift
private enum ArialMT : String, Font {
    case Regular = "ArialMT"
    case Bold = "Arial-BoldMT"
    case Italic = "Arial-ItalicMT"
    case BoldItalic = "Arial-BoldItalicMT"
    
    func name() -> String {
        return self.rawValue
    }
}
```

###ArialMT

```swift
enum ArialMT : String {
    case Regular = "ArialMT"
    case Bold = "Arial-BoldMT"
    case Italic = "Arial-ItalicMT"
    case BoldItalic = "Arial-BoldItalicMT"
}
```
### HelveticaNeue

```swift
enum HelveticaNeue : String {
    case Regular = "HelveticaNeue"
    case Italic = "HelveticaNeue-Italic"
    case Bold = "HelveticaNeue-Bold"
    case BoldItalic = "HelveticaNeue-BoldItalic"
    case Medium = "HelveticaNeue-Medium"
    case MediumItalic = "HelveticaNeue-MediumItalic"
    case Light = "HelveticaNeue-Light"
    case LightItalic = "HelveticaNeue-LightItalic"
    case UltraLight = "HelveticaNeue-UltraLight"
    case UltraLightItalic = "HelveticaNeue-UltraLightItalic"
    case Thin = "HelveticaNeue-Thin"
    case ThinItalic = "HelveticaNeue-ThinItalic"
    case CondensedBlack = "HelveticaNeue-CondensedBlack"
    case CondensedBold = "HelveticaNeue-CondensedBold"
}
```
