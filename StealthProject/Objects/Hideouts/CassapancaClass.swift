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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func action() {
        self.run(.sequence([.setTexture(open), .wait(forDuration: 0.8), .setTexture(baseTexture)]))
    }
}
