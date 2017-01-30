//
//  ViewController.swift
//  ProjectZXC
//
//  Created by Даниленко Данила Сергеевич on 28.07.16.
//  Copyright © 2016 Женя. All rights reserved.
//

import UIKit
import SpriteKit
import CoreData
import GoogleMobileAds


class ViewController: UIViewController, UIAlertViewDelegate {
    /// The interstitial ad.
    var interstitial: GADInterstitial!
    override func viewDidLoad() {


        

        
        self.navigationController?.isNavigationBarHidden = true

        
        for case let button as UIButton in self.view.subviews {
            if (button.accessibilityLabel == "menuSelecter") && (Int(button.currentTitle!)! <= topScene)  {
                  button.isEnabled = true
            }
        }
    }
    
    fileprivate func createAndLoadInterstitial() {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-2270286479492772/1486792443")
        let request = GADRequest()
        // Request test ads on devices you specify. Your test device ID is printed to the console when
        // an ad request is made.
        request.testDevices = [ kGADSimulatorID, "2077ef9a63d2b398840261c8221a0c9a" ]
        interstitial.load(request)
    }
    
    
    //По тайтлу кнопки определяем на какой уровень нужен переход и переходим туда
    @IBAction func buttonLevel1(_ sender: AnyObject) {
        print("AD AD AD AD AD AD AD AD")
        createAndLoadInterstitial()
        UIAlertView(title: "Реклама",
                    message: "Сейчас должен быть баннер Admob",
            delegate: self,
            cancelButtonTitle: "Ок").show()

//        buttonTitle = sender.currentTitle!!
//        thisScene = Int(buttonTitle)!
//        print(String(buttonTitle)!)
//        self.performSegue(withIdentifier: "GoToGameViewController", sender: self)
        
        
        
    }
    
    func alertView(_ alertView: UIAlertView, willDismissWithButtonIndex buttonIndex: Int) {
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready :(")
        }
        //playAgainButton.isHidden = false
    }
}
