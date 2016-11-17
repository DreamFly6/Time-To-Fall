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

public var thisScene = 1
public var topScene = -1
public var statsАrray: [[Int]] = [[Int]](repeating:[Int](repeating:0, count: 5), count:64)
public var buttonTitle : String = ""


class ViewController: UIViewController {
    
    override func viewDidLoad() {


        
        for i in 0...63 {
            print("============== "+String(i)+" ===============")
            print("Next    - "+String(statsАrray[i][0]))
            print("Retry   - "+String(statsАrray[i][1]))
            print("Lose    - "+String(statsАrray[i][2]))
            print("Destroy - "+String(statsАrray[i][3]))
            print("Time    - "+String(statsАrray[i][4]))
        }
        
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
        print(String(buttonTitle))
        self.performSegue(withIdentifier: "GoToGameViewController", sender: self)
        
        
        
    }
}
