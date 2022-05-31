//
//  ObjectBox.swift
//  StealthProject
//
//  Created by Antonio Romano on 31/05/22.
//

import Foundation
import SwiftUI
import SpriteKit

class ObjectBox: SKNode{
    private var border: SKSpriteNode = SKSpriteNode(imageNamed: "frameFill")
    var image: SKSpriteNode = SKSpriteNode()
    var etichetta: SKLabelNode = SKLabelNode()
    var etichettaDesc: SKLabelNode = SKLabelNode()
    
    init(_ object: Collectible){
        super.init()
        border.zPosition = 1000
        border.size = CGSize (width: 250, height: 100)
        border.position = CGPoint(x: 100, y: 38)
        image.zPosition = 1001
        image.run(.setTexture(object.texture!))
        image.size = CGSize(width: 50, height: 50)
        image.position = CGPoint (x: 15, y: 37.5)
        etichetta.text = object.getItemName()
        etichetta.zPosition = 1001
        etichetta.position = CGPoint (x: 110, y: 45)
        etichetta.fontSize = 35
        etichetta.fontName = "Victorian Parlor Vintage Alternate_free"
        etichetta.fontColor = .white
        etichettaDesc.text = object.getItemDescription()
        etichettaDesc.zPosition = 1001
        etichettaDesc.position = .init(x: 110, y: 15)
        etichettaDesc.fontSize = 30
        etichettaDesc.fontName = "Victorian Parlor Vintage Alternate_free"
        addChild(border)
        addChild(image)
        addChild(etichetta)
        addChild(etichettaDesc)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
