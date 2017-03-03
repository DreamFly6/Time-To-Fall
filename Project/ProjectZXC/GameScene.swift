// Ver: 0.0000000100
// VerTitle: Cyprian

import SpriteKit
import GoogleMobileAds

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

public var thisScene = 1
public var topScene = 1
public var topActualScene = 48

public var buttonTitle : String = ""
public var itsNewBlock = true
public var n = [1,5,9,17,21,25,33,37,41]
public var timer = 0
public var AdCounter = 0
public var timeForMedal = [[10,13,16,100],//0
                           [7,9,11,100],//1
                           [6,8,10,100],//2
                           [8,10,12,100],//3
                           [7,9,11,100],//4
                           [6,8,10,100],//5
    
                           [7,8,10],//6
                           [7,8,10],//7 <---
                           [10,13,16],//8
                           [10,13,16],//10
                           [10,13,16],//11
                           [10,13,16],//12
                           [10,13,16],//13
                           [10,13,16],//14
                           [10,13,16],//15
                           [10,13,16],//16
                           [10,13,16],//17
                           [10,13,16],//18
                           [10,13,16],//19
                           [10,13,16],//20
                           [10,13,16],//21
                           [10,13,16],//22
                           [10,13,16],//23
                           [10,13,16],//24
                           [10,13,16],//25
                           [10,13,16],//26
                           [10,13,16],//27
                           [10,13,16],//28
                           [10,13,16],//29
                           [10,13,16],//30
                           [10,13,16],//31
                           [10,13,16],//32
                           [10,13,16],//33
                           [10,13,16],//34
                           [10,13,16],//35
                           [10,13,16],//36
                           [10,13,16],//37
                           [10,13,16],//38
                           [10,13,16],//39
                           [10,13,16],//40
                           [10,13,16],//41
                           [10,13,16],//42
                           [10,13,16],//43
                           [10,13,16],//44
                           [10,13,16],//45
                           [10,13,16],//45
                           [10,13,16],//45
                           [10,13,16],//45
                           [10,13,16]]//45
public var bestTime = 99
public var MedalOnLvl: [Int] = [Int] (repeating:3, count: 49)
public var onPause = false


//  Мета игра (фрии ту плей)
//  Показ рекламы
//  Просмотр видео за след уровень

class GameScene: SKScene, SKPhysicsContactDelegate {

    func skinArrSync() {
        UserDefaults.standard.set(MainBGPub,forKey: "MainBGPub")
        UserDefaults.standard.set(skinCondArr,forKey: "skinCondArr")
        UserDefaults.standard.set(skinBoolArr,forKey: "skinBoolArr")
        UserDefaults.standard.set(MedalOnLvl, forKey: "MedalOnLvl")
        UserDefaults.standard.synchronize()
    }

    func initNewBlockScreen() {
        var ok = false
        

        
        for index in 0...(n.count - 1) {
            if (topScene == n[index]){
                ok = true
                n[index] = 999
            }
        }
        

        
        if (ok == true && itsNewBlock == true && thisScene > 0){
            itsNewBlock = false
            let currentScene = GameScene(fileNamed: "Level 0")
            thisScene = 0
            let transition = SKTransition.doorway(withDuration: 0.5)
            currentScene!.scaleMode = SKSceneScaleMode.aspectFill
            currentScene?.viewController = self.viewController
            self.scene!.view?.presentScene(currentScene!, transition: transition)
        }


        
        if(thisScene == 0){
            for ground in self.children {
                if ground.name == "NewBlock" {
                    if let ground = ground as? SKSpriteNode {
                        ground.size.width = 342
                        ground.size.height = 342
                        let text = self.childNode(withName: "Text") as? SKLabelNode
                        switch topScene {
                        case 1:
                            ground.texture = SKTexture(imageNamed: "WoodenBox")
                            text?.text = "Wooden box"
                        case 5:
                            ground.texture = SKTexture(imageNamed: "WoodenPlank")
                            ground.size.width = 720
                            ground.size.height = 50
                            text?.text = "Wooden plank"
                        case 9:
                            ground.texture = SKTexture(imageNamed: "SlimeBlock")
                            text?.text = "Slime"
                        case 17:
                            ground.texture = SKTexture(imageNamed: "StoneBlock")
                            text?.text = "Stone block"
                        case 21:
                            ground.texture = SKTexture(imageNamed: "GlassBlock")
                            text?.text = "Glass"
                        case 25:
                            ground.texture = SKTexture(imageNamed: "SpearBlock")
                            text?.text = "Spiked block"
                        case 33:
                            ground.texture = SKTexture(imageNamed: "ActivaBlock_Off")
                            text?.text = "Non-gravity block"
                        case 37:
                            ground.texture = SKTexture(imageNamed: "RotationBlock")
                            text?.text = "Rotating block"
                        case 41:
                            ground.texture = SKTexture(imageNamed: "Magnit_Off")
                            text?.text = "Magnet"
                        default:
                            print("SHIT NEW BLOCK CONDITION")
                            print("SHIT NEW BLOCK CONDITION")
                            print("SHIT NEW BLOCK CONDITION")
                            print("SHIT NEW BLOCK CONDITION")
                            print("SHIT NEW BLOCK CONDITION")
                            print("SHIT NEW BLOCK CONDITION")
                            print("SHIT NEW BLOCK CONDITION")
                            print("SHIT NEW BLOCK CONDITION")
                            print("SHIT NEW BLOCK CONDITION")
                        }
                    }
                }
            }

            
            backgroundColor = #colorLiteral(red:Float(randomBetweenNumbers(firstNum: 0.2, secondNum:0.6)), green: Float(randomBetweenNumbers(firstNum: 0.2, secondNum:0.6)), blue: Float(randomBetweenNumbers(firstNum: 0.2, secondNum:0.6)), alpha: 1)
            
            
        }
        else {
            //Инициализация и установка кнопки pause
            stopButtonInit()
        }
        


        

    }
    
     var viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController") as UIViewController

    //Рандомные FLOAT цифры
    func randomBetweenNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
    
    public var groundColorPub = UIColor.green

    
    func colorPicker(level: Int) ->  UIColor {
        if (level > 0 && level <= 16) {
            MainBGPub = 1
            return color1
        }
        else {
            if (level > 16 && level <= 32) {
                MainBGPub = 2
                return color2
            }
            else {
                if (level > 32 && level <= 48) {
                    MainBGPub = 3
                    return color3
                }
                else {
                    MainBGPub = 2
                    return color0
                }
            }
        }
    }
    
    //Палитра для интерфеса
    var color0 = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    var color1 = #colorLiteral(red: 1, green: 0.7871779203, blue: 0.5874175429, alpha: 1)
    var color2 = #colorLiteral(red: 0.6314342022, green: 0.7059366107, blue: 0.7861329317, alpha: 1)
    var color3 = #colorLiteral(red: 0.8959465623, green: 0.9631058574, blue: 1, alpha: 1)
    
    // ОТЛАДКА ДЛЯ РАЗРАБОТЧИКА
    public var myLabel1:SKLabelNode!
    public var myLabel2:SKLabelNode!
    public var myLabel3:SKLabelNode!
    public var myLabel4:SKLabelNode!
    public var myLabel5:SKLabelNode!
    
    
    //Сохранение топовой сцены
    func setTopScene(topStage: Int) {
        UserDefaults.standard.set(topStage, forKey: "topStage")
        UserDefaults.standard.synchronize()
        
        print("=======================")
        print("=======================")
        print("=======================")
        print("Был сохранен " + String(topStage))
        print("=======================")
        print("Текущий topScene " + String(topScene))
        print("=======================")
        print("=======================")
        print("=======================")
        
        
    }
    
    //Загрузка топовой сцены
    func getTopScene() -> (Int) {
        print("=======================")
        print("=======================")
        print("=======================")
        print("=======================")
        print("Был загружен " + String(UserDefaults.standard.integer(forKey: "topStage")))
        print("=======================")
        print("=======================")
        print("=======================")
        print("=======================")
        
        return UserDefaults.standard.integer(forKey: "topStage")
    }
    
    
    //Инициализация кнопки стоп
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
    }
    
    //Инициализация текста для разработчиков
    func statusBarInit() {

        myLabel1 = SKLabelNode(fontNamed: "Arial")
        myLabel1.fontSize = 40
        myLabel1.zPosition = 5
        myLabel1.position = CGPoint(x: 70, y: 70)
        myLabel1.name = "MedalLabel"
        self.addChild(myLabel1)

//        myLabel2 = SKLabelNode(fontNamed: "Arial")
//        myLabel2.fontSize = 40
//        myLabel2.zPosition = 999
//        myLabel2.position = CGPoint(x: 300, y: 1760)
//        self.addChild(myLabel2)
//        
//
//        myLabel3 = SKLabelNode(fontNamed: "Arial")
//        myLabel3.fontSize = 40
//        myLabel3.zPosition = 999
//        myLabel3.position = CGPoint(x: 300, y: 1720)
//        self.addChild(myLabel3)
//        
//
//        myLabel4 = SKLabelNode(fontNamed: "Arial")
//        myLabel4.fontSize = 40
//        myLabel4.zPosition = 999
//        myLabel4.position = CGPoint(x: 300, y: 1680)
//        self.addChild(myLabel4)
//        
//        
//        myLabel5 = SKLabelNode(fontNamed: "Arial")
//        myLabel5.fontSize = 30
//        myLabel5.zPosition = 999
//        myLabel5.position = CGPoint(x: 300, y: 1640)
//        self.addChild(myLabel5)
        
    }
    
//    //Изменение текста для разработчиков
    func statusBar() {
        if onPause == false {
            myLabel1.text = String(timer)
            
            for menuBoard in self.children {
                if menuBoard.name == "Medal" {
                    if let menuBoard = menuBoard as? SKSpriteNode {
                        menuBoard.removeAllChildren()
                        menuBoard.removeFromParent()
                    }
                }
            }

            if timer > timeForMedal[thisScene][0] {
                if timer > timeForMedal[thisScene][1] {
                    if timer > timeForMedal[thisScene][2] {
                        if timer <= timeForMedal[thisScene][2] {
                            
                        }
                        else {
                            print("!Ничего")
                            let menuBoard = SKSpriteNode(imageNamed: "WithOutMedal.png")
                            menuBoard.position = CGPoint(x: 70, y: 70)
                            menuBoard.name = "Medal"
                            menuBoard.xScale = 0.25
                            menuBoard.yScale = 0.25
                            menuBoard.zPosition = 4
                            //menuBoard.color = colorPicker(level: thisScene)
                            //menuBoard.colorBlendFactor = CGFloat(0.7)
                            self.addChild(menuBoard)
                        }
                    }
                    else {
                        print("!Бронза")
                        let menuBoard = SKSpriteNode(imageNamed: "BronzeMedal.png")
                        menuBoard.position = CGPoint(x: 70, y: 70)
                        menuBoard.name = "Medal"
                        menuBoard.xScale = 0.25
                        menuBoard.yScale = 0.25
                        menuBoard.zPosition = 4
                        
                        //menuBoard.color = colorPicker(level: thisScene)
                        //menuBoard.colorBlendFactor = CGFloat(0.7)
                        self.addChild(menuBoard)
                    }
                }
                else {
                    print("!Серебро")
                    let menuBoard = SKSpriteNode(imageNamed: "SilverMedal.png")
                    menuBoard.position = CGPoint(x: 70, y: 70)
                    menuBoard.name = "Medal"
                    menuBoard.xScale = 0.25
                    menuBoard.yScale = 0.25
                    menuBoard.zPosition = 4
                    //menuBoard.color = colorPicker(level: thisScene)
                    //menuBoard.colorBlendFactor = CGFloat(0.7)
                    self.addChild(menuBoard)
                }
            }
            else {
                //print("!Золото")
                let menuBoard = SKSpriteNode(imageNamed: "GoldMedal.png")
                menuBoard.position = CGPoint(x: 70, y: 70)
                menuBoard.name = "Medal"
                menuBoard.xScale = 0.25
                menuBoard.yScale = 0.25
                menuBoard.zPosition = 4
                //menuBoard.color = colorPicker(level: thisScene)
                //menuBoard.colorBlendFactor = CGFloat(0.7)
                self.addChild(menuBoard)
            }

        }
        else {
            timer = timer - 1
            myLabel1.text = ""
        }
//       
//        myLabel2.text = "Топовая сцена = "+String(topScene)
//        myLabel3.text = "Текущая сцена = "+String(thisScene)
        //myLabel4.text = "NowScene = "+String(nowScene)
        //myLabel5.text = "ГГ dy = "+String(describing: dy)
        
    }

    //При вызове этой функции, показывается меню проигрыша.
    func showLMenu(){
        onPause = true
        let articleParams = ["Loose lvl": thisScene];
        
        Flurry.logEvent("Loose", withParameters: articleParams)
        Flurry.logEvent("Loose");
        
        let blurEffect =  SKSpriteNode(imageNamed: "blur.png")
        blurEffect.name = "blurEffect"
        blurEffect.zPosition = 10
        blurEffect.size.height = 10000
        blurEffect.size.width = 10000
        self.addChild(blurEffect)
        
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


//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = (view?.bounds)!
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view?.addSubview(blurEffectView)

        
        
        let blurEffect =  SKSpriteNode(imageNamed: "blur.png")
        blurEffect.name = "blurEffect"
        blurEffect.zPosition = 10
        blurEffect.size.height = 10000
        blurEffect.size.width = 10000
        self.addChild(blurEffect)
        
        onPause = true
        let menuBoard = SKSpriteNode(imageNamed: "MenuBoard.png")
        menuBoard.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        menuBoard.name = "menuBoard"
        menuBoard.xScale = 1.4
        menuBoard.yScale = 1.4
        menuBoard.zPosition = 998
        menuBoard.color = colorPicker(level: thisScene)
        menuBoard.colorBlendFactor = CGFloat(0.7)
        self.addChild(menuBoard)
//        self.view?.insertSubview(menuBoard, at: 100)
        
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
        
        
        //Для отладки
        let prevButton = SKSpriteNode(imageNamed: "prevButton.png")
        prevButton.position = CGPoint(x: self.frame.midX - 200, y: self.frame.midY-(self.frame.midY/2))
        prevButton.name = "prev"
        prevButton.xScale = 0.5
        prevButton.yScale = 0.5
        prevButton.zPosition = 999
        prevButton.color = colorPicker(level: thisScene)
        prevButton.colorBlendFactor = CGFloat(1.0)
        self.addChild(prevButton)
        let nextButton = SKSpriteNode(imageNamed: "nextButton.png")
        nextButton.position = CGPoint(x: self.frame.midX + 200, y: self.frame.midY-(self.frame.midY/2))
        nextButton.name = "next"
        nextButton.xScale = 0.5
        nextButton.yScale = 0.5
        nextButton.zPosition = 999
        nextButton.color = colorPicker(level: thisScene)
        nextButton.colorBlendFactor = CGFloat(1.0)
        self.addChild(nextButton)
        var myLabel1:SKLabelNode!
        myLabel1 = SKLabelNode(fontNamed: "Arial")
        myLabel1.name = "label"
        myLabel1.text = "Developer buttons"
        myLabel1.fontSize = 50
        myLabel1.zPosition = 1000
        myLabel1.position = CGPoint(x: self.frame.midX, y: self.frame.midY-(self.frame.midY/2) + 140)
        self.addChild(myLabel1)
        
        
        
        var myLabel:SKLabelNode!
        myLabel = SKLabelNode(fontNamed: "Arial")
        myLabel.name = "label"
        myLabel.text = "Retry"
        myLabel.fontSize = 100
        myLabel.zPosition = 999
        myLabel.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 190)
        self.addChild(myLabel)
        
        
        

    }
    
    
    /// The interstitial ad.
    var interstitial: GADInterstitial!
    
    fileprivate func createAndLoadInterstitial() {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-2270286479492772/1486792443")
        let request = GADRequest()
        // Request test ads on devices you specify. Your test device ID is printed to the console when
        // an ad request is made.
        request.testDevices = [ kGADSimulatorID, "2077ef9a63d2b398840261c8221a0c9a" ]
        interstitial.load(request)
    }
    
//    func alertView(_ alertView: UIAlertView, willDismissWithButtonIndex buttonIndex: Int) {
//        print("Alert ADs")
//        if interstitial.isReady {
//            interstitial.present(fromRootViewController: self.viewController)
//        } else {
//            print("Ad wasn't ready :(")
//        }
//        //playAgainButton.isHidden = false
//    }
    
    func ads() {
        print("Alert ADs")
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self.viewController)
        } else {
            print("Ad wasn't ready :(")
        }
        //playAgainButton.isHidden = false
    }
    //При вызове этой функции, показывается меню выигрыша.
    func showWMenu(){
        onPause = true
        if thisScene == topScene {
            topScene+=1
        }
        
        for menuBoard in self.children {
            if menuBoard.name == "Medal" {
                if let menuBoard = menuBoard as? SKSpriteNode {
                    menuBoard.removeAllChildren()
                    menuBoard.removeFromParent()
                }
            }
        }
        
        for menuBoard in self.children {
            if menuBoard.name == "MedalLabel" {
                if let menuBoard = menuBoard as? SKSpriteNode {
                    menuBoard.removeAllChildren()
                    menuBoard.removeFromParent()
                }
            }
        }
        

        
        let articleParams = ["Win lvl": thisScene];
        
        Flurry.logEvent("Win", withParameters: articleParams)
        Flurry.logEvent("Win");
        
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
        
        initMedal()

    }
    
    func initMedal() {
        let timerWin = timer
        if bestTime > timerWin {
            bestTime = timerWin
        }
        print("Победное время - " + String(timerWin))
        print("Лучшее время - " + String(bestTime))
        
        var flag = false
        if timeForMedal[thisScene][2] < timerWin {
            print("Без медали")
            let menuButtonq = SKSpriteNode(imageNamed: "WithOutMedal.png")
            menuButtonq.position = CGPoint(x: self.frame.midX+(self.frame.midX/2), y: self.frame.midY - 350)
            menuButtonq.name = "medal"
            menuButtonq.xScale = 0.7
            menuButtonq.yScale = 0.7
            menuButtonq.zPosition = 999
            self.addChild(menuButtonq)
            
            flag = true
        }
        
        for index in 0...2 {
            if timeForMedal[thisScene][index] >= timerWin && flag == false  {
                switch index {
                case 0:
                    print("Золото")
                    let menuButtonq = SKSpriteNode(imageNamed: "GoldMedal.png")
                    
                    menuButtonq.position = CGPoint(x: self.frame.midX+(self.frame.midX/2), y: self.frame.midY - 350)
                    menuButtonq.name = "medal"
                    menuButtonq.xScale = 0.7
                    menuButtonq.yScale = 0.7
                    menuButtonq.zPosition = 999
                    self.addChild(menuButtonq)
                    print("0 " + " - " + String(index) + " - " + String(thisScene) + " - " + String(timeForMedal[thisScene][index]))
                    
                    if MedalOnLvl[thisScene] > index {
                        MedalOnLvl[thisScene] = index
                    }



                    flag = true
                    break
                case 1:
                    print("Серебро")
                    let menuButtonq = SKSpriteNode(imageNamed: "SilverMedal.png")
                    menuButtonq.position = CGPoint(x: self.frame.midX+(self.frame.midX/2), y: self.frame.midY - 350)
                    menuButtonq.name = "medal"
                    menuButtonq.xScale = 0.7
                    menuButtonq.yScale = 0.7
                    menuButtonq.zPosition = 999
                    self.addChild(menuButtonq)
                    print("1 " + " - " + String(index) + " - " + String(thisScene) + " - " + String(timeForMedal[thisScene][index]))
                    
                    if MedalOnLvl[thisScene] > index {
                        MedalOnLvl[thisScene] = index
                    }

                    flag = true
                    break
                case 2:
                    print("Бронза")
                    let menuButtonq = SKSpriteNode(imageNamed: "BronzeMedal.png")
                    menuButtonq.position = CGPoint(x: self.frame.midX+(self.frame.midX/2), y: self.frame.midY - 350)
                    menuButtonq.name = "medal"
                    menuButtonq.xScale = 0.7
                    menuButtonq.yScale = 0.7
                    menuButtonq.zPosition = 999
                    self.addChild(menuButtonq)
                    print("2 " + " - " + String(index) + " - " + String(thisScene) + " - " + String(timeForMedal[thisScene][index]))
                    
                    if MedalOnLvl[thisScene] > index {
                        MedalOnLvl[thisScene] = index
                    }

                    flag = true
                    break
                default: break

                }


            }
        }
        if(MedalOnLvl[1] == 0 && MedalOnLvl[2] == 0 && MedalOnLvl[3] == 0 && MedalOnLvl[4] == 0 && skinBoolArr[1] == false){
            skinBoolArr[1] = true
            skinArrSync()
            UIAlertView(title: "Скин", message: "Скин 1 открыт", delegate: self, cancelButtonTitle: "Ок").show()
        }
        
        
        UserDefaults.standard.set(MedalOnLvl, forKey: "MedalOnLvl")
        UserDefaults.standard.synchronize()
    }

    
    
    //При вызове этой функции, удаляется меню в игре.
    func removeMenu(){

        onPause = false
        print("Удаляю МЕНЮ")
        
        
        for menuBoard in self.children {
            if menuBoard.name == "menuBoard" {
                if let menuBoard = menuBoard as? SKSpriteNode {
                    menuBoard.removeAllChildren()
                    menuBoard.removeFromParent()
                }
            }
        }
        
        for blurEffect in self.children {
            if blurEffect.name == "blurEffect" {
                if let blurEffect = blurEffect as? SKSpriteNode {
                    blurEffect.removeAllChildren()
                    blurEffect.removeFromParent()
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
       //self.view!.isPaused = false
    }

    
    
    
    //Ициализация свойств игровых объектов
    func initGameObject(){

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
                    main.physicsBody?.fieldBitMask = 4

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
                    
//    ground.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ground.size.width, height: ground.size.height))
                    
                    let spearBlockTexture = SKTexture(imageNamed: "SpearBlock.png")
                    spearBlock.physicsBody  = SKPhysicsBody(texture: spearBlockTexture, size: CGSize(width: spearBlock.size.width, height: spearBlock.size.height))
                    
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
                    slimeBlock.physicsBody?.fieldBitMask = 4
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
                    woodenBox.physicsBody?.fieldBitMask = 4
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
                    woodenPlank.physicsBody?.fieldBitMask = 4
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
                    stoneBlock.physicsBody?.fieldBitMask = 4
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
                    activeBlock.physicsBody?.fieldBitMask = 4
                    
                    //Особые характеристики
                    activeBlock.physicsBody?.pinned = true
                    activeBlock.physicsBody?.isDynamic = false
                }
            }
        }
        
        //  Инициализация Iron
        for activeBlock in self.children {
            if activeBlock.name == "IronBlock" {
                if let activeBlock = activeBlock as? SKSpriteNode {
                    activeBlock.physicsBody?.friction = 0.3
                    activeBlock.physicsBody?.restitution = 0.3
                    activeBlock.physicsBody?.linearDamping = 0.4
                    activeBlock.physicsBody?.angularDamping = 0.4
                    activeBlock.physicsBody?.mass = 3.0
                    activeBlock.physicsBody?.fieldBitMask = 3
                }
            }
        }
        
        //  Инициализация Magnit
        for activeBlock in self.children {
            if activeBlock.name == "Magnit" {
                if let activeBlock = activeBlock as? SKSpriteNode {
                    activeBlock.physicsBody?.friction = 0.3
                    activeBlock.physicsBody?.restitution = 0.3
                    activeBlock.physicsBody?.linearDamping = 0.4
                    activeBlock.physicsBody?.angularDamping = 0.4
                    activeBlock.physicsBody?.mass = 2.9
                    //activeBlock.physicsBody?.fieldBitMask = 3
                }
            }
        }
        
        //  Инициализация GravityBlock
        for activeBlock in self.children {
            if activeBlock.name == "GravityBlock" {
                if let activeBlock = activeBlock as? SKSpriteNode {
                    activeBlock.physicsBody?.friction = 0.3
                    activeBlock.physicsBody?.restitution = 0.3
                    activeBlock.physicsBody?.linearDamping = 0.4
                    activeBlock.physicsBody?.angularDamping = 0.4
                    activeBlock.physicsBody?.mass = 2.9
                    activeBlock.physicsBody?.fieldBitMask = 4
                }
            }
        }
        
        
        //  Инициализация RotationBlock
        for activeBlock in self.children {
            if activeBlock.name == "RotationBlock" {
                if let activeBlock = activeBlock as? SKSpriteNode {


                    
                    activeBlock.physicsBody?.friction = 0.3
                    activeBlock.physicsBody?.restitution = 0.3
                    activeBlock.physicsBody?.linearDamping = 0.4
                    activeBlock.physicsBody?.angularDamping = 0.4
                    activeBlock.physicsBody?.mass = 2.9
                    activeBlock.physicsBody?.fieldBitMask = 4
                    activeBlock.zRotation = 1.57079637050629
                    activeBlock.physicsBody?.pinned = true
                    activeBlock.physicsBody?.isDynamic = false

                    //activeBlock.physicsBody?.allowsRotation = false
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


        
        
        //Определение макс уровня, до которого дошел игрок
        if thisScene >= topScene {
            topScene = thisScene
            setTopScene(topStage: topScene)
        }
        
        //Если текущая сцена больше либо равна актуальной, то в меню
        if (topActualScene + 1) <= thisScene {
            thisScene = 1

            let currentScene = GameScene(fileNamed: "Level 1")
            let transition = SKTransition.doorway(withDuration: 0.5)
            currentScene!.scaleMode = SKSceneScaleMode.aspectFill
            currentScene?.viewController = self.viewController
            self.scene!.view?.presentScene(currentScene!, transition: transition)
        }
        
        self.physicsWorld.contactDelegate = self
        

        
        //Инициализация Экрана нового блока
        initNewBlockScreen()
        

        
        
//        if (thisScene == 39){
//            let thirdSeven = self.childNode(withName: "GravityBlock") as? SKSpriteNode
//            let gravity = self.childNode(withName: "Gravity") as? SKFieldNode
//            thirdSeven?.physicsBody?.mass = 3.0
//            gravity?.isEnabled = true
//            gravity?.strength = 30
//        }
        
        let node = self.childNode(withName: "MainCharacter")! as SKNode
        timer = 0
        let wait = SKAction.wait(forDuration: 1.0)
        let run = SKAction.run {
            timer = timer + 1
            print("Time - " + String(timer))
            if thisScene > 0 {
                self.statusBar()
            }

        }
        node.run(SKAction.repeatForever(SKAction.sequence([wait, run])))
        
        createAndLoadInterstitial()
        onPause = false
        if thisScene > 0 {
            statusBar()
        }
        
        skinArrSync()


    }
    
    
    
    
    //Вызывается когда просиходит нажатие
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        // Цикл считывающий нажатие на экран
        for touch: AnyObject in touches {
            

            
            //Удаление блока при нажатии
            let touchLocation = touch.location(in: self)
            let touchedNode = self.atPoint(touchLocation)
            let touch = touches
            let location = touch.first!.location(in: self)
            let node = self.atPoint(location)
            
            if touchedNode.name == "SlimeBlock" {
                skinCondArr[4] = skinCondArr[4] + 1
                if skinCondArr[4] == 250 {
                    skinBoolArr[4] = true
                    skinArrSync()
                    UIAlertView(title: "Скин", message: "Скин 4 открыт", delegate: self, cancelButtonTitle: "Ок").show()
                }
            }
            
            
            
            if  (
                touchedNode.name == "WoodenBox"
                || touchedNode.name == "WoodenPlank"
                || touchedNode.name == "SlimeBlock"
                || touchedNode.name == "GlassBlock"
                )
            {
                

                //Удаление
                touchedNode.removeFromParent()


                
                skinCondArr[2] = skinCondArr[2] + 1
                if skinCondArr[2] == 500 {
                    skinBoolArr[2] = true
                    skinArrSync()
                    UIAlertView(title: "Скин", message: "Скин 2 открыт", delegate: self, cancelButtonTitle: "Ок").show()
                }
                
                skinCondArr[3] = skinCondArr[3] + 1
                if skinCondArr[3] == 1500 {
                    skinBoolArr[3] = true
                    skinArrSync()
                    UIAlertView(title: "Скин", message: "Скин 3 открыт", delegate: self, cancelButtonTitle: "Ок").show()
                }
                
                print(skinCondArr)

            }
            


    

            //Механика Волл блока
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
            
            
            //Механика Актив блока
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
            
            
            //Механика Гравити блока
            if let spriteNode = touchedNode as? SKSpriteNode {
                if spriteNode.name == "GravityBlock"{
                    let gravity = self.childNode(withName: "Gravity") as? SKFieldNode
                    if (spriteNode.physicsBody?.mass == 3.0){
                        
                        spriteNode.physicsBody?.mass = 2.9
                        print("STOP")
                        let m5 = SKTexture(imageNamed: "GravityBlock_Off")
                        let animation = SKAction.animate(with: [m5], timePerFrame: 10)
                        
                        spriteNode.run(SKAction.repeatForever(animation))
                        spriteNode.texture = SKTexture(imageNamed: "GravityBlock_Off")

                        gravity?.isEnabled = false
                    }
                    else{
                        
                        spriteNode.physicsBody?.mass = 3.0
                        print("START")

                        let m1 = SKTexture(imageNamed: "GravityBlock_On1")
                        let m2 = SKTexture(imageNamed: "GravityBlock_On2")
                        let m3 = SKTexture(imageNamed: "GravityBlock_On3")
                        let m4 = SKTexture(imageNamed: "GravityBlock_On4")
                        
                        let textures = [m1, m2, m3, m4]
                        let animation = SKAction.animate(with: textures, timePerFrame: 0.1)
                        
                        spriteNode.run(SKAction.repeatForever(animation))

                        gravity?.isEnabled = true
                    }
                }
            }
            
            
            //Механика Магнита блока
            if let spriteNode = touchedNode as? SKSpriteNode {
                if spriteNode.name == "Magnit"{
                    let gravity = self.childNode(withName: "MagnitGravity") as? SKFieldNode
                    if (spriteNode.physicsBody?.mass == 3.0){
                        // OFF
                        spriteNode.texture = SKTexture(imageNamed: "Magnit_Off")
                        spriteNode.physicsBody?.mass = 2.9
                        gravity?.isEnabled = false
                    }
                    else{
                        
                        //ON
                        spriteNode.texture = SKTexture(imageNamed: "Magnit_On")
                        spriteNode.physicsBody?.mass = 3.0
                        gravity?.isEnabled = true
                    }
                }
            }
            

            //Механика Каменного блока
            if let spriteNode = touchedNode as? SKSpriteNode {
                if spriteNode.name == "StoneBlock"{
                    if spriteNode.physicsBody?.mass == 10.0 {
                        spriteNode.texture = SKTexture(imageNamed: "BrokenStoneBlock")
                        spriteNode.physicsBody?.mass = 9.0
                    }
                    else{
                        //saveStat(info: "destroy")
                        spriteNode.removeFromParent()
                    }
                }
            }
            
            
            //Механика Поворотного блока
            if let spriteNode = touchedNode as? SKSpriteNode {
                if spriteNode.name == "RotationBlock"{
                    spriteNode.physicsBody?.isDynamic = true
                    spriteNode.zRotation = spriteNode.zRotation - CGFloat(M_PI/8.0)
                    spriteNode.physicsBody?.isDynamic = false
                    //print(spriteNode.zRotation)
                }
            }
            
            //Блок кода для обработки кнопок меню
            if node.name == "retry" {
                
                
                let articleParams = ["Retry lvl": thisScene];
                
                Flurry.logEvent("Retry level", withParameters: articleParams)



                if AdCounter == 300000 {

                    //UIAlertView(title: "Реклама", message: "Сейчас должен быть баннер Admob", delegate: self, cancelButtonTitle: "Ок").show()
                    ads()
                    AdCounter = 0
                }
                else {
                    print("Время еще не пришло")

                    AdCounter += 1
                    let currentScene = GameScene(fileNamed: "Level "+String(thisScene))
                    let transition = SKTransition.doorsCloseHorizontal(withDuration: 0.5)
                    currentScene!.scaleMode = SKSceneScaleMode.aspectFill
                    currentScene?.viewController = self.viewController
                    self.scene!.view?.presentScene(currentScene!, transition: transition)

                }



            }
            
            if node.name == "next" {
                
                
                let articleParams = ["This lvl": thisScene, "Next lvl": thisScene+1];
                
                Flurry.logEvent("Next Level", withParameters: articleParams)

                thisScene+=1
                let currentScene = GameScene(fileNamed: "Level "+String(thisScene))
                let transition = SKTransition.doorway(withDuration: 0.5)
                currentScene!.scaleMode = SKSceneScaleMode.aspectFill
                currentScene?.viewController = self.viewController
                self.scene!.view?.presentScene(currentScene!, transition: transition)
            }
            
            if node.name == "prev" {
                thisScene-=1
                if thisScene == 0 {
                    thisScene = topActualScene
                    let currentScene = GameScene(fileNamed: "Level "+String(topActualScene))
                    let transition = SKTransition.doorway(withDuration: 0.5)
                    currentScene!.scaleMode = SKSceneScaleMode.aspectFill
                    currentScene?.viewController = self.viewController
                    self.scene!.view?.presentScene(currentScene!, transition: transition)
                }
                else {
                    let currentScene = GameScene(fileNamed: "Level "+String(thisScene))
                    let transition = SKTransition.doorway(withDuration: 0.5)
                    currentScene!.scaleMode = SKSceneScaleMode.aspectFill
                    currentScene?.viewController = self.viewController
                    self.scene!.view?.presentScene(currentScene!, transition: transition)
                }
            }
            
            if node.name == "menu" {
                //Просто создал Segue и задал ей имя, с помощью имени ищем Segue и переходим
                self.viewController.performSegue(withIdentifier: "GoToMainMenu", sender: self)
                
                //Удаляем все говно со сцены, чтобы при новом открытии фпс норм были
                self.scene!.removeFromParent()
                
                //Не работали кнопки в игровом меню из-за того, что не было строчки ниже
                self.scene!.view?.removeFromSuperview()
                
                self.removeFromParent()
                self.removeAllActions()
                self.removeAllChildren()
                
            }
            
            if touchedNode.name == "stop" {
                if showMenu == true {
                    showMenu = false
                    removeMenu()
                }
                else {
                    showMenu = true
                    showRMenu()
                }
            }
            
            if node.name == "button" {
                itsNewBlock = true
                thisScene = topScene
                let currentScene = GameScene(fileNamed: "Level "+String(topScene))
                let transition = SKTransition.doorway(withDuration: 0.5)
                currentScene!.scaleMode = SKSceneScaleMode.aspectFill
                currentScene?.viewController = self.viewController
                self.scene!.view?.presentScene(currentScene!, transition: transition)
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
                if ((allObject.position.y < 0 || allObject.position.x < -100 || allObject.position.x > 1380) && allObject.name != "MainCharacter") {
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
                            progressBar.size.width = CGFloat(onGroundTime) * (39 / 2)
                            progressBar.color = UIColor.green
                        }
                    }
                }
            
            

                //Если свинья на земле и время которое она пролежала на земле равно 100, то победа
                if onGroundTime > 200 && showMenu == false {
                    showMenu = true //если показывали меню, то true
                    
                    if (getTopScene() < (thisScene+1)){
                        setTopScene(topStage: (thisScene+1))
                    }

                    showWMenu() //Показать меню выигрыша
                    mainChrctr?.physicsBody?.pinned = true
                    mainChrctr?.physicsBody?.allowsRotation = false
                }
            
            }
        }
        
        
        

        
        if showMenu == false {
            
            //ПЕРЕМЕННАЯ ДЛЯ ОТЛАДКИ
            //dy = (mainChrctr?.physicsBody?.velocity.dy)!
            
            //velocity > 0 - перс отлетает от поверхности, velocity < 0 персонаж летит вниз. Состояние покоя около 5.5


            if ((mainChrctr?.physicsBody?.velocity.dy)! > CGFloat(400.0) || (mainChrctr?.physicsBody?.velocity.dy)! < CGFloat(-400.0)) {
                mainChrctr?.texture = SKTexture(imageNamed:"MainCharacter_scare" + String(indexCharacterTexture))
            }
            else {
                if((mainChrctr?.physicsBody?.velocity.dy)! >= CGFloat(10.0)) {
                    mainChrctr?.texture = SKTexture(imageNamed: "MainCharacter_pain" + String(indexCharacterTexture))
                }
                else{
                    mainChrctr?.texture = SKTexture(imageNamed:"MainCharacter" + String(indexCharacterTexture))
                    
                }
            }
        }
    

        //если ГГ улетел за сцену, показываем меню
        if mainChrctr?.position.y < 0 && showMenu == false {
            //saveStat(info: "lose")
            showMenu = true //если показывали меню, то true
            showLMenu() //Показать меню проигрыша
            onGround = false //Свинья не на земле(за экраном она не может определить это)
        }
        
        //statusBar()
    }

    
    

    
}
