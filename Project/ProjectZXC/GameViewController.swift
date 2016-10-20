//
//  GameViewController.swift
//  ProjectZXC
//
//  Created by Женя on 01.05.16.
//  Copyright (c) 2016 Женя. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var viewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ПРОСТ
        if let scene = GameScene(fileNamed:"Test_Level") {
            let skView = SKView(frame: self.view.frame)
            self.view.addSubview(skView)
            scene.viewController = self
            print("то, что нужно: !!!!!!!!!!!!! " + String(describing: self))
            print("!")
            print("!")
            print("!")
            print("!")
            print("!")
            
            print("!")
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .aspectFill
//            viewController = self
            skView.presentScene(scene)
            
        }
        
        //Я ПЫТАЛСЯ ТУТ НАЗНАЧАТЬ ВСЕМ СЦЕНАМ ВОТ ТАК:
//        
//        if let scene = GameScene(fileNamed:"Level 1") {
//            let skView = SKView(frame: self.view.frame)
//            self.view.addSubview(skView)
//            scene.viewController = self
//            skView.showsFPS = true
//            skView.showsNodeCount = true
//            skView.ignoresSiblingOrder = true
//            scene.scaleMode = .aspectFill
//            
//            skView.presentScene(scene)
//            
//        }
        
        //НО ЭТО НЕ РАБОТАЕТ
        //ТЫ ЖЕ МАСтер сцен, разберись, а
    }
    
   
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    
}
