//
//  AppDelegate.swift
//  Delegate
//
//  Created by Владимир Рябов on 17.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var recipeViewController = RecipeViewController()
    var symphtomsInputView = SymphtomsInputView()
    var inViewController = InViewController()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        
        
        //        window?.rootViewController = recipeViewController
        window?.rootViewController = inViewController
        
        inViewController.delegate = self
        return true
    }
    
    
    
    
    
    
}

extension AppDelegate: buttonTappedINVCDelegate {
    func wantToKnowRecept() {
        if inViewController.temperature == "Есть" && inViewController.caugh == "Есть" {
            
            
            
            setRootViewController(recipeViewController, animated: true)
            recipeViewController.labelTemperature.isHidden = false
            recipeViewController.labelCough.isHidden = false
        } else if inViewController.temperature == "Есть" && inViewController.caugh != "Есть" {
            setRootViewController(recipeViewController, animated: true)
            recipeViewController.labelTemperature.isHidden = true
            recipeViewController.labelCough.isHidden = false
        } else if inViewController.temperature != "Есть" && inViewController.caugh == "Есть" {
            
            setRootViewController(recipeViewController, animated: true)
            recipeViewController.labelTemperature.isHidden = false
            recipeViewController.labelCough.isHidden = true
        }
        
    }
    
}


extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
