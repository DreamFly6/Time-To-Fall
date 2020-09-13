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



class ViewController: UIViewController, UIAlertViewDelegate {

    override func viewDidLoad() {
        
        navigationController?.isNavigationBarHidden = true
        
        for case let button as UIButton in self.view.subviews {
            if (button.accessibilityLabel == "menuSelecter") && (Int(button.currentTitle!)! <= topScene)  {
                button.isEnabled = true
                
                let medalImageView = UIImageView()
                
                switch MedalOnLvl[Int(button.currentTitle ?? "0") ?? 0] {
                case 0: medalImageView.image = UIImage(named: "GoldMedal.png")
                case 1: medalImageView.image = UIImage(named: "SilverMedal.png")
                case 2: medalImageView.image = UIImage(named: "BronzeMedal.png")
                case 3: medalImageView.image = UIImage(named: "WithOutMedal.png")
                default: medalImageView.image = UIImage(named: "StoneBlock.png")
                }
                
                let medalOrigin = CGPoint(x: button.bounds.origin.x + 45, y: button.bounds.origin.y + 45)
                let medalSize = CGSize(width: 31, height: 40)
                medalImageView.frame = CGRect(origin: medalOrigin, size: medalSize)
                button.addSubview(medalImageView)
            }
        }
    }
    
    
    //По тайтлу кнопки определяем на какой уровень нужен переход и переходим туда
    @IBAction func buttonLevel1(_ sender: AnyObject) {
        buttonTitle = sender.currentTitle!!
        thisScene = Int(buttonTitle)!
        print(String(buttonTitle))
        print("GO")
        self.performSegue(withIdentifier: "GoToGameViewController", sender: self)
        
    }
}
