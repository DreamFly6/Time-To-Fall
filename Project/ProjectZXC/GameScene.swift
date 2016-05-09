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
    
    
    //Ициализация свойств игровых объектов
    func initGameObject(){
        
        //  Инициализация MainCharacter
        let main = self.childNodeWithName("MainCharacter") as? SKSpriteNode
        main!.physicsBody?.friction = 0.2
        main!.physicsBody?.restitution = 0.3
        main!.physicsBody?.linearDamping = 0.2
        main!.physicsBody?.angularDamping = 0.2
        main!.physicsBody?.mass = 2.0
        
        
        //  Инициализация Background
        //let background = self.childNodeWithName("Background") as? SKSpriteNode
        
        
        //  Инициализация SlimeBlock
        for slimeBlock in self.children {
            if slimeBlock.name == "SlimeBlock" {
                if let slimeBlock = slimeBlock as? SKSpriteNode {
                    slimeBlock.physicsBody?.friction = 0.2
                    slimeBlock.physicsBody?.restitution = 1.0
                    slimeBlock.physicsBody?.linearDamping = 0.2
                    slimeBlock.physicsBody?.angularDamping = 0.2
                    slimeBlock.physicsBody?.mass = 2.0
                }
            }
        }
        
        //  Инициализация Ground
        for ground in self.children {
            if ground.name == "Ground" {
                if let ground = ground as? SKSpriteNode {
                    ground.physicsBody?.friction = 0.2
                    ground.physicsBody?.restitution = 0.2
                    ground.physicsBody?.linearDamping = 0.1
                    ground.physicsBody?.angularDamping = 0.1
                    ground.physicsBody?.mass = 6.0
                }
            }
        }
        
        //  Инициализация WoodenBox
        for woodenBox in self.children {
            if woodenBox.name == "WoodenBox" {
                if let woodenBox = woodenBox as? SKSpriteNode {
                    woodenBox.physicsBody?.friction = 0.2
                    woodenBox.physicsBody?.restitution = 0.3
                    woodenBox.physicsBody?.linearDamping = 0.2
                    woodenBox.physicsBody?.angularDamping = 0.2
                    woodenBox.physicsBody?.mass = 1.0
                }
            }
        }

      
        
    }
    
    
    //Функция выполняемая до открытия сцены
    override func didMoveToView(view: SKView) {
        initGameObject()
    }
    

    

    //Вызывается когда просиходит нажатие
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        

        // Цикл считывающий нажатие на экран
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
    override func didSimulatePhysics() {
        let woodenBoxx = childNodeWithName("WoodenBox1")
        if (woodenBoxx?.position.y < 0) {
            [woodenBoxx?.removeFromParent];
        }
    }
   
    
    //Таинственная функция. Про нее ходят легенды, но никто не знает что она делает.
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
