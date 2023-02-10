//
//  ViewController.swift
//  window-shopper
//
//  Created by Vadim Kononenko on 09.02.2023.
//

import UIKit
import SnapKit

class MainVC: UIViewController {
    
    private let bgImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "windowShopperBG")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "windowShopperIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let wageTextField: CurrenceTextField = {
        let textField = CurrenceTextField()
        textField.placeholder = "Your hourly wage"
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let priceTextField: CurrenceTextField = {
        let textField = CurrenceTextField()
        textField.placeholder = "Item price"
        textField.keyboardType = .decimalPad
        textField.enablesReturnKeyAutomatically = true
        return textField
    }()
    
    private lazy var calcButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .orange
        btn.setTitle("Calculate", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        return btn
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "32"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 52, weight: .medium)
        return label
    }()
    
    private let hoursLabel: UILabel = {
        let label = UILabel()
        label.text = "hours"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private lazy var clearCalcButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Clear Calculator", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(clearCalculator), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @objc private func calculate() {
        if let wageText = wageTextField.text, let priceText = priceTextField.text {
            if let wage = Double(wageText), let price = Double(priceText) {
                view.endEditing(true)
                resultLabel.isHidden = false
                hoursLabel.isHidden = false
                resultLabel.text = "\(Wage.getHours(wage: wage, price: price))"
            }
        }
    }
    
    @objc private func clearCalculator() {
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
        wageTextField.text = ""
        priceTextField.text = ""
    }

}

extension MainVC {
    private func setup() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        wageTextField.inputAccessoryView = calcButton
        priceTextField.inputAccessoryView = calcButton
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
        
        view.addSubview(bgImageView)
        view.addSubview(iconImageView)
        view.addSubview(wageTextField)
        view.addSubview(priceTextField)
        view.addSubview(resultLabel)
        view.addSubview(hoursLabel)
        view.addSubview(clearCalcButton)
    }
    
    private func setupConstraints() {
        bgImageView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalToSuperview()
        }
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(35)
            make.width.height.equalTo(60)
            make.centerX.equalToSuperview()
        }
        wageTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
            make.top.equalTo(iconImageView.snp.bottom).offset(35)
        }
        priceTextField.snp.makeConstraints { make in
            make.top.equalTo(wageTextField.snp.bottom).offset(25)
            make.leading.equalTo(wageTextField.snp.leading)
            make.trailing.equalTo(wageTextField.snp.trailing)
            make.height.equalTo(wageTextField.snp.height)
        }
        calcButton.snp.makeConstraints { make in
            make.width.equalTo(view.frame.size.width)
            make.height.equalTo(60)
        }
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(priceTextField.snp.bottom).offset(45)
            make.centerX.equalToSuperview()
        }
        hoursLabel.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        clearCalcButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
            make.height.equalTo(30)
        }
    }
}
