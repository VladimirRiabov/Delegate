//
//  FirstView.swift
//  Delegate
//
//  Created by Владимир Рябов on 17.02.2022.
//

import UIKit


protocol buttonTappedINVCDelegate: AnyObject {
    func wantToKnowRecept()
    
}

class InViewController: UIViewController {
    
    let symphtomsInputView  = SymphtomsInputView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    weak var delegate: buttonTappedINVCDelegate?

    var temperature: String? {
        return symphtomsInputView.temperature.text
    }
    
    var caugh: String? {
        return symphtomsInputView.caugh.text
    }
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }


}

extension InViewController {
    private func style() {
        //makes controls ready to autolayout by code
        symphtomsInputView.translatesAutoresizingMaskIntoConstraints  = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 //interval between text and image
        signInButton.setTitle("Узнать рецепт", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        
        errorMessageLabel.isHidden = false
        
        
    }
    
    private func layout() {
        view.addSubview(symphtomsInputView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        
        //.activate make all the constraintses sets isActive to true
        //LoginView
        NSLayoutConstraint.activate([
            //center
            symphtomsInputView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //leading board
            //system standart spacing is equal to 8. multiplier tells us how much multiply this space 1x8
            symphtomsInputView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            //trailing anchor we put another way. We take the loginView trailing anchor and add to it standart space
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: symphtomsInputView.trailingAnchor, multiplier: 1)
            
        ])
        
        //Sign In Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: symphtomsInputView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: symphtomsInputView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: symphtomsInputView.trailingAnchor)
        ])
        
        //Error label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: symphtomsInputView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: symphtomsInputView.trailingAnchor)
        ])
        
    }
}

extension InViewController {
    @objc func signInTapped(sender: UIButton) {
//        errorMessageLabel.isHidden = true
//        login()
        delegate?.wantToKnowRecept()
        print("sdfsdfsdfsdfsdfsdfsdfdsf")
    }
    
    private func buttonTapped() {
        
        
        guard let username = temperature, let password = caugh else {
            assertionFailure("Симптомы не должны быть пустыми")
            return
        }

    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
