//
//  ViewController.swift
//  ConceptOnboarding
//
//  Created by Lovish Dogra on 01/02/17.
//  Copyright © 2017 Lovish Dogra. All rights reserved.
//

import UIKit
import Onboard

class OnboardViewController: UIViewController {
    
        
        
        override func viewDidLoad() {
            
        }
        
     
        
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            // Initialize onboarding view controller
            var onboardingVC = OnboardingViewController()
            
            // Create slides
            let firstPage = OnboardingContentViewController.content(withTitle: "Welcome To The App!", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ut.", image: UIImage(named: "MenuBg1"), buttonText: nil, action: nil)
            
            let secondPage = OnboardingContentViewController.content(withTitle: "Step 1", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ut.", image: UIImage(named: "MenuBg2"), buttonText: nil, action: nil)
            
            let thirdPage = OnboardingContentViewController.content(withTitle: "Step 2:", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ut.", image: UIImage(named: "MenuBg3"), buttonText: nil, action: nil)
            
            firstPage.topPadding = 0
            secondPage.topPadding = 0
            thirdPage.topPadding = 0
            
            onboardingVC = OnboardingViewController(backgroundImage: UIImage(named: "MenuBg1d"), contents: [firstPage, secondPage, thirdPage,])
            onboardingVC.shouldFadeTransitions = true
            onboardingVC.shouldMaskBackground = false
            onboardingVC.shouldBlurBackground = false
            onboardingVC.fadePageControlOnLastPage = true
            onboardingVC.pageControl.pageIndicatorTintColor = UIColor.darkGray
            onboardingVC.pageControl.currentPageIndicatorTintColor = UIColor.white
            onboardingVC.skipButton.setTitleColor(UIColor.black, for: .normal)
            onboardingVC.allowSkipping = true
            onboardingVC.fadeSkipButtonOnLastPage = false
            
            onboardingVC.skipButton.addTarget(self, action: #selector(OnboardViewController.action), for: .allTouchEvents)
            
            self.present(onboardingVC, animated: true, completion: nil)
        }
        
    func action(){
        let mainMenu = MainMenuViewController()
        self.present(mainMenu, animated: true, completion: nil)
    }
}








