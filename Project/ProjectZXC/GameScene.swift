//
//  GameScene.swift
//  ProjectZXC
//
//  Created by Женя on 01.05.16.
//  Copyright (c) 2016 Женя. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {

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
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
