//
//  GameScene.swift
//  ProjectZXC
//
//  Created by Женя on 01.05.16.
//  Copyright (c) 2016 Женя. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    //Функция для добавления нового спрайта в одну строку Автор:Жека
    func addSpriteNodeBy(name: String, position: CGPoint) -> SKSpriteNode{
        let sprite = SKSpriteNode(imageNamed: name)
        sprite.position = position
        sprite.yScale = 3.0
        addChild(sprite)
        
        return sprite
    }
    
    func initGameObject(){
        
        let woodenBox = childNodeWithName("WoodenBox")
        woodenBox!.xScale = 1.0
        woodenBox!.yScale = 1.0
        woodenBox!.physicsBody?.friction = 0.2   //Трение
        woodenBox!.physicsBody?.restitution = 1.2    //Сила отскока
        woodenBox!.physicsBody?.linearDamping = 1.3  //До сих пор хз что это
        woodenBox!.physicsBody?.angularDamping = 1.3  //До сих пор хз что это
        woodenBox!.physicsBody?.mass = 1.0   //Масса
        woodenBox!.physicsBody?.pinned = true
        woodenBox!.physicsBody = SKPhysicsBody(rectangleOfSize: (woodenBox?.frame.size)!)
        
        let ground = childNodeWithName("Ground")
        ground!.physicsBody?.friction = 0.2   //Трение
        ground!.physicsBody?.restitution = 0.2    //Сила отскока
        ground!.physicsBody?.linearDamping = 0.1  //До сих пор хз что это
        ground!.physicsBody?.angularDamping = 0.1  //До сих пор хз что это
        ground!.physicsBody?.mass = 6.0   //Масса
      
        let stoneBlock = childNodeWithName("StoneBlock")
        stoneBlock!.physicsBody?.friction = 0.3   //Трение
        stoneBlock!.physicsBody?.restitution = 0.2    //Сила отскока
        stoneBlock!.physicsBody?.linearDamping = 0.1  //До сих пор хз что это
        stoneBlock!.physicsBody?.angularDamping = 0.1  //До сих пор хз что это
        stoneBlock!.physicsBody?.mass = 4.0   //Масса
        
        
        //---- Main ----
        //Friction 0.2
        //Restitution 0.2
        //Lin.Damp 0.2
        //Ang.Damp 0.2
        //Mass 1.0
    }
    
    
    //Функция выполняемая до открытия сцены(Наверное :) )
    override func didMoveToView(view: SKView) {
        initGameObject()
        
        let slimeBlock = childNodeWithName("SlimeBlock")
        slimeBlock!.physicsBody = SKPhysicsBody(rectangleOfSize: slimeBlock!.frame.size)
        slimeBlock!.physicsBody?.friction = 0.3   //Трение
        slimeBlock!.physicsBody?.restitution = 1.2    //Сила отскока
        slimeBlock!.physicsBody?.linearDamping = 0.1  //До сих пор хз что это
        slimeBlock!.physicsBody?.angularDamping = 0.1  //До сих пор хз что это
        slimeBlock!.physicsBody?.mass = 4.0   //Масса

    }
    

    //Вызывается когда просиходит нажатие
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // Так понял цикл считывающий нажатие на экран
//        for touch in touches {
//            let location = touch.locationInNode(self) //Позиция тача
//        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
