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
        
        
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        //ПРОСТ
//        if let scene = GameScene(fileNamed:"Test_Level") {
//            let skView = SKView(frame: self.view.frame)
//            self.view.addSubview(skView)
//            scene.viewController = self
//            print("ViewController в viewDidLoad " + String(describing: self) )
//            skView.showsFPS = true
//            skView.showsNodeCount = true
//            skView.ignoresSiblingOrder = true
//            scene.scaleMode = .aspectFill
//            viewController = self
//            skView.presentScene(scene)
//            
//        }
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
