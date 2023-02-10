//
//  CurrenceTextField.swift
//  window-shopper
//
//  Created by Vadim Kononenko on 09.02.2023.
//

import UIKit

class CurrenceTextField: UITextField {
    
    private lazy var currencyLabel: UILabel = {
        let size: CGFloat = 20
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        
        let currencyLabel = UILabel(frame: CGRect(x: 5, y: (frame.size.height / 2) - size / 2, width: size, height: size))
        currencyLabel.backgroundColor = #colorLiteral(red: 0.6074419618, green: 0.6598467231, blue: 0.7302712798, alpha: 0.8013246044)
        currencyLabel.textAlignment = .center
        currencyLabel.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        currencyLabel.layer.cornerRadius = 5
        currencyLabel.clipsToBounds = true
        currencyLabel.text = formatter.currencySymbol
        
        return currencyLabel
    }()
    
    override func draw(_ rect: CGRect) {
        addSubview(currencyLabel)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CurrenceTextField {
    private func setup() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        layer.cornerRadius = 5
        textAlignment = .center
        clipsToBounds = true
        
        let place = NSAttributedString(string: placeholder ?? " ", attributes: [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        attributedPlaceholder = place
        textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func setupConstraints() {
        
    }
}
