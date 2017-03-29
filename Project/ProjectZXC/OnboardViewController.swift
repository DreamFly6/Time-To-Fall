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
        return 10
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        //imagename, title, description, iconname, color, titleColor, descriptioncolor, titleFont, description font
        
        return [
            ("WoodenBox", "Wooden box","Tap to destroy", "", #colorLiteral(red: 0.9792104363, green: 0.7648834586, blue: 0.5689498782, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), titleFont, descFont),
            ("WoodenPlank", "Wooden plank","Tap to destroy", "", #colorLiteral(red: 0.9143895507, green: 0.7194046378, blue: 0.5365042686, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), titleFont, descFont),
            ("SlimeBlock", "Slime block","Tap to destroy.\n" + "Bounce block.", "", #colorLiteral(red: 0.8521046638, green: 0.6656171083, blue: 0.5020974874, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), titleFont, descFont),
            
            ("StoneBlock", "Stone block","Tap twice to destroy", "", #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleFont, descFont),
            ("GlassBlock", "Glass","Tap to destroy.\n" + "No effect gravity.", "", #colorLiteral(red: 0.5417124033, green: 0.5396859646, blue: 0.5438287854, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleFont, descFont),
            ("SpearBlock", "Spiky block","Kill character", "", #colorLiteral(red: 0.4825677276, green: 0.4807422757, blue: 0.4844744205, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleFont, descFont),
            
            ("ActivaBlock_On", "Gravity block","Tap to stop affect gravity.\n" + "Tap again to start gravity.", "", #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleFont, descFont),
            ("RotationBlock", "Rotation block","Tap to change degree rotation.", "", #colorLiteral(red: 0.2048775256, green: 0.6115691662, blue: 0.8898333907, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleFont, descFont),
            ("Magnit_On", "Magnet","Tap to start magnetize", "", #colorLiteral(red: 0.1692203879, green: 0.5242295861, blue: 0.7758041024, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleFont, descFont),
            ("RandomBlockGreen", "Random block","Tap to spawn random block.", "", #colorLiteral(red: 0.3883877099, green: 0.7459719181, blue: 0.5895844102, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), titleFont, descFont)
            ][index]
    }
    
    //MARK: PaperOnboarding Delegate methods
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        print("1onboardingDidTransitonToIndex " + String(index))
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        //print("1onboardingDidTransitonToIndex" + String(index))
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        //print("2onboardingWillTransitonToIndex" + String(index))
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




















