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
    let colorRed = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    let colorGreen = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    let colorWhite = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    let colorButtonBorder = #colorLiteral(red: 0.8959465623, green: 0.9631058574, blue: 1, alpha: 1)
    
    let titleFont = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 44)!
    let descFont = UIFont(name: "AppleSDGothicNeo-Thin", size: 28)!
    
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var onBoardingView: OnboardingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.onBoardingView.dataSource = self
        self.onBoardingView.delegate = self
        
      
        
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
        
        return [("WoodenBox", "Wooden Box","Tap to destroy", "1", #colorLiteral(red: 0.9792104363, green: 0.7648834586, blue: 0.5689498782, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), titleFont, descFont),
                ("StoneBlock", "Stone Block","Tap twice to destroy", "2", #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleFont, descFont),
                ("ActivaBlock_On", "Description","description", "3", #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleFont, descFont)][index]
    }
    
    //MARK: PaperOnboarding Delegate methods
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
    }
    
    //MARK: IBAction
 
    
    @IBAction func tapSkip(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let MainBoard = storyboard.instantiateViewController(withIdentifier: "SwipeViewController")
        self.present(MainBoard, animated: true, completion: nil)
        
        userDef.set(true, forKey: "OnboardStatus")
        userDef.synchronize()
    }
    
}




















