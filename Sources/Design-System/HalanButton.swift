//
//  HalanButton.swift
//
//
//  Created by Ibrahim Abdul Aziz on 14/04/2022.
//

import Foundation
import UIKit

// Theme Provider Strategy.
public protocol ThemeProvider {
    var backgroundColor: UIColor? {get}
    var textColor: UIColor? {get}
    var borderColor: UIColor? {get}
}

// Size Provider Strategy.
public protocol SizeProvider {
    var buttonHeight: CGFloat? { get }
    var fontSize: CGFloat? { get }
}


// Concrete Strategy for Primary Theme.
public class PrimaryTheme: ThemeProvider {
    public init () {}
    public var backgroundColor: UIColor? = .systemBlue
    public var textColor: UIColor? = .white
    public var borderColor: UIColor? = .clear
}

// Concrete Strategy for Secondary Theme.
public class SecondaryTheme: ThemeProvider {
    public init () {}
    public var backgroundColor: UIColor? = .clear
    public var textColor: UIColor? = .systemBlue
    public var borderColor: UIColor? = .clear
}

// Concrete Strategy for Tertiary Theme.
public class TertiaryTheme: ThemeProvider {
    public init () {}
    public var backgroundColor: UIColor? = .clear
    public var textColor: UIColor? = .systemBlue
    public var borderColor: UIColor? = .systemBlue
}

// Concrete Strategy for Large Size.
public class LargeSize: SizeProvider {
    public init () {}
    public var buttonHeight: CGFloat? = 50
    public var fontSize: CGFloat? = 20
}

// Concrete Strategy for Medium Size.
public class MediumSize: SizeProvider {
    public init () {}
    public var buttonHeight: CGFloat? = 40
    public var fontSize: CGFloat? = 16
}

// Concrete Strategy for Small Size.
public class SmallSize: SizeProvider {
    public init () {}
    public var buttonHeight: CGFloat? = 30
    public var fontSize: CGFloat? = 12
}


// Context.
public class HalanButton: UIButton {
    var themeProvider: ThemeProvider?
    var sizeProvider: SizeProvider?
    
    required public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(theme: ThemeProvider, size: SizeProvider) {
        super.init(frame: .zero)
    
        self.themeProvider = theme
        self.sizeProvider = size
        
        // Theme attributes.
        self.backgroundColor = theme.backgroundColor
        self.setTitleColor(theme.textColor, for: .normal)
                
        // Size attributes.
        self.heightAnchor.constraint(equalToConstant: (size.buttonHeight)!).isActive = true
        self.titleLabel?.font.withSize((size.fontSize)!)
        
        // Border attributes.
        self.layer.borderColor = theme.borderColor?.cgColor
        self.layer.borderWidth = 1
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 8
    }

}


// Client.
let XButton = HalanButton(theme: SecondaryTheme(), size: LargeSize())
