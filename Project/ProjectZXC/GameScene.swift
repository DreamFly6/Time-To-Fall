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
        //addChild(sprite)
        
        return sprite
    }
    
    // Наш "Shape"
    class GameObject {
        var friction = 0
        var restitution = 2.0
        var linDamp = 0
        var angDamp = 0
        var mass = 0
    }

    
    
    class StarNode: SKSpriteNode {
        class func star(location: CGPoint) -> StarNode {
            let sprite = StarNode(imageNamed:"WoodenBox.png")
            
            sprite.xScale = 0.4
            sprite.yScale = 0.4
            sprite.position = location
            
            sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "WoodenBox.png"), size: sprite.size)
            if let physics = sprite.physicsBody {
                physics.affectedByGravity = true
                physics.allowsRotation = true
                physics.dynamic = true;
                physics.friction = 0.1
                physics.mass = 1.0
                physics.restitution = 0.2
                physics.linearDamping = 0.75
                physics.angularDamping = 0.75
            }
            return sprite
        }
    }
    
    
    
    
    //Данила кодер
    func initGameObject(){
        //let woodenBox = GameObject()
        //let woodenBoxx = childNodeWithName("WoodenBox1") as! SKSpriteNode
        let woodenBoxx = childNodeWithName("WoodenBox1")
        //woodenBoxx?.physicsBody?.restitution = woodenBox.restitution
        
        //удаляет все действия?
//        woodenBoxx?.removeAllActions()
//        woodenBoxx?.physicsBody = SKPhysicsBody();
//        woodenBoxx?.removeFromParent()
        woodenBoxx?.physicsBody?.restitution = 1.2    //Сила отскока
        print(woodenBoxx?.physicsBody?.restitution)
        
        let ground = childNodeWithName("Ground")
        ground!.physicsBody?.friction = 0.2   //Трение
        ground!.physicsBody?.restitution = 0.2    //Сила отскока
        ground!.physicsBody?.linearDamping = 0.1  //До сих пор хз что это
        ground!.physicsBody?.angularDamping = 0.1  //До сих пор хз что это
        ground!.physicsBody?.mass = 6.0   //Масса
      
        let stoneBlock = childNodeWithName("StoneBlock")
        
         //Трение
        stoneBlock!.physicsBody?.friction = 0.3
        
         //Сила отскока
        stoneBlock!.physicsBody?.restitution = 0.2
        
        //Используются для расчета имитации силы трения среды при линейном движении.(принимает значения в пределах 0.1 — 1.0). По умолчанию 0.1.
        stoneBlock!.physicsBody?.linearDamping = 0.1
        
        //Используются для расчета имитации силы трения среды при угловом движении. (принимает значения в пределах 0.1 — 1.0). По умолчанию 0.1
        stoneBlock!.physicsBody?.angularDamping = 0.1
        
        //Масса
        stoneBlock!.physicsBody?.mass = 4.0
        
        
        //---- Main ----
        //Friction 0.2
        //Restitution 0.2
        //Lin.Damp 0.2
        //Ang.Damp 0.2
        //Mass 1.0
        print("2")
    }
    
    
    //Функция выполняемая до открытия сцены(Наверное :) )
    override func didMoveToView(view: SKView) {
        print("1")
//        initGameObject()
        print("3")
        let woodenBoxx = childNodeWithName("WoodenBox1")
        woodenBoxx?.removeAllActions()
        woodenBoxx?.physicsBody?.dynamic = false
        
        woodenBoxx?.physicsBody?.restitution = 1.2    //Сила отскока
        print(woodenBoxx?.physicsBody?.restitution)

        

        
        let slimeBlock = childNodeWithName("SlimeBlock")
        slimeBlock!.physicsBody = SKPhysicsBody(rectangleOfSize: slimeBlock!.frame.size)
        slimeBlock!.physicsBody?.friction = 0.3   //Трение
        slimeBlock!.physicsBody?.restitution = 0.2    //Сила отскока
        slimeBlock!.physicsBody?.linearDamping = 0.1  //До сих пор хз что это
        slimeBlock!.physicsBody?.angularDamping = 0.1  //До сих пор хз что это
        slimeBlock!.physicsBody?.mass = 4.0   //Масса

    }
    

    

    //Вызывается когда просиходит нажатие
    //Теперь по нажатию на ребенка происходит его удаление
    //Еще Женя немного наговнокодил и не добавлял в старой версии программы имя новому спрайту, 
    //поэтому не происходило удаление. Добавил ему имя и теперь все ок, но нельзя удалить предка
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        

        
        // Так понял цикл считывающий нажатие на экран
        for touch: AnyObject in touches {
            
            let touchLocation = touch.locationInNode(self)
            let touchedNode = self.nodeAtPoint(touchLocation)
            
            if (touchedNode.name == "WoodenBox1") {
                touchedNode.removeFromParent() //удаление
                print("hit")
            }
            else {
                print("В таче else")
                let sprite = StarNode.star(touch.locationInNode(self))
                sprite.name = "WoodenBox1"
                print (sprite.name);
                self.addChild(sprite)
            }
            
            
//            Если это расскоментить, то по удалениею предка удалятся все дети ¯ \ _ (ツ) _ / ¯
//            if (touchedNode.name == "WoodenBox") {
//                touchedNode.removeFromParent()
//                print("hit")
//            }
            
        }
    }
    
    
    //Удаляет спрайт, когда он улетел за экран
    //Из-за этого не падает ФПС
    override func didSimulatePhysics() {
        let woodenBoxx = childNodeWithName("WoodenBox1")
        if (woodenBoxx?.position.y < 0) {
            [woodenBoxx?.removeFromParent];
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
