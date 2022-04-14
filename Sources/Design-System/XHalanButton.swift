////
////  XHalanButton.swift
////
////
////  Created by Ibrahim Abdul Aziz on 13/04/2022.
////
//
//import Foundation
//import UIKit
//
//
//protocol ButtonTheme {
//    var backgroundColor: UIColor? { get }
//    var textColor: UIColor? { get }
//    var borderColor: UIColor? { get }
//}
//
//protocol ButtonSize {
//    var buttonHeight: CGFloat? { get }
//    var fontSize: CGFloat? { get }
//}
//
//// Concrete Button Theme
//class PrimaryTheme: ButtonTheme {
//    var backgroundColor: UIColor? = .systemBlue
//    var textColor: UIColor? = .white
//    var borderColor: UIColor? = .clear
//}
//
//class SecondryTheme: ButtonTheme {
//    var backgroundColor: UIColor? = .clear
//    var textColor: UIColor? = .blue
//    var borderColor: UIColor? = .clear
//}
//
//class TertiaryTheme: ButtonTheme {
//    var backgroundColor: UIColor? = .clear
//    var textColor: UIColor? = .systemBlue
//    var borderColor: UIColor? = .systemBlue
//}
//
//
//// Concrete Button Size
//class LargeButton: ButtonSize {
//    var buttonHeight: CGFloat? = 50
//    var fontSize: CGFloat? = 20
//}
//
//class MediumButton: ButtonSize {
//    var buttonHeight: CGFloat? = 40
//    var fontSize: CGFloat? = 16
//}
//
//class SmallButton: ButtonSize {
//    var buttonHeight: CGFloat? = 30
//    var fontSize: CGFloat? = 12
//}
//
//
//public enum ThemesEnum {
//    case primary
//    case secondry
//    case tertiary
//}
//
//public enum ButtonSizeEnum {
//    case large
//    case medium
//    case small
//}
//
//// Theme Creator
//class ThemeFactory {
//    class func createTheme(theme: ThemesEnum) -> ButtonTheme {
//        switch theme {
//        case .primary:
//            return PrimaryTheme()
//        case .secondry:
//            return SecondryTheme()
//        case .tertiary:
//            return TertiaryTheme()
//        }
//    }
//}
//
//// Size Creator
//class SizeFactory {
//    class func createButtonSize(size: ButtonSizeEnum) -> ButtonSize {
//        switch size {
//        case .large:
//            return LargeButton()
//        case .medium:
//            return MediumButton()
//        case .small:
//            return SmallButton()
//        }
//    }
//}
//
//
//
//public class XHalanButton: UIButton {
//    var buttonTheme: ButtonTheme?
//    var buttonSize: ButtonSize?
//
//    required public override init(frame: CGRect) {
//        super.init(frame: frame)
//        config()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    public init(theme: ThemesEnum, size: ButtonSizeEnum) {
//        super.init(frame: .zero)
//        buttonTheme = ThemeFactory.createTheme(theme: theme)
//        buttonSize = SizeFactory.createButtonSize(size: size)
//        config()
//    }
//
//
//    private func config() {
//        self.translatesAutoresizingMaskIntoConstraints = false
//        self.layer.cornerRadius = 8
//
//        // Updating Button theme.
//        self.setTitleColor(buttonTheme?.textColor, for: .normal)
//        self.backgroundColor = buttonTheme?.backgroundColor
//
//        // Updating Button size attributes.
//        self.heightAnchor.constraint(equalToConstant: (buttonSize?.buttonHeight)!).isActive = true
//        self.titleLabel?.font.withSize((buttonSize?.fontSize!)!)
//
//        // Updating Button border.
//        self.layer.borderWidth = 1
//        self.layer.borderColor = buttonTheme?.borderColor?.cgColor
//    }
//
//}
//
//
//// Client
//let button = XHalanButton(theme: .primary, size: .medium)
