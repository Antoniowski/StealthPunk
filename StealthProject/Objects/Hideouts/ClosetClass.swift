//
//  ClosetClass.swift
//  StealthProject
//
//  Created by Antonio Romano on 10/05/22.
//

import Foundation
import SpriteKit

class Closet: Hideout{
    var openCloset: SKTexture = SKTexture()
    init(){
        super.init(texture: SKTexture(imageNamed: "closet"), highlighted: SKTexture(imageNamed: "closetBordo"), color: .clear, size: CGSize(width: blocco, height: blocco), type: .HIDEOUT)
        self.setHideoutCategory(.CLOSET)
        self.setName("Closet")
        self.openCloset = SKTexture(imageNamed: "ClosetOpen")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func action() {
        self.run(.sequence([.setTexture(openCloset),.playSoundFileNamed("openCabinet", waitForCompletion: true), .setTexture(baseTexture), .playSoundFileNamed("closeCabinet", waitForCompletion: true)]))
    }
}
