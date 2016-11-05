// Ver 0.0000000014

import SpriteKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


    






class GameScene: SKScene, SKPhysicsContactDelegate {
    
     var viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as UIViewController

    //Рандомные FLOAT цифры
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    


    //При вызове этой функции, показывается меню проигрыша.
    func showLMenu(){
        let menuBoard = SKSpriteNode(imageNamed: "MenuBoard.png")
        menuBoard.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        menuBoard.name = "menuBoard"
        menuBoard.xScale = 1.4
        menuBoard.yScale = 1.4
        menuBoard.zPosition = 998
        self.addChild(menuBoard)
        
        let button1 = SKSpriteNode(imageNamed: "Button1.png")
        button1.position = CGPoint(x: self.frame.midX/2, y: self.frame.midY)
        button1.name = "retry"
        button1.xScale = 0.5
        button1.yScale = 0.5
        button1.zPosition = 999
        button1.color = #colorLiteral(red:Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), green: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), blue: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), alpha: 1)
        button1.colorBlendFactor = CGFloat(1.0)
        self.addChild(button1)
        
        let button2 = SKSpriteNode(imageNamed: "Button2.png")
        button2.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        button2.name = "menu"
        button2.xScale = 0.5
        button2.yScale = 0.5
        button2.zPosition = 999
        button2.color = #colorLiteral(red:Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), green: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), blue: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), alpha: 1)
        button2.colorBlendFactor = CGFloat(1.0)
        self.addChild(button2)
        
        let button3 = SKSpriteNode(imageNamed: "Button3.png")
        button3.position = CGPoint(x: self.frame.midX+(self.frame.midX/2), y: self.frame.midY)
        button3.name = "button3"
        button3.xScale = 0.5
        button3.yScale = 0.5
        button3.zPosition = 999
        button3.color = #colorLiteral(red:Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), green: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), blue: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), alpha: 1)
        button3.colorBlendFactor = CGFloat(1.0)
        self.addChild(button3)
    }
    

    
    //При вызове этой функции, показывается меню выигрыша.
    func showWMenu(){
        if thisScene == topScene {
            topScene+=1
        }
        let menuBoard = SKSpriteNode(imageNamed: "MenuBoard.png")
        menuBoard.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        menuBoard.name = "menuBoard"
        menuBoard.xScale = 1.4
        menuBoard.yScale = 1.4
        menuBoard.zPosition = 998
        self.addChild(menuBoard)
        
        let button2 = SKSpriteNode(imageNamed: "nextButton.png")
        button2.position = CGPoint(x: self.frame.midX/2, y: self.frame.midY)
        button2.name = "next"
        button2.xScale = 0.5
        button2.yScale = 0.5
        button2.zPosition = 999
        button2.color = #colorLiteral(red:Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), green: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), blue: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), alpha: 1)
        button2.colorBlendFactor = CGFloat(1.0)
        self.addChild(button2)
        
        let button1 = SKSpriteNode(imageNamed: "Button1.png")
        button1.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        button1.name = "retry"
        button1.xScale = 0.5
        button1.yScale = 0.5
        button1.zPosition = 999
        button1.color = #colorLiteral(red:Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), green: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), blue: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), alpha: 1)
        button1.colorBlendFactor = CGFloat(1.0)
        self.addChild(button1)
        
        let button3 = SKSpriteNode(imageNamed: "prevButton.png")
        button3.position = CGPoint(x: self.frame.midX+(self.frame.midX/2), y: self.frame.midY)
        button3.name = "prev"
        button3.xScale = 0.5
        button3.yScale = 0.5
        button3.zPosition = 999
        button3.color = #colorLiteral(red:Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), green: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), blue: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), alpha: 1)
        button3.colorBlendFactor = CGFloat(1.0)
        self.addChild(button3)
    }

    //Ициализация свойств игровых объектов
    func initGameObject(){
        //let qwe = You()
        //print("Транспорт: \(qwe.description)")
        for main in self.children {
            if main.name == "MainCharacter" {
                if let main = main as? SKSpriteNode {
                    
                    //Маска коллизии для ГГ
                    let offsetX: CGFloat = main.frame.size.width * (main.anchorPoint.x - 0.05)
                    let offsetY: CGFloat = main.frame.size.height * (main.anchorPoint.y - 0.05)
                    let path = CGMutablePath()
                    path.move(to: CGPoint(x: 48 - offsetX, y: 35 - offsetY))
                    path.addLine(to: CGPoint(x: 110 - offsetX, y: 35 - offsetY))
                    path.addLine(to: CGPoint(x: 123 - offsetX, y: 52 - offsetY))
                    path.addLine(to: CGPoint(x: 127 - offsetX, y: 82 - offsetY))
                    path.addLine(to: CGPoint(x: 123 - offsetX, y: 202 - offsetY))
                    path.addLine(to: CGPoint(x: 104 - offsetX, y: 214 - offsetY))
                    path.addLine(to: CGPoint(x: 68 - offsetX, y: 218 - offsetY))
                    path.addLine(to: CGPoint(x: 36 - offsetX, y: 209 - offsetY))
                    path.addLine(to: CGPoint(x: 25 - offsetX, y: 199 - offsetY))
                    path.addLine(to: CGPoint(x: 27 - offsetX, y: 67 - offsetY))
                    path.addLine(to: CGPoint(x: 33 - offsetX, y: 47 - offsetY))
                    path.closeSubpath()
                    
                    
                    main.physicsBody! = SKPhysicsBody(polygonFrom: path)
                    main.physicsBody?.friction = 0.2
                    main.physicsBody?.restitution = 0.3
                    main.physicsBody?.restitution = 0.4
                    main.physicsBody?.linearDamping = 0.2
                    main.physicsBody?.angularDamping = 0.2
                    main.physicsBody?.mass = 2.0
                    main.physicsBody?.categoryBitMask = 1
                    main.physicsBody?.contactTestBitMask = 2
                    main.physicsBody?.collisionBitMask =  2

                }
            }
        }


        
        //  Инициализация Ground
        for ground in self.children {
            if ground.name == "Ground" {
                if let ground = ground as? SKSpriteNode {
                    ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ground.size.width, height: ground.size.height))
                    ground.physicsBody?.pinned = true
                    ground.physicsBody?.allowsRotation = false
                    ground.physicsBody?.friction = 0.2
                    ground.physicsBody?.restitution = 0.2
                    ground.physicsBody?.linearDamping = 0.1
                    ground.physicsBody?.angularDamping = 0.1
                    ground.physicsBody?.mass = 6.0
                    ground.physicsBody?.categoryBitMask = 2;
                    ground.physicsBody?.contactTestBitMask = 1;
                    ground.physicsBody?.collisionBitMask =  1;
                    
                    ground.color = #colorLiteral(red:Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), green: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), blue: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), alpha: 1)
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
                    spearBlock.physicsBody?.categoryBitMask = 3;
                    spearBlock.physicsBody?.contactTestBitMask = 1;
                    spearBlock.physicsBody?.collisionBitMask =  1;
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
        
        //  Инициализация GlassBlock
        for glassBlock in self.children {
            if glassBlock.name == "GlassBlock" {
                if let glassBlock = glassBlock as? SKSpriteNode {
                    glassBlock.physicsBody?.friction = 0.2
                    glassBlock.physicsBody?.restitution = 0.3
                    glassBlock.physicsBody?.linearDamping = 0.2
                    glassBlock.physicsBody?.angularDamping = 0.2
                    glassBlock.physicsBody?.mass = 1.0
                    glassBlock.physicsBody?.pinned = true
                    glassBlock.physicsBody?.isDynamic = false
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
                    activeBlock.physicsBody?.restitution = 0.3
                    activeBlock.physicsBody?.linearDamping = 0.4
                    activeBlock.physicsBody?.angularDamping = 0.4
                    activeBlock.physicsBody?.mass = 3.0
                    
                    //Особые характеристики
                    activeBlock.physicsBody?.pinned = true
                    activeBlock.physicsBody?.isDynamic = false
                }
            }
        }
        
    }
    
    
    
    //Функция выполняемая до открытия сцены
    override func didMove(to view: SKView) {
        //initVC()
        initGameObject()

        self.physicsWorld.contactDelegate = self
    }
    
    
    
    
    //Вызывается когда просиходит нажатие
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        // Цикл считывающий нажатие на экран
        for touch: AnyObject in touches {
            
            //print(thisScene," <-- Текущая ",topScene, "<-- Топовая")
            
            
            let touchLocation = touch.location(in: self)
            let touchedNode = self.atPoint(touchLocation)
            
            if  (
                touchedNode.name == "WoodenBox"
                || touchedNode.name == "WoodenPlank"
                || touchedNode.name == "SlimeBlock"
                || touchedNode.name == "GlassBlock"
                )
            {
                touchedNode.removeFromParent() //удаление
            }
            
            if touchedNode.name == "stop" {
                showMenu = true
                showWMenu()
            }
    
//            if ( touchedNode.name == "stop" || self.scene!.isPaused == false) {
//                print("нажали на кнопку СТОП (false)")
//                self.scene!.isPaused = true;
//            }
//            else {
//                print("нажали на кнопку СТОП (true)")
//                self.scene!.isPaused = false;
//            }
            //            else {
            //                print("В таче else")
            //                let sprite = StarNode.star(touch.locationInNode(self))
            //                sprite.name = "WoodenBox"
            //                sprite.xScale = 0.35
            //                sprite.yScale = 0.35
            //                print (sprite.name);
            //                self.addChild(sprite)
            //            }
            


            
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
                        spriteNode.physicsBody?.isDynamic = false
                        print("ActiveBlock_TRUE")
                        // OFF
                        spriteNode.texture = SKTexture(imageNamed: "ActivaBlock_Off")
                    }
                    else{
                        spriteNode.physicsBody?.pinned = false
                        spriteNode.physicsBody?.isDynamic = true
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
            let location = touch.first!.location(in: self)
            let node = self.atPoint(location)
            
            if node.name == "retry"{
                let currentScene = GameScene(fileNamed: "Level "+String(thisScene))
                let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
                currentScene!.scaleMode = SKSceneScaleMode.aspectFill
                self.scene!.view?.presentScene(currentScene!, transition: transition)
                
            }
            
            if node.name == "next"{

                thisScene+=1
                
                let currentScene = GameScene(fileNamed: "Level "+String(thisScene))
                let transition = SKTransition.doorway(withDuration: 0.5)
                currentScene!.scaleMode = SKSceneScaleMode.aspectFill
                self.scene!.view?.presentScene(currentScene!, transition: transition)
                
            }
            
            if node.name == "prev"{
                thisScene-=1
                let currentScene = GameScene(fileNamed: "Level "+String(thisScene))
                let transition = SKTransition.doorway(withDuration: 0.5)
                currentScene!.scaleMode = SKSceneScaleMode.aspectFill
                self.scene!.view?.presentScene(currentScene!, transition: transition)
                
                
            }
            
            
            
            //переходим в главное меню
            if node.name == "menu"{
                
//                просто создал Segue и задал ей имя, с помощью имени ищем Segue и переходим
                self.viewController.performSegue(withIdentifier: "GoToMainMenu", sender: self)
                
                
                //удаляем все говно со сцены, чтобы при новом открытии фпс норм были
                self.removeAllActions()
                self.removeAllChildren()
                
            }
            
            
            //Определение макс уровня, до которого дошел игрок
            if thisScene >= topScene {
                topScene = thisScene
            }

            
        }
    }
    
    public var onGroundTime = 0;
    public var onGround = false
    public var spearKill = false
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody?
        var secondBody: SKPhysicsBody?
        firstBody = contact.bodyA
        secondBody = contact.bodyB
        
        
        //Столкновение ГГ с Землей
        if firstBody!.categoryBitMask == 1 && secondBody!.categoryBitMask == 2 {
            onGround = true
            //print("On Ground(true)")
        }
        else {
            onGround = false
            //print("On Ground(false)")
        }
        
        //Столкновение ГГ с Шипами
        if firstBody!.categoryBitMask == 1 && secondBody!.categoryBitMask == 3 && showMenu == false {
            self.scene!.isPaused = true;
            //Прогресс бар становится красным
            for progressBar in self.children {
                if progressBar.name == "ProgressBar" {
                    if let progressBar = progressBar as? SKSpriteNode {
                        progressBar.size.width = 4000
                        progressBar.color = UIColor.red
                    }
                }
            }
            sleep(UInt32(0.5))
            showMenu = true
            showLMenu()
        }

    }

    var showMenu = false
    

    override func didSimulatePhysics() {

        //Удаляет спрайт, когда он улетел за экран       
        let mainChrctr = self.childNode(withName: "MainCharacter") as? SKSpriteNode
        let wdnBx = self.childNode(withName: "WoodenBox") as? SKSpriteNode

        if (wdnBx?.position.y < 0) {
            wdnBx?.removeFromParent()
        }

        
        /* Меню в конце сцены */
        if showMenu == false {
            if onGround == false {
                onGroundTime = 0
                for progressBar in self.children {
                    if progressBar.name == "ProgressBar" {
                        if let progressBar = progressBar as? SKSpriteNode {
                            progressBar.size.width = 0
                            progressBar.color = UIColor.green
                        }
                    }
                }
            }
            else{
                //Время которое персонаж лежит на земле
                onGroundTime+=1
                print(onGroundTime)
                //Прогресс бар
                for progressBar in self.children {
                    if progressBar.name == "ProgressBar" {
                        if let progressBar = progressBar as? SKSpriteNode {
                            progressBar.size.width = CGFloat(onGroundTime) * 39
                            progressBar.color = UIColor.green
                        }
                    }
                }
            
            

                //Если свинья на земле и время которое она пролежала на земле равно 100, то победа
                if onGroundTime > 100 && showMenu == false {
                    showMenu = true //если показывали меню, то true
                    showWMenu() //Показать меню выигрыша
                }
            
            }
        }
        if showMenu == false {
            //velocity > 0 - перс отлетает от поверхности, velocity < 0 персонаж летит вниз. Состояние покоя около 5.5
            if ((mainChrctr?.physicsBody?.velocity.dy)! > CGFloat(400.0) || (mainChrctr?.physicsBody?.velocity.dy)! < CGFloat(-400.0)) {
                mainChrctr?.texture = SKTexture(imageNamed: "MainCharacter_scare")
            }
            else {
                if((mainChrctr?.physicsBody?.velocity.dy)! >= CGFloat(10.0)) {
                    mainChrctr?.texture = SKTexture(imageNamed: "MainCharacter_pain")
                }
                else{
                    mainChrctr?.texture = SKTexture(imageNamed: "MainCharacter")
                }
            }
        }
    
    


        //если ГГ улетел за сцену, показываем меню
        if mainChrctr?.position.y < 0 && showMenu == false {
            showMenu = true //если показывали меню, то true
            showLMenu() //Показать меню проигрыша
            onGround = false //Свинья не на земле(за экраном она не может определить это)
        }
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {  /* Called before each frame is rendered */

    }
    
    

    
}
