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

class ViewController: UIViewController {
    
    override func viewDidLoad() {


        

        
        self.navigationController?.isNavigationBarHidden = true

        
        for case let button as UIButton in self.view.subviews {
            if (button.accessibilityLabel == "menuSelecter") && (Int(button.currentTitle!)! <= topScene)  {
                  button.isEnabled = true
            }
        }
    }
    
    
    
    //По тайтлу кнопки определяем на какой уровень нужен переход и переходим туда
    @IBAction func buttonLevel1(_ sender: AnyObject) {
        
        buttonTitle = sender.currentTitle!!
        thisScene = Int(buttonTitle)!
        print(String(buttonTitle)!)
        self.performSegue(withIdentifier: "GoToGameViewController", sender: self)
        
        
        
    }
}
