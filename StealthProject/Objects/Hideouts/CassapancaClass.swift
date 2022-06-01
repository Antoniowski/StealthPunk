//
//  CassapancaClass.swift
//  StealthProject
//
//  Created by Antonio Romano on 20/05/22.
//

import Foundation
import SpriteKit

class Cassapanca: Hideout{
    var open: SKTexture = SKTexture()
    init(){
        super.init(texture: SKTexture(imageNamed: "cassapancaChiusa"), highlighted: SKTexture(imageNamed: "cassapancaBlur"), color: .clear, size: CGSize(width: blocco, height: blocco), type: .HIDEOUT)
        self.setHideoutCategory(.PANCA)
        self.setName("Cassapanca")
        self.open = SKTexture(imageNamed: "cassapancaAperta")
        self.physicsBody = SKPhysicsBody(rectangleOf: .init(width: Double(blocco)*0.9, height: Double(blocco)/3), center: .init(x: 0, y: 0))
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.allowsRotation = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func action() {
        self.run(.sequence([.setTexture(open), .run {
            music.starsSound(filenamed: music.panca)
        }, .wait(forDuration: 1),
        .setTexture(baseTexture), .run {
            music.starsSound(filenamed: music.cabinetClose)
        }]))
    }
}
