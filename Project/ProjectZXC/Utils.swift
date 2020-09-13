//
//  Utils.swift
//  ProjectZXC
//
//  Created by bn on 13.09.2020.
//  Copyright © 2020 Женя. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class GameButton {
    
    enum ButtonPosition {
        
        case left
        
        case middle
        
        case right
        
        func getPosition(by frame: CGRect) -> CGPoint {
            switch self {
            case .left:
                return CGPoint(x: frame.midX / 2, y: frame.midY - 50)
            case .middle:
                return CGPoint(x: frame.midX, y: frame.midY - 50)
            case .right:
                return CGPoint(x: frame.midX + (frame.midX / 2), y: frame.midY - 50)
            }
        }
    }
    
    enum ButtonAsset: String, CaseIterable {
        
        case nextButton = "nextButton.png"
        
        case retryButton = "retryButton.png"
        
        case menyButton = "menuButton.png"
        
        case prevButton = "prevButton.png"
        
        var name: String {
            return self.rawValue
        }
        
        var texture: SKTexture {
            let placeholder = #imageLiteral(resourceName: "Magnit_Off")
            let image = UIImage(named: name)
            return SKTexture(image: image ?? placeholder)
        }
    }
    
    static func create(asset: ButtonAsset, position: ButtonPosition, frame: CGRect, color: UIColor) -> SKSpriteNode {
        let button = SKSpriteNode()
        button.texture = asset.texture
        button.position = position.getPosition(by: frame)
        button.name = asset.name
        button.size = CGSize(width: 260, height: 260)
        button.zPosition = 2000
        button.colorBlendFactor = 1
        button.color = color
        
        return button
    }    
}

class GameLabel {
    
    static func create(text: String, color: UIColor, fontSize: CGFloat, position: CGPoint, id: String? = nil) -> SKLabelNode {
        let labelNode = SKLabelNode(text: text)
        labelNode.name = id ?? UUID().uuidString
        labelNode.text = text
        labelNode.fontName  = "AvenirNext-Bold"
        labelNode.fontSize = fontSize
        labelNode.zPosition = 2000
        labelNode.position = position
        labelNode.fontColor = color
        
        return labelNode
    }
}

class GameBoard {
    
    static func create(frame: CGRect, color: UIColor) -> SKSpriteNode {
        let menuBoard = SKSpriteNode(imageNamed: "MenuBoard.png")
        menuBoard.position = CGPoint(x: frame.midX, y: frame.midY)
        menuBoard.name = "menuBoard"
        menuBoard.xScale = 1.4
        menuBoard.yScale = 1.4
        menuBoard.zPosition = 998
        menuBoard.color = color
        menuBoard.colorBlendFactor = CGFloat(0.7)
        
        return menuBoard
    }
}
