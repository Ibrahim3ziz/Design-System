import Foundation
import UIKit


public class HalanButton: UIButton {
    
    private var type: Type = .primary
    private var buttonSize: ButtonSize = .large
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public init(buttonType: Type, buttonSize: ButtonSize, title: String) {
        super.init(frame: .zero)
        self.buttonSize = buttonSize
        self.type = buttonType
        self.setTitle(title, for: .normal)
        configure()
    }

    
    private func configure() {
        switch type {
        case .primary:
            backgroundColor = .systemBlue
            setTitleColor(UIColor.white, for: .normal)
        case .secondary:
            backgroundColor = .white
            setTitleColor(UIColor.systemBlue, for: .normal)
        case .tertiary:
            backgroundColor = .clear
            setTitleColor(UIColor.systemBlue, for: .normal)

            layer.borderColor = UIColor.systemBlue.cgColor
            layer.borderWidth = 0.8
        }

        switch buttonSize {
        case .large:
            titleLabel?.font.withSize(20)
            heightAnchor.constraint(equalToConstant: 50).isActive = true

        case .medium:
            titleLabel?.font.withSize(16)
            heightAnchor.constraint(equalToConstant: 40).isActive = true

        case .small:
            titleLabel?.font.withSize(12)
            heightAnchor.constraint(equalToConstant: 30).isActive = true

        }
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        
    }    
    
}


public enum Type {
    case primary
    case secondary
    case tertiary
}

public enum ButtonSize {
    case large
    case medium
    case small
}

