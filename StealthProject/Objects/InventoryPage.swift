//
//  InventoryPage.swift
//  StealthProject
//
//  Created by Martina Ottaviano on 01/06/22.
//

import Foundation
import SpriteKit

class InventoryPage: SKNode{
    private let backgroundImage: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed:"menu_Frame"), size: .init(width: UIScreen.main.bounds.width*0.75, height: UIScreen.main.bounds.height*0.75))
    private let backgroundElements: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed:"MenuGear"), size: .init(width: UIScreen.main.bounds.width*0.75, height: UIScreen.main.bounds.height*0.75))
    var nome: SKLabelNode = SKLabelNode()
    var forza: SKLabelNode = SKLabelNode()
    var velocita: SKLabelNode = SKLabelNode()
    var rumore: SKLabelNode = SKLabelNode()
    var testo: SKLabelNode = SKLabelNode()
    
    override init() {
        super.init()
        
        
        
        addChild(backgroundImage)
        addChild(backgroundElements)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


