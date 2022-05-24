//
//  File.swift
//  StealthProject
//
//  Created by Antonio Romano on 20/05/22.
//

import Foundation
import SpriteKit

class Vetrina: Hideout{
    var open: SKTexture = SKTexture()
    init(){
        super.init(texture: SKTexture(imageNamed: "vetrinaChiusa"), highlighted: SKTexture(imageNamed: "vetrinaBlur"), color: .clear, size: CGSize(width: blocco, height: blocco), type: .HIDEOUT)
        self.setHideoutCategory(.VETRINA)
        self.setName("Vetrina")
        self.open = SKTexture(imageNamed: "vetrinaAperta")
        self.physicsBody = SKPhysicsBody(rectangleOf: .init(width: Double(blocco)/2, height: Double(blocco)/2.5), center: .init(x: 0, y: Double(blocco)/3))
        self.physicsBody?.isDynamic = false
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func action() {
        self.run(.sequence([.setTexture(open), .wait(forDuration: 0.8), .setTexture(baseTexture)]))
    }
}
