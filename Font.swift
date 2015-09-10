//
//  Font.swift
//  SaferFonts
//
//  Created by Renato Rodrigues on 24/08/2015.
//  Copyright © 2015 SaferFonts. All rights reserved.
//

protocol Font {
    func name() -> String
}

extension UIFont {
    convenience init(font: Font, size: CGFloat) {
        self.init(name: font.name(), size: size)!
    }
}
