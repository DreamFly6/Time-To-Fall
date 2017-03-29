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


        self.navigationController?.isNavigationBarHidden = true
        
        var bgImage: UIImageView?
        
        for case let button as UIButton in self.view.subviews {
            if (button.accessibilityLabel == "menuSelecter") && (Int(button.currentTitle!)! <= topScene)  {
                button.isEnabled = true
                //print("----> " + String(MedalOnLvl[Int(button.currentTitle!)!]))
                
                    switch MedalOnLvl[Int(button.currentTitle!)!] {
                    case 0:
                        bgImage = UIImageView(image: UIImage(named: "GoldMedal.png")!)
                        break
                    case 1:
                        bgImage = UIImageView(image: UIImage(named: "SilverMedal.png")!)
                        break
                    case 2:
                        bgImage = UIImageView(image: UIImage(named: "BronzeMedal.png")!)
                        break
                    case 3:
                        bgImage = UIImageView(image: UIImage(named: "WithOutMedal.png")!)
                        break
                    default:
                        bgImage = UIImageView(image: UIImage(named: "StoneBlock.png")!)
                        break
                    }


                bgImage!.frame = CGRect(origin: CGPoint(x: button.frame.maxX - 25,
                                                        y :button.frame.maxY - 25),
                                        size: CGSize(width: 31,
                                                     height: 40))
                self.view.addSubview(bgImage!)
                
                
            }
        }
    }
    
    
    //По тайтлу кнопки определяем на какой уровень нужен переход и переходим туда
    @IBAction func buttonLevel1(_ sender: AnyObject) {
        
        buttonTitle = sender.currentTitle!!
        thisScene = Int(buttonTitle)!
        print(String(buttonTitle)!)
        print("GO")
        self.performSegue(withIdentifier: "GoToGameViewController", sender: self)
        
    }
    

}
