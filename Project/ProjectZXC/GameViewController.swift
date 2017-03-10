//
//  GameViewController.swift
//  ProjectZXC
//
//  Created by Даниленко Данила Сергеевич on 02.11.16.
//  Copyright © 2016 Женя. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


//Класс, который принадлежит одноименному ViewController`у
//Он открывает уровень, когда пользователь нажал на кнопку
//Зачем нужен отдельный ViewController? Как я понял, раньше у нас scene (scene.view) создавалась на ViewControllere меню. Теперь для scene сделал отдельный ViewController
//Ты скажешь, что в прошлой версии тоже был GameViewController — да, был, но на нем все действия происходили, если пользователь нажимал кнопку test_level, а не переходил из меню выбора уровня
//Надеюсь, что понятно объяснил

class GameViewController: UIViewController {

    
    override func viewDidLoad() {
        print(buttonTitle)
        
        let sceneView = GameScene(fileNamed: "Level " + buttonTitle)
        let skView = SKView(frame: self.view.frame)
        sceneView?.viewController = self
        self.view.addSubview(skView)
        if showFPS == true {
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
        }
        else {
            skView.showsFPS = false
            skView.showsNodeCount = false
            skView.ignoresSiblingOrder = false
        }

        
//        skView.showsPhysics = true
//        skView.showsDrawCount = true
//        skView.showsFields = true
//        
        sceneView!.scaleMode = .aspectFill
        skView.presentScene(sceneView)
        
    }

    
}
