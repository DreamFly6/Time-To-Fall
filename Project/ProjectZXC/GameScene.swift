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
    
    
    
    //Функция выполняемая до открытия сцены(Наверное :) )
    override func didMoveToView(view: SKView) {

        //Определяет 1 ребенка и задает ему свойства
        //Ребенок с именем WoodenBoB (Они стоят справа)
        let woodenBoB = childNodeWithName("WoodenBoB")
        woodenBoB!.xScale = 2.0
        

        
        //Просто закидываем в переменную спрайт с именем
        //Проблема в том, что без адд смысла нет это делать
        let woodenBox = SKSpriteNode(imageNamed: "WoodenBox")
        woodenBox.xScale = 0.3
        woodenBox.yScale = 0.3
        woodenBox.physicsBody = SKPhysicsBody(rectangleOfSize: woodenBox.frame.size)    //Физ.форма прямоугольник
        woodenBox.physicsBody?.friction = 0.1   //Трение
        woodenBox.physicsBody?.restitution = 1.2    //Сила отскока
        woodenBox.physicsBody?.linearDamping = 0.3  //До сих пор хз что это
        woodenBox.physicsBody?.angularDamping = 0.3  //До сих пор хз что это
        woodenBox.physicsBody?.mass = 1.0   //Масса
        woodenBox.position = CGPoint(x:600,y:1700) //Позиция в поинтах
        
        
        for woodenBox in children {
            print(woodenBox,"\n")
        }
        
        addChild(woodenBox) //Добавляем его на сцену
        //insertChild(woodenBox, atIndex: 1)  // Видимо тоже добавление но с номером

        
        
        
        
        
        //Необходимо сделать, чтобы эти свойства применились для всех одинаковых объектов
    }

    
    

    
    //---- SlimeBlock ----
    //Friction 0.2
    //Restitution 1.0
    //Lin.Damp 0.3
    //Ang.Damp 0.3
    //Mass 2.0

    
    //---- WoodenBox ----
    //Friction 0.2
    //Restitution 0.2
    //Lin.Damp 0.3
    //Ang.Damp 0.3
    //Mass 1.0
    
    //---- Main ----
    //Friction 0.2
    //Restitution 0.2
    //Lin.Damp 0.2
    //Ang.Damp 0.2
    //Mass 1.0
    
    //---- Ground ----
    //Friction 0.2
    //Restitution 0.2
    //Lin.Damp 0.1
    //Ang.Damp 0.1
    //Mass 6.0
    
    //---- StoneBlock ----
    //Friction 0.3
    //Restitution 0.2
    //Lin.Damp 0.1
    //Ang.Damp 0.1
    //Mass 4.0
    
    
    
    //Вызывается когда просиходит нажатие
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        // Так понял цикл считывающий нажатие на экран
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            addChild(sprite)

        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
