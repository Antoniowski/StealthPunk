//
//  GuardConoGrande.swift
//  StealthProject
//
//  Created by Salvatore Manna on 16/05/22.
//

import Foundation
import SpriteKit


class GuardConoGrande: Guard{
    
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size, strength: 3, speed: 5, visionConeRadius: 200, visionConeAngle: 60)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setAnimationsArray(){
        self.frontTexture = SKTexture(imageNamed: "ConoGrandeFrontF2")
        self.backTexture = SKTexture(imageNamed: "ConoGrandeBackF2")
        self.sideLTexture = SKTexture(imageNamed: "ConoGrandeSideF2")
        self.sideRTexture = SKTexture(imageNamed: "boySideR")
        self.halfBackLTexture = SKTexture(imageNamed: "boyHalfBackL")
        self.halfBackRTexture = SKTexture(imageNamed: "boyHalfBackR")
        self.halfFrontRTexture = SKTexture(imageNamed: "boyHalfFrontR")
        self.halfFrontLTexture = SKTexture(imageNamed: "boyHalfFrontL")
        
        self.walkingAnimationRight = [SKTexture(imageNamed: "boyWalk1"), SKTexture(imageNamed:"boyWalk2"), SKTexture(imageNamed:"boyWalk3"), SKTexture(imageNamed:"boyWalk4"), SKTexture(imageNamed:"boyWalk5"), SKTexture(imageNamed:"boyWalk6"), SKTexture(imageNamed:"boyWalk7"), SKTexture(imageNamed:"boyWalk8")]
        self.walkingAnimationFront = [SKTexture(imageNamed: "boyFrontWalk1"), SKTexture(imageNamed: "boyFrontWalk2"), SKTexture(imageNamed: "boyFrontWalk3"), SKTexture(imageNamed: "boyFrontWalk4")]
        self.walkingAnimationLeft = [SKTexture(imageNamed: "boyWalkLeft1"), SKTexture(imageNamed:"boyWalkLeft2"), SKTexture(imageNamed:"boyWalkLeft3"), SKTexture(imageNamed:"boyWalkLeft4"), SKTexture(imageNamed:"boyWalkLeft5"), SKTexture(imageNamed:"boyWalkLeft6"), SKTexture(imageNamed:"boyWalkLeft7"), SKTexture(imageNamed:"boyWalkLeft8")]
        self.walkingAnimationBack = [SKTexture(imageNamed: "boyBackWalk1"), SKTexture(imageNamed: "boyBackWalk2"), SKTexture(imageNamed: "boyBackWalk3"), SKTexture(imageNamed: "boyBackWalk4")]
        
    }
}
