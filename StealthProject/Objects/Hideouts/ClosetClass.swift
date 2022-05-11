//
//  ClosetClass.swift
//  StealthProject
//
//  Created by Antonio Romano on 10/05/22.
//

import Foundation
import SpriteKit

class Closet: Hideout{
    init(){
        super.init(texture: SKTexture(imageNamed: "closet"), highlighted: SKTexture(imageNamed: "closetFocused"), color: .clear, size: CGSize(width: blocco, height: blocco), type: .HIDEOUT)
        self.setHideoutCategory(.CLOSET)
        self.setName("Closet")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
