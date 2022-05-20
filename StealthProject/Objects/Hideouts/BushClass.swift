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
        self.openBush = SKTexture(imageNamed: "cespuglio")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func action() {
        self.run(.sequence([.setTexture(openBush), .wait(forDuration: 0.8), .setTexture(baseTexture)]))
    }
}
