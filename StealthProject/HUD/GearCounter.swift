//
//  GearCounter.swift
//  StealthProject
//
//  Created by Martina Ottaviano on 17/05/22.
//

import Foundation
import SwiftUI
import SpriteKit

class Counter: SKNode{
    var number: Int = 0
    private var border: SKSpriteNode = SKSpriteNode(imageNamed: "frameFill")
    private var image: SKSpriteNode = SKSpriteNode(imageNamed: "ingranaggio")
    var etichetta: SKLabelNode = SKLabelNode()
    
    override init(){
        super.init()
        border.zPosition = 1000
        border.size = CGSize (width: 200, height: 75)
        border.position = CGPoint(x: 100, y: 38)
        image.zPosition = 1001
        image.position = CGPoint (x: 50, y: 37.5)
        image.size = CGSize (width: 50, height: 50)
        image.run(.repeatForever(.rotate(byAngle: pi, duration: 4)))
        etichetta.zPosition = 1001
        etichetta.position = CGPoint (x: 130, y: 25)
        etichetta.text = "x \(number)"
        etichetta.fontSize = 40
        etichetta.fontName = "Victorian Parlor Vintage Alternate_free"
        etichetta.fontColor = .white
        addChild(border)
        addChild(image)
        addChild(etichetta)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
