//
//  PatientViewController.swift
//  Delegate
//
//  Created by Владимир Рябов on 17.02.2022.
//

import UIKit


class RecipeViewController: UIViewController {
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let labelTemperature = UILabel()
    let labelCough = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension RecipeViewController {
    func style() {
        view.backgroundColor = .systemBackground // ! dont forget
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        // Image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "delorean")
        
        // Label
        
        labelTemperature.translatesAutoresizingMaskIntoConstraints = false
        labelTemperature.textAlignment = .center
        labelTemperature.font = UIFont.preferredFont(forTextStyle: .title3)
        labelTemperature.adjustsFontForContentSizeCategory = true
        labelTemperature.numberOfLines = 0
        labelTemperature.isHidden = true
        labelTemperature.text = "Таблетка от кашля - Сфивтин"
        
        labelCough.translatesAutoresizingMaskIntoConstraints = false
        labelCough.isHidden = true
        labelCough.textAlignment = .center
        labelCough.font = UIFont.preferredFont(forTextStyle: .title3)
        labelCough.adjustsFontForContentSizeCategory = true
        labelCough.numberOfLines = 0
        labelCough.text = "Таблетка от температуры - Нетемпературин"
        
        
    }
    
    func layout() {
        
        stackView.addArrangedSubview(labelTemperature)
        stackView.addArrangedSubview(labelCough)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}

