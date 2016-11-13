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
    
    public var groundColorPub = UIColor.green
    

    
    func colorPicker(level: Int) ->  UIColor {
        if (level > 0 && level <= 16) {
            return color1
        }
        else {
            if (level > 16 && level <= 32) {
                return color2
            }
            else {
                return color0
            }
        }
    }
    
    //Палитра для интерфеса
    var color0 = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    var color1 = #colorLiteral(red: 1, green: 0.7871779203, blue: 0.5874175429, alpha: 1)
    var color2 = #colorLiteral(red: 0.6314342022, green: 0.7059366107, blue: 0.7861329317, alpha: 1)

    
    // ОТЛАДКА ДЛЯ РАЗРАБОТЧИКА
    public var myLabel1:SKLabelNode!
    public var myLabel2:SKLabelNode!
    public var myLabel3:SKLabelNode!
    public var myLabel4:SKLabelNode!
    public var myLabel5:SKLabelNode!
    
    
    func setTopScene(topStage: Int) {
        UserDefaults.standard.set(topStage, forKey: "topStage")
        UserDefaults.standard.synchronize()
    }
    
    func getTopScene() -> (Int) {
       return UserDefaults.standard.integer(forKey: "topStage")
    }
    
    func stopButtonInit() {
        let stopButton = SKSpriteNode(imageNamed: "stopButton.png")
        stopButton.position = CGPoint(x: self.frame.width - 140, y: self.frame.height - 180)
        stopButton.name = "stop"
        stopButton.xScale = 0.35
        stopButton.yScale = 0.35
        stopButton.zPosition = 999
        stopButton.alpha = 0.4
        stopButton.color = colorPicker(level: thisScene)
        stopButton.colorBlendFactor = CGFloat(1.0)
        self.addChild(stopButton)
        
//        let stopButton1 = SKSpriteNode(imageNamed: "stopButton.png")
//        stopButton1.position = CGPoint(x: self.frame.midX/2, y: self.frame.midY)
//        stopButton1.name = "1"
//        stopButton1.xScale = 0.35
//        stopButton1.yScale = 0.35
//        stopButton1.zPosition = 999
//        stopButton1.alpha = 0.8
//        stopButton1.color = UIColor.green
//        stopButton1.colorBlendFactor = CGFloat(1.0)
//        self.addChild(stopButton1)
//       
//        let stopButton2 = SKSpriteNode(imageNamed: "stopButton.png")
//        stopButton2.position = CGPoint(x: self.frame.midX+(self.frame.midX/2), y: self.frame.midY)
//        stopButton2.name = "2"
//        stopButton2.xScale = 0.35
//        stopButton2.yScale = 0.35
//        stopButton2.zPosition = 999
//        stopButton2.alpha = 0.8
//        stopButton2.color = UIColor.red
//        stopButton2.colorBlendFactor = CGFloat(1.0)
//        self.addChild(stopButton2)
    }
    
    func statusBarInit() {

        myLabel1 = SKLabelNode(fontNamed: "Arial")
        myLabel1.fontSize = 40
        myLabel1.zPosition = 999
        myLabel1.position = CGPoint(x: 300, y: 1800)
        self.addChild(myLabel1)

        myLabel2 = SKLabelNode(fontNamed: "Arial")
        myLabel2.fontSize = 40
        myLabel2.zPosition = 999
        myLabel2.position = CGPoint(x: 300, y: 1760)
        self.addChild(myLabel2)
        

        myLabel3 = SKLabelNode(fontNamed: "Arial")
        myLabel3.fontSize = 40
        myLabel3.zPosition = 999
        myLabel3.position = CGPoint(x: 300, y: 1720)
        self.addChild(myLabel3)
        

        myLabel4 = SKLabelNode(fontNamed: "Arial")
        myLabel4.fontSize = 40
        myLabel4.zPosition = 999
        myLabel4.position = CGPoint(x: 300, y: 1680)
        self.addChild(myLabel4)
        
        
        myLabel5 = SKLabelNode(fontNamed: "Arial")
        myLabel5.fontSize = 30
        myLabel5.zPosition = 999
        myLabel5.position = CGPoint(x: 300, y: 1640)
        self.addChild(myLabel5)
        
    }
    
    func statusBar() {
        myLabel1.text = "Текущая сцена = "+String(thisScene)
        myLabel2.text = "Топовая сцена = "+String(topScene)
        myLabel3.text = "Касается земли? = "+String(onGround)
        myLabel4.text = "Время на земле = "+String(onGroundTime)
        myLabel5.text = "ГГ dy = "+String(describing: dy)
    }

    //При вызове этой функции, показывается меню проигрыша.
    func showLMenu(){
        let menuBoard = SKSpriteNode(imageNamed: "MenuBoard.png")
        menuBoard.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        menuBoard.name = "menuBoard"
        menuBoard.xScale = 1.4
        menuBoard.yScale = 1.4
        menuBoard.zPosition = 998
        menuBoard.color = colorPicker(level: thisScene)
        menuBoard.colorBlendFactor = CGFloat(0.7)
        self.addChild(menuBoard)
        
        let retryButton = SKSpriteNode(imageNamed: "retryButton.png")
        retryButton.position = CGPoint(x: self.frame.midX/2, y: self.frame.midY)
        retryButton.name = "retry"
        retryButton.xScale = 0.5
        retryButton.yScale = 0.5
        retryButton.zPosition = 999
        retryButton.color = colorPicker(level: thisScene)
        retryButton.colorBlendFactor = CGFloat(1.0)
        self.addChild(retryButton)
        
        let menuButton = SKSpriteNode(imageNamed: "menuButton.png")
        menuButton.position = CGPoint(x: self.frame.midX+(self.frame.midX/2), y: self.frame.midY)
        menuButton.name = "menu"
        menuButton.xScale = 0.5
        menuButton.yScale = 0.5
        menuButton.zPosition = 999
        menuButton.color = colorPicker(level: thisScene)
        menuButton.colorBlendFactor = CGFloat(1.0)
        self.addChild(menuButton)
        
//        let button3 = SKSpriteNode(imageNamed: "Button3.png")
//        button3.position = CGPoint(x: self.frame.midX+(self.frame.midX/2), y: self.frame.midY)
//        button3.name = "button3"
//        button3.xScale = 0.5
//        button3.yScale = 0.5
//        button3.zPosition = 999
//        button3.color = colorPicker(level: thisScene)
//        button3.colorBlendFactor = CGFloat(1.0)
//        self.addChild(button3)
        
        var myLabel:SKLabelNode!
        myLabel = SKLabelNode(fontNamed: "Arial")
        myLabel.name = "label"
        myLabel.text = "Lose"
        myLabel.fontSize = 100
        myLabel.zPosition = 999
        myLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 190)
        self.addChild(myLabel)
    }
    
    
    //При вызове этой функции, показывается меню перезапуска.
    func showRMenu(){
        let menuBoard = SKSpriteNode(imageNamed: "MenuBoard.png")
        menuBoard.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        menuBoard.name = "menuBoard"
        menuBoard.xScale = 1.4
        menuBoard.yScale = 1.4
        menuBoard.zPosition = 998
        menuBoard.color = colorPicker(level: thisScene)
        menuBoard.colorBlendFactor = CGFloat(0.7)
        self.addChild(menuBoard)
        
        let retryButton = SKSpriteNode(imageNamed: "retryButton.png")
        retryButton.position = CGPoint(x: self.frame.midX/2, y: self.frame.midY)
        retryButton.name = "retry"
        retryButton.xScale = 0.5
        retryButton.yScale = 0.5
        retryButton.zPosition = 999
        retryButton.color = colorPicker(level: thisScene)
        retryButton.colorBlendFactor = CGFloat(1.0)
        self.addChild(retryButton)
        
        let nextButton = SKSpriteNode(imageNamed: "nextButton.png")
        nextButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        nextButton.name = "next"
        nextButton.xScale = 0.5
        nextButton.yScale = 0.5
        nextButton.zPosition = 999
        nextButton.color = colorPicker(level: thisScene)
        nextButton.colorBlendFactor = CGFloat(1.0)
        self.addChild(nextButton)
        
        let menuButton = SKSpriteNode(imageNamed: "menuButton.png")
        menuButton.position = CGPoint(x: self.frame.midX+(self.frame.midX/2), y: self.frame.midY)
        menuButton.name = "menu"
        menuButton.xScale = 0.5
        menuButton.yScale = 0.5
        menuButton.zPosition = 999
        menuButton.color = colorPicker(level: thisScene)
        menuButton.colorBlendFactor = CGFloat(1.0)
        self.addChild(menuButton)
        
        
        //Для отладки
        let prevButton = SKSpriteNode(imageNamed: "prevButton.png")
        prevButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY-(self.frame.midY/2))
        prevButton.name = "prev"
        prevButton.xScale = 0.5
        prevButton.yScale = 0.5
        prevButton.zPosition = 999
        prevButton.color = colorPicker(level: thisScene)
        prevButton.colorBlendFactor = CGFloat(1.0)
        self.addChild(prevButton)

        
        var myLabel:SKLabelNode!
        myLabel = SKLabelNode(fontNamed: "Arial")
        myLabel.name = "label"
        myLabel.text = "Retry"
        myLabel.fontSize = 100
        myLabel.zPosition = 999
        myLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 190)
        self.addChild(myLabel)
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
        menuBoard.color = colorPicker(level: thisScene)
        menuBoard.colorBlendFactor = CGFloat(0.7)
        self.addChild(menuBoard)
        
        let nextButton = SKSpriteNode(imageNamed: "nextButton.png")
        nextButton.position = CGPoint(x: self.frame.midX/2, y: self.frame.midY)
        nextButton.name = "next"
        nextButton.xScale = 0.5
        nextButton.yScale = 0.5
        nextButton.zPosition = 999
        nextButton.color = colorPicker(level: thisScene)
        nextButton.colorBlendFactor = CGFloat(1.0)
        self.addChild(nextButton)
        
        let retryButton = SKSpriteNode(imageNamed: "retryButton.png")
        retryButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        retryButton.name = "retry"
        retryButton.xScale = 0.5
        retryButton.yScale = 0.5
        retryButton.zPosition = 999
        retryButton.color = colorPicker(level: thisScene)
        retryButton.colorBlendFactor = CGFloat(1.0)
        self.addChild(retryButton)
        
        let menuButton = SKSpriteNode(imageNamed: "menuButton.png")
        menuButton.position = CGPoint(x: self.frame.midX+(self.frame.midX/2), y: self.frame.midY)
        menuButton.name = "menu"
        menuButton.xScale = 0.5
        menuButton.yScale = 0.5
        menuButton.zPosition = 999
        menuButton.color = colorPicker(level: thisScene)
        menuButton.colorBlendFactor = CGFloat(1.0)
        self.addChild(menuButton)
        
        //Для отладки
        let prevButton = SKSpriteNode(imageNamed: "prevButton.png")
        prevButton.position = CGPoint(x: self.frame.midX, y: self.frame.midY-(self.frame.midY/2))
        prevButton.name = "prev"
        prevButton.xScale = 0.5
        prevButton.yScale = 0.5
        prevButton.zPosition = 999
        prevButton.color = colorPicker(level: thisScene)
        prevButton.colorBlendFactor = CGFloat(1.0)
        self.addChild(prevButton)
        
        var myLabel:SKLabelNode!
        myLabel = SKLabelNode(fontNamed: "Arial")
        myLabel.name = "label"
        myLabel.text = "Win"
        myLabel.fontSize = 100
        myLabel.zPosition = 999
        myLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 190)
        self.addChild(myLabel)
    }

    
    
    //При вызове этой функции, показывается меню перезапуска.
    func removeMenu(){
        print("Удаляю МЕНЮ")
        
        
        for menuBoard in self.children {
            if menuBoard.name == "menuBoard" {
                if let menuBoard = menuBoard as? SKSpriteNode {
                    menuBoard.removeAllChildren()
                    menuBoard.removeFromParent()
                }
            }
        }
        
        for nextButton in self.children {
            if nextButton.name == "next" {
                if let nextButton = nextButton as? SKSpriteNode {
                    nextButton.removeAllChildren()
                    nextButton.removeFromParent()
                }
            }
        }
        
        for retryButton in self.children {
            if retryButton.name == "retry" {
                if let retryButton = retryButton as? SKSpriteNode {
                    retryButton.removeAllChildren()
                    retryButton.removeFromParent()
                }
            }
        }
        
        for menuButton in self.children {
            if menuButton.name == "menu" {
                if let menuButton = menuButton as? SKSpriteNode {
                    menuButton.removeAllChildren()
                    menuButton.removeFromParent()
                }
            }
        }
        
        for prevButton in self.children {
            if prevButton.name == "prev" {
                if let prevButton = prevButton as? SKSpriteNode {
                    prevButton.removeAllChildren()
                    prevButton.removeFromParent()
                }
            }
        }
        
        for myLabel in self.children {
            if myLabel.name == "label" {
                if let myLabel = myLabel as? SKLabelNode {
                    myLabel.removeAllChildren()
                    myLabel.removeFromParent()
                }
            }
        }
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

        //Цвет Ground
        let groundColor = #colorLiteral(red:Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), green: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), blue: Float(randomBetweenNumbers(firstNum: 0.0, secondNum:1.0)), alpha: 1)
        
        groundColorPub = groundColor

        //Инициализация Ground
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
                    ground.color = groundColor
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
                    stoneBlock.physicsBody?.mass = 10.0
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
        
        //Инициализация игровых объектов
        initGameObject()

        //Инициализация статус бара
        statusBarInit()

        //Инициализация и установка кнопки pause
        stopButtonInit()
        

        
        self.physicsWorld.contactDelegate = self
        

        
//        print("================================")
//        print("================================")
//        print("====ИНИЦИАЛИЗАЦИЯ ЗАВЕРШЕНА=====")
//        let age = defaults.integer(forKey: "age")
//        print("================================")
//        print("============="+String(age)+"============")
//        print("================================")

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
            
            if (touchedNode.name == "stop") {
                if (showMenu == true ) {
                    showMenu = false
                    print("SHOW_MENU_FALSE")
                    removeMenu()
                }
                else {
                    showMenu = true
                    print("SHOW_MENU_TRUE")
                    showRMenu()
                }
            }

    

            
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
                    if spriteNode.physicsBody?.mass == 10.0 {
                        spriteNode.texture = SKTexture(imageNamed: "BrokenStoneBlock")
                        spriteNode.physicsBody?.mass = 9.0
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
                setTopScene(topStage: topScene)
                print("retry")
                let currentScene = GameScene(fileNamed: "Level "+String(thisScene))
                let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
                currentScene!.scaleMode = SKSceneScaleMode.aspectFill
                currentScene?.viewController = self.viewController
                self.scene!.view?.presentScene(currentScene!, transition: transition)
            }
            
            if node.name == "next"{
                setTopScene(topStage: topScene)
                thisScene+=1
                
                let currentScene = GameScene(fileNamed: "Level "+String(thisScene))
                let transition = SKTransition.doorway(withDuration: 0.5)
                currentScene!.scaleMode = SKSceneScaleMode.aspectFill
                currentScene?.viewController = self.viewController
                self.scene!.view?.presentScene(currentScene!, transition: transition)
            }
            
            if node.name == "prev"{
                setTopScene(topStage: topScene)
                thisScene-=1
                let currentScene = GameScene(fileNamed: "Level "+String(thisScene))
                let transition = SKTransition.doorway(withDuration: 0.5)
                currentScene!.scaleMode = SKSceneScaleMode.aspectFill
                currentScene?.viewController = self.viewController
                self.scene!.view?.presentScene(currentScene!, transition: transition)
                
            }
            
//            if node.name == "1"{
//                //Получение данных green
//                topScene = getTopScene()
//            }
//            
//            if node.name == "2"{
//                //Сохранение данных red
//                setTopScene(topStage: topScene)
//            }

            
            
            
            //переходим в главное меню
            if node.name == "menu"{
                setTopScene(topStage: topScene)
//                просто создал Segue и задал ей имя, с помощью имени ищем Segue и переходим
                self.viewController.performSegue(withIdentifier: "GoToMainMenu", sender: self)
                
                
                //удаляем все говно со сцены, чтобы при новом открытии фпс норм были
                self.scene!.removeFromParent()
                
                //не работали кнопки в игровом меню из-за того, что не было строчки ниже
                self.scene!.view?.removeFromSuperview()
                
                
                self.removeFromParent()
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
            //onGround = false
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
    public var dy = CGFloat(0.0)
    

    override func didSimulatePhysics() {

        let mainChrctr = self.childNode(withName: "MainCharacter") as? SKSpriteNode
        if mainChrctr?.position.y < 0 {
            onGround = false
        }
        
        
        
        //Удаляет спрайт, когда он улетел за экран
        for allObject in self.children {
            if let allObject = allObject as? SKSpriteNode {
                if (allObject.position.y < 0) {
                    allObject.removeFromParent()
                }
            }
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
                            //progressBar.color = groundColorPub
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
            
            //ПЕРЕМЕННАЯ ДЛЯ ОТЛАДКИ
            dy = (mainChrctr?.physicsBody?.velocity.dy)!
            
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
    
        statusBar()
        

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
