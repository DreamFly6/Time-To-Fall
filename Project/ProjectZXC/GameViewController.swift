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

    override func viewDidLoad() {
        super.viewDidLoad()
        //ПРОСТ
        if let scene = GameScene(fileNamed:"Test_Level") {
            
            let skView = SKView(frame: self.view.frame)
            self.view.addSubview(skView)
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .aspectFill
            skView.presentScene(scene)
            
        }
        
//        if let SecondScene = GameScene(fileNamed:"SecondScene") {
//            // Configure the view.
//            let skView = self.view as! SKView
//            skView.showsFPS = true
//            skView.showsNodeCount = true
//            
//            /* Sprite Kit applies additional optimizations to improve rendering performance */
//            skView.ignoresSiblingOrder = true
//            
//            /* Set the scale mode to scale to fit the window */
//            SecondScene.scaleMode = .AspectFill
//            
//            skView.presentScene(SecondScene)
//            skView.showsPhysics = true
//            
//        }
    }

    override var shouldAutorotate : Bool {
        return true
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
