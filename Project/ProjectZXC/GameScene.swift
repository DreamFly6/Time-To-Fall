// Ver 0.0000000001

import SpriteKit



class GameScene: SKScene, SKPhysicsContactDelegate {
    

    
    //    Добавление блока
    
    //    class StarNode: SKSpriteNode {
    //        class func star(location: CGPoint) -> StarNode {
    //            let sprite = StarNode(imageNamed:"WoodenBox.png")
    //
    //            sprite.xScale = 0.4
    //            sprite.yScale = 0.4
    //            sprite.position = location
    //
    //            sprite.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "WoodenBox.png"), size: sprite.size)
    //            if let physics = sprite.physicsBody {
    //               physics.affectedByGravity = true
    //                physics.allowsRotation = true
    //                physics.dynamic = true;
    //                physics.friction = 0.1
    //                physics.mass = 1.0
    //                physics.restitution = 0.2
    //                physics.linearDamping = 0.75
    //                physics.angularDamping = 0.75
    //            }
    //            return sprite
    //        }
    //   }
    
    
    //TODO блоки    (Извиняюсь за ошибки)
    //  - Деревяный блок (Разрушается по тапу на него)
    //  - Деревяная балка (Разрушается по тапу на него)
    //  - Деревянные весы (Разрушается по тапу на него, крутится вокруг середины)
    
    //  - Каменный блок (Разрушается по двойному тапу на него,тяжелее деревяного)
    //  - Каменная балка (Разрушается по двойному тапу на него,тяжелее деревяного)
    //  - Каменные весы (Разрушается по двойному тапу на него,тяжелее деревяного, крутится вокруг середины)
    
    //  - Железный блок (Не разрушается,тяжелее каменного)
    //  - Железная балка (Не разрушается,тяжелее каменного)
    //  - Железные весы (Не разрушается,тяжелее каменного, крутится вокруг середины)
    
    //  - Блок слизи (выступает в роле батута)
    
    //  - Блок облако (Разрушается по тапу на него,не действует гравитация)
    
    //  - Блок активации (По тапу замирает, при повторном тапе продолжает движение)
    
    //  - Блок с шипами (Разрушает некоторые блоки которые попали на него, убивает персонажа)
    
    // Блоки ниже рассматривать в качесте концепта
    
    //  - Блок льда (Отсутствует трение)
    //  - Балка конвеер (Движе все что на нее попало в какую-то сторону)
    //  - Блок вентилятор (Отталкивает все в каком-то направлении)
    //  - Блок Черная дыра (Имее силу притяжения)
    //  - Блок стекла (Разбивается при сильном падении или если его что-то ударяет)
    //  - Блок воздушный шар (Всегда поднимается вверх)
    //  - Липки блок (Все что прикоснется к нему, прилипает, по тапу отлипляет все что прилеплено)
    
    // Можешь продолжить...
    
    
    
    
    
    //TO DO List
    //  -   Меню с уровнями
    //  -   При контакте с землей и лежании ГГ на земле 5 сек, уровень должен завершаться с соответ. окном
    //  -   Переход между уровнями
    //  -   Допилить спрайты для объектов
    //  -   Допилить спрайты для фонов
    //  -   Допилить маску коллизии для ГГ
    //  -
    
    //При вызове этой функции, показывается меню.
    func showButtons(){
        let button1 = SKSpriteNode(imageNamed: "Button1.png")
        button1.position = CGPointMake(CGRectGetMidX(self.frame)/2, CGRectGetMidY(self.frame))
        button1.name = "retry"
        button1.xScale = 0.5
        button1.yScale = 0.5
        button1.zPosition = 2
        self.addChild(button1)
        
        let button2 = SKSpriteNode(imageNamed: "Button2.png")
        button2.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        button2.name = "button2"
        button2.xScale = 0.5
        button2.yScale = 0.5
        button2.zPosition = 2
        self.addChild(button2)
        
        let button3 = SKSpriteNode(imageNamed: "Button3.png")
        button3.position = CGPointMake(CGRectGetMidX(self.frame)+(CGRectGetMidX(self.frame)/2), CGRectGetMidY(self.frame))
        button3.name = "button3"
        button3.xScale = 0.5
        button3.yScale = 0.5
        button3.zPosition = 2
        self.addChild(button3)
        
        let menuBoard = SKSpriteNode(imageNamed: "MenuBoard.png")
        menuBoard.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        menuBoard.name = "menuBoard"
        menuBoard.xScale = 1.4
        menuBoard.yScale = 1.4
        menuBoard.zPosition = 1
        self.addChild(menuBoard)
    }

    //Ициализация свойств игровых объектов
    func initGameObject(){
        
        //  Инициализация MainCharacter
        //        let main = self.childNodeWithName("MainCharacter") as? SKSpriteNode
        //        main!.physicsBody?.friction = 0.2
        //        main!.physicsBody?.restitution = 0.3
        //        main!.physicsBody?.linearDamping = 0.2
        //        main!.physicsBody?.angularDamping = 0.2
        //        main!.physicsBody?.mass = 2.0
        //
        //        let qwe = self.childNodeWithName("WoodenBox1") as? SKSpriteNode
        //        qwe!.physicsBody?.friction = 0.2
        //        qwe!.physicsBody?.restitution = 0.3
        //        qwe!.physicsBody?.linearDamping = 0.2
        //        qwe!.physicsBody?.angularDamping = 0.2
        //        qwe!.physicsBody?.mass = 2.0
        //        qwe?.physicsBody?.pinned = true
        
        //  Инициализация Background
        //let background = self.childNodeWithName("Background") as? SKSpriteNode

          //Инициализация MainCharacter

        for main in self.children {
            if main.name == "MainCharacter" {
                if let main = main as? SKSpriteNode {
                    main.physicsBody?.friction = 0.2
                    main.physicsBody?.restitution = 0.3
                    main.physicsBody?.linearDamping = 0.2
                    main.physicsBody?.angularDamping = 0.2
                    main.physicsBody?.mass = 2.0
                }
            }
        }

        
        //  Инициализация WallBlockOpen
        for wallBlock in self.children {
            if wallBlock.name == "WallBlock" {
                if let wallBlock = wallBlock as? SKSpriteNode {
                    wallBlock.physicsBody?.friction = 0.1
                    wallBlock.physicsBody?.restitution = 0.1
                    wallBlock.physicsBody?.linearDamping = 0.1
                    wallBlock.physicsBody?.angularDamping = 0.1
                    wallBlock.physicsBody?.mass = 3.0
                    wallBlock.physicsBody?.pinned = true
                    wallBlock.physicsBody?.allowsRotation = false
                }
            }
        }
        
        
        
        //  Инициализация SpearBlock
        for spearBlock in self.children {
            if spearBlock.name == "SpearBlock" {
                if let spearBlock = spearBlock as? SKSpriteNode {
                    spearBlock.physicsBody?.friction = 0.1
                    spearBlock.physicsBody?.restitution = 0.1
                    spearBlock.physicsBody?.linearDamping = 0.1
                    spearBlock.physicsBody?.angularDamping = 0.1
                    spearBlock.physicsBody?.mass = 2.0
                    spearBlock.physicsBody?.pinned = true
                    spearBlock.physicsBody?.allowsRotation = false
                }
            }
        }
        
        
        //  Инициализация SlimeBlock
        for slimeBlock in self.children {
            if slimeBlock.name == "SlimeBlock" {
                if let slimeBlock = slimeBlock as? SKSpriteNode {
                    slimeBlock.physicsBody?.friction = 0.1
                    slimeBlock.physicsBody?.restitution = 1.1
                    slimeBlock.physicsBody?.linearDamping = 0.1
                    slimeBlock.physicsBody?.angularDamping = 0.1
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
                    woodenBox.physicsBody?.pinned = false
                }
            }
        }
        
        
        //  Инициализация WoodenPlank
        for woodenPlank in self.children {
            if woodenPlank.name == "WoodenPlank" {
                if let woodenPlank = woodenPlank as? SKSpriteNode {
                    woodenPlank.physicsBody?.friction = 0.2
                    woodenPlank.physicsBody?.restitution = 0.3
                    woodenPlank.physicsBody?.linearDamping = 0.2
                    woodenPlank.physicsBody?.angularDamping = 0.2
                    woodenPlank.physicsBody?.mass = 1.5
                }
            }
        }
        
        //  Инициализация StoneBlock
        for stoneBlock in self.children {
            if stoneBlock.name == "StoneBlock" {
                if let stoneBlock = stoneBlock as? SKSpriteNode {
                    stoneBlock.physicsBody?.friction = 0.3
                    stoneBlock.physicsBody?.restitution = 0.2
                    stoneBlock.physicsBody?.linearDamping = 0.2
                    stoneBlock.physicsBody?.angularDamping = 0.2
                    stoneBlock.physicsBody?.mass = 3.0
                }
            }
        }
        
        //  Инициализация ActiveBlock
        for activeBlock in self.children {
            if activeBlock.name == "ActiveBlock" {
                if let activeBlock = activeBlock as? SKSpriteNode {
                    activeBlock.physicsBody?.friction = 0.3
                    activeBlock.physicsBody?.restitution = 0.2
                    activeBlock.physicsBody?.linearDamping = 0.2
                    activeBlock.physicsBody?.angularDamping = 0.2
                    activeBlock.physicsBody?.mass = 3.0
                    
                    //Особые характеристики
                    activeBlock.physicsBody?.pinned = true
                    activeBlock.physicsBody?.dynamic = false
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
            
            if (touchedNode.name == "WoodenBox" || touchedNode.name == "WoodenPlank" || touchedNode.name == "SlimeBlock") {
                touchedNode.removeFromParent() //удаление
            }
            //            else {
            //                print("В таче else")
            //                let sprite = StarNode.star(touch.locationInNode(self))
            //                sprite.name = "WoodenBox"
            //                sprite.xScale = 0.35
            //                sprite.yScale = 0.35
            //                print (sprite.name);
            //                self.addChild(sprite)
            //            }
            
            //Почему - то  это условие не работает
            //if spriteNode.texture == SKTexture(imageNamed: "ActivaBlock_On"){
            //Пока будет костыль
            
            //TODO: Переделать условие на человеческое(Мб и такое норм)

            
            if let spriteNode = touchedNode as? SKSpriteNode {
                if spriteNode.name == "WallBlock"{
                    if spriteNode.physicsBody?.allowsRotation == true {
                        
                        spriteNode.physicsBody?.pinned = true
                        spriteNode.physicsBody?.allowsRotation = false
                        spriteNode.texture = SKTexture(imageNamed: "WallBlockOpen")


                        
                    }
                    else {
                        
                        spriteNode.physicsBody?.pinned = true
                        spriteNode.physicsBody?.allowsRotation = true
                        spriteNode.texture = SKTexture(imageNamed: "WallBlockClose")

                    }
                }
            }
            
            
            
            
            //TODO: Переделать условие на человеческое(Мб и такое норм)
            if let spriteNode = touchedNode as? SKSpriteNode {
                if spriteNode.name == "ActiveBlock"{
                    if spriteNode.physicsBody?.pinned == false{
                        spriteNode.physicsBody?.pinned = true
                        spriteNode.physicsBody?.dynamic = false
                        print("ActiveBlock_TRUE")
                        // OFF
                        spriteNode.texture = SKTexture(imageNamed: "ActivaBlock_Off")
                    }
                    else{
                        spriteNode.physicsBody?.pinned = false
                        spriteNode.physicsBody?.dynamic = true
                        print("ActiveBlock_FALSE")
                        //ON
                        spriteNode.texture = SKTexture(imageNamed: "ActivaBlock_On")
                    }
                }
            }
            

            if let spriteNode = touchedNode as? SKSpriteNode {
                if spriteNode.name == "StoneBlock"{
                    if spriteNode.physicsBody?.mass == 3.0 {
                        spriteNode.texture = SKTexture(imageNamed: "BrokenStoneBlock")
                        spriteNode.physicsBody?.mass = 2.0
                    }
                    else{
                        spriteNode.removeFromParent()
                    }
                }
            }
            
            
            
            
            let touch = touches
            let location = touch.first!.locationInNode(self)
            let node = self.nodeAtPoint(location)
            
            if (node.name == "retry") {
                print("нажали на кнопку button2")
                let GameScene1 = GameScene(fileNamed:"Level_1")
                let transition = SKTransition.doorsCloseHorizontalWithDuration(0.5)
                GameScene1!.scaleMode = SKSceneScaleMode.AspectFill
                self.scene!.view?.presentScene(GameScene1!, transition: transition)
            }
            if (node.name == "button2") {
                
                print("нажали на кнопку button2")
                let SecondScene = GameScene(fileNamed:"SecondScene")
                let transition = SKTransition.doorsCloseHorizontalWithDuration(0.5)
                SecondScene!.scaleMode = SKSceneScaleMode.AspectFill
                self.scene!.view?.presentScene(SecondScene!, transition: transition)
            }
            
        }
    }
    
//    TODO: Разобраться условием соприкасновения объектов
    
    func didBeginContact(contact: SKPhysicsContact) {
        print("Как ты работаешь?")
    }

    var показывалиМеню = false
    
    //Удаляет спрайт, когда он улетел за экран
    override func didSimulatePhysics() {
        let woodenBoxx = childNodeWithName("WoodenBox")
        let main = self.childNodeWithName("MainCharacter") as? SKSpriteNode
        
        if (woodenBoxx?.position.y < 0) {
            [woodenBoxx?.removeFromParent];
            
        }
       
        //если ГГ улетел за сцену, показываем меню
        //меню (кнопки накладывались на кнопки) раньше создавалось постоянно, а теперь только один раз
        if ( (main?.position.y < 0) && (показывалиМеню == false)) {
            showButtons()
            показывалиМеню = true //если показывали меню, то true
        }
    }
    
    
    //    private func gameOver(didWin: Bool) {
    //        print("- - - Game Ended - - -")
    //        let menuScene = GameScene(size: self.size)
    //        let transition = SKTransition.flipVerticalWithDuration(1.0)
    //        menuScene.scaleMode = SKSceneScaleMode.AspectFill
    //        self.scene!.view?.presentScene(menuScene, transition: transition)
    //    }
    
    
    //Таинственная функция. Про нее ходят легенды, но никто не знает что она делает.
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
