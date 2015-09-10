protocol Font {
    func name() -> String
}

extension UIFont {
    convenience init(font: Font, size: CGFloat) {
        self.init(name: font.name(), size: size)!
    }
}
