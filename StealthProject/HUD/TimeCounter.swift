//
//  TimeCounter.swift
//  StealthProject
//
//  Created by Antonio Romano on 26/05/22.
//

import Foundation
import SpriteKit

var MINUTE: Int = 10
var SECONDS: Int = 60

class TimeCounter: SKNode{
    private var border: SKSpriteNode = SKSpriteNode(imageNamed: "frameFill")
    var etichetta: SKLabelNode = SKLabelNode()
    
    override init() {
        super.init()
        border.zPosition = 1000
        border.size = CGSize (width: 200, height: 75)
        border.position = CGPoint(x: 100, y: 38)
        etichetta.zPosition = 1001
        etichetta.position = CGPoint (x: 100, y: 25)
        etichetta.text = "10:00"
        etichetta.fontSize = 40
        etichetta.fontName = "Victorian Parlor Vintage Alternate_free"
        etichetta.fontColor = .white
        addChild(border)
        addChild(etichetta)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
