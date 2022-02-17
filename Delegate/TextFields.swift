//
//  TextFields.swift
//  Delegate
//
//  Created by Владимир Рябов on 17.02.2022.
//


import Foundation
import UIKit



class SymphtomsInputView: UIView {
    
    let stackView = UIStackView()
    let temperature = UITextField()
    let caugh = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension SymphtomsInputView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        
        temperature.translatesAutoresizingMaskIntoConstraints = false
        temperature.placeholder = "температура больше 37.0 - есть/нет"
        temperature.delegate = self
        
        caugh.translatesAutoresizingMaskIntoConstraints = false
        caugh.placeholder = "кашель - есть/нет"
        caugh.isSecureTextEntry = false
        caugh.delegate = self
        
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        
        //round a corner
        layer.cornerRadius = 5
        clipsToBounds = true
        
        
    }
    
    func layout() {
        
        stackView.addArrangedSubview(temperature)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(caugh)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

extension SymphtomsInputView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        temperature.endEditing(true)
        caugh.endEditing(true)
        return true
    }
    
    //what is actually in that text field
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
