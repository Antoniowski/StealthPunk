//
//  CharacterBox.swift
//  StealthProject
//
//  Created by Martina Ottaviano on 27/05/22.
//

import Foundation
import SwiftUI
import SpriteKit

class Counter2: SKNode {
    private var border: SKSpriteNode = SKSpriteNode(imageNamed: "frameFill")
    var nome: SKLabelNode = SKLabelNode()
    var forza: SKLabelNode = SKLabelNode()
    var velocita: SKLabelNode = SKLabelNode()
    var rumore: SKLabelNode = SKLabelNode()
    var testo: SKLabelNode = SKLabelNode()
    var moveBox: Bool = false
    
    
    override init() {
        super.init()
        border.zPosition = 1000
        border.size = CGSize (width: 400, height: 100)
        border.position = CGPoint(x: 0, y: 0)
        nome.zPosition = 1001
        nome.position = CGPoint (x: -90, y: 50)
        nome.text = "Char Name"
        nome.fontSize = 40
        nome.fontName = "Victorian Parlor Vintage Alternate_free"
        nome.fontColor = .white
        
        forza.zPosition = 1001
        forza.position = CGPoint (x: 0, y: 10)
        forza.text = "strenght: 0/0"
        forza.fontSize = 40
        forza.fontName = "Victorian Parlor Vintage Alternate_free"
        forza.fontColor = .white
        
        velocita.zPosition = 1001
        velocita.position = CGPoint (x: -90, y: -30)
        velocita.text = "speed: 0/0"
        velocita.fontSize = 40
        velocita.fontName = "Victorian Parlor Vintage Alternate_free"
        velocita.fontColor = .white
        
        rumore.zPosition = 1001
        rumore.position = CGPoint (x: 90, y: -30)
        rumore.text = "noise: 0/0"
        rumore.fontSize = 40
        rumore.fontName = "Victorian Parlor Vintage Alternate_free"
        rumore.fontColor = .white
        
        addChild(border)
        addChild(nome)
        addChild(forza)
        addChild(velocita)
        addChild(rumore)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
