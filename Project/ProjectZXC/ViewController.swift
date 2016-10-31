//
//  ViewController.swift
//  ProjectZXC
//
//  Created by Даниленко Данила Сергеевич on 28.07.16.
//  Copyright © 2016 Женя. All rights reserved.
//

import UIKit
import SpriteKit

public var thisScene = 1
public var topScene = 20

class ViewController: UIViewController {

    //это объявление нужно, чтобы сделать их кликабельными/не кликабельными

    
   
    
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
        let buttonTitle : String = sender.currentTitle!!
        var sceneView = GameScene(fileNamed:"Test_Level")
        thisScene = Int(buttonTitle)!
        print(sender.currentTitle, " <---- Эта сцена")
//        sceneView?.viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as UIViewController
        print("ViewController при нажатии на кнопку " + String(describing: sceneView?.viewController))
        sceneView = GameScene(fileNamed: "Level "+buttonTitle)
        
        let skView = SKView(frame: self.view.frame)
        self.view.addSubview(skView)
        
        //ПОКА ПИСАЛ ВСЕ КОММЕНТАРИИ, ЗАБЫЛ, ЧТО НЕ ДОБАВИЛ СТРОЧКУ НИЖЕ ЗДЕСЬ
        //НО ЕЕ ДОБАВЛЕНИЕ НЕ ПОМОГЛО
//        sceneView?.viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as UIViewController
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        sceneView!.scaleMode = .aspectFill
        skView.presentScene(sceneView)
    }
}
