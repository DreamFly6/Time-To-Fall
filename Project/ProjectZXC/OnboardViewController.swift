//
//  ViewController.swift
//  ConceptOnboarding
//
//  Created by Lovish Dogra on 01/02/17.
//  Copyright © 2017 Lovish Dogra. All rights reserved.
//

import UIKit
import paper_onboarding

class OnboardViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {
    
    //MARK: Declaration & IBOutlets
    let userDef = UserDefaults.standard
    let colorRed = UIColor(red:217.0/255.0, green:72.0/255.0, blue:89.0/255.0, alpha:1.0)
    let colorGreen = UIColor(red:0.28, green:0.90, blue:0.74, alpha:1.0)
    let colorWhite = UIColor(red:168.0/255.0, green:200.0/255.0, blue:78.0/255.0, alpha:1.0)
    let colorButtonBorder = UIColor(red:0.98, green:0.05, blue:0.32, alpha:1.0)
    
    let titleFont = UIFont(name: "GillSans-SemiBoldItalic", size: 24)!
    let descFont = UIFont(name: "GillSans-Italic", size: 18)!
    
    @IBOutlet weak var btnGetStarted: UIButton!

    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var onBoardingView: OnboardingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.onBoardingView.dataSource = self
        self.onBoardingView.delegate = self
        
        self.btnGetStarted.alpha = 0
        self.btnGetStarted.backgroundColor = UIColor.white
        self.btnGetStarted.setTitleColor(colorButtonBorder, for: .normal)
        self.btnGetStarted.layer.cornerRadius = self.btnGetStarted.frame.height/2
        self.btnGetStarted.layer.borderColor = colorButtonBorder.cgColor
        self.btnGetStarted.layer.borderWidth = 0.5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: PaperOnboarding Datasource methods
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        //imagename, title, description, iconname, color, titleColor, descriptioncolor, titleFont, description font
        
        return [("Rocket", "Я","Наша игра самая пиздатая", "", colorRed, UIColor.white, UIColor.white, titleFont, descFont),
                ("Todo", "Шерстяной","Тут типо пиздатое обучение", "", colorGreen, UIColor.white, UIColor.white, titleFont, descFont),
                ("Fingerprint", "Волчара","Продолжение пиздатого обучения", "", colorWhite, UIColor.white, UIColor.white, titleFont, descFont)][index]
    }
    
    //MARK: PaperOnboarding Delegate methods
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            UIView.animate(withDuration: 0.4, animations: {
                self.btnSkip.alpha = 0
                self.btnGetStarted.alpha = 1
            })
        }
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index < 2 {
            if self.btnGetStarted.alpha == 1 {
                UIView.animate(withDuration: 0.4, animations: {
                    self.btnGetStarted.alpha = 0
                    self.btnSkip.alpha = 1
                })
            }
        }
    }
    
    //MARK: IBAction
    @IBAction func tapGetStarted(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let MainBoard = storyboard.instantiateViewController(withIdentifier: "ViewControllerLolka")
        self.present(MainBoard, animated: true, completion: nil)
        
        userDef.set(true, forKey: "OnboardStatus")
        userDef.synchronize()
    }
    
    @IBAction func tapSkip(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let MainBoard = storyboard.instantiateViewController(withIdentifier: "ViewControllerLolka")
        self.present(MainBoard, animated: true, completion: nil)
        
        userDef.set(true, forKey: "OnboardStatus")
        userDef.synchronize()
    }
    
}




















