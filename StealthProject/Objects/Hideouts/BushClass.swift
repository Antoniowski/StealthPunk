//
//  BushClass.swift
//  StealthProject
//
//  Created by Antonio Romano on 20/05/22.
//

import Foundation
import SpriteKit

class Bush: Hideout{
    var openBush: SKTexture = SKTexture()
    init(){
        super.init(texture: SKTexture(imageNamed: "cespuglio"), highlighted: SKTexture(imageNamed: "cespuglioBlur"), color: .clear, size: CGSize(width: blocco, height: blocco), type: .HIDEOUT)
        self.setHideoutCategory(.BUSH)
        self.setName("Bush")
        self.openBush = SKTexture(imageNamed: "cespuglioAperto")
        self.normalTexture = SKTexture(imageNamed: "cespuglio normal map")
        self.physicsBody = SKPhysicsBody(rectangleOf: .init(width: Double(blocco)/1.5, height: Double(blocco)/2.5), center: .init(x: 0, y: Double(blocco)/4))
        self.physicsBody?.isDynamic = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.affectedByGravity = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func action() {
        self.run(.sequence([.setTexture(openBush), .playSoundFileNamed("BushEnter", waitForCompletion: true), .setTexture(baseTexture)]))
    }
}
