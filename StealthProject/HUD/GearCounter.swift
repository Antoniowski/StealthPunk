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
//    private var border: SKSpriteNode = SKSpriteNode()
    private var border: SKShapeNode = SKShapeNode(rect: .init(x: 0, y: 0, width: 200, height: 75), cornerRadius: 30)
    private var image: SKSpriteNode = SKSpriteNode(imageNamed: "ingranaggio")
    private var etichetta: SKLabelNode = SKLabelNode()
    
    override init(){
        super.init()
        border.zPosition = 1000
        border.fillColor = .init(white: 1, alpha: 0.5)
        image.zPosition = 1000
        image.position = CGPoint (x: 50, y: 37.5)
        image.size = CGSize (width: 50, height: 50)
        etichetta.zPosition = 1000
        etichetta.position = CGPoint (x: 130, y: 20)
        etichetta.text = "x \(number)"
        etichetta.fontSize = 50
        etichetta.fontColor = .black
        
        addChild(border)
        addChild(image)
        addChild(etichetta)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
