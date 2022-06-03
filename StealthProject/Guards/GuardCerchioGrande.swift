//
//  GuardCerchioGrande.swift
//  StealthProject
//
//  Created by Salvatore Manna on 01/06/22.
//

import Foundation
import SpriteKit


class GuardCerchioGrande: Guard{
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size, strength: 3, speed: 150, visionConeRadius: 150, visionConeAngle: 360)
        setAnimationsArray()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setAnimationsArray(){
        self.frontTexture = SKTexture(imageNamed: "CerchioGrandeFrontF2")
        self.backTexture = SKTexture(imageNamed: "CerchioGrandeBackF2")
        self.sideLTexture = SKTexture(imageNamed: "CerchioGrandeSideF1")
        self.sideRTexture = SKTexture(imageNamed: "CerchioGrandeSideF3")
        self.halfBackLTexture = SKTexture(imageNamed: "CerchioGrandeBackF2")
        self.halfBackRTexture = SKTexture(imageNamed: "CerchioGrandeBackF2")
        self.halfFrontRTexture = SKTexture(imageNamed: "CerchioGrandeBackF2")
        self.halfFrontLTexture = SKTexture(imageNamed: "CerchioGrandeBackF2")
        
        self.walkingAnimationFront = [SKTexture(imageNamed: "CerchioGrandeFrontF1"), SKTexture(imageNamed: "CerchioGrandeFrontF2")]
        self.walkingAnimationBack = [SKTexture(imageNamed: "CerchioGrandeFrontF1"), SKTexture(imageNamed: "CerchioGrandeFrontF2")]
        self.walkingAnimationLeft = [SKTexture(imageNamed: "CerchioGrandeFrontF1"), SKTexture(imageNamed:"CerchioGrandeFrontF2")]
        self.walkingAnimationRight = [SKTexture(imageNamed: "CerchioGrandeFrontF1"), SKTexture(imageNamed:"CerchioGrandeFrontF2")]
        self.walkingAnimationBackLeft = [SKTexture(imageNamed: "CerchioGrandeFrontF1"), SKTexture(imageNamed:"CerchioGrandeFrontF2")]
        self.walkingAnimationBackRight = [SKTexture(imageNamed: "CerchioGrandeFrontF1"), SKTexture(imageNamed:"CerchioGrandeFrontF2")]
        self.walkingAnimationFrontRight = [SKTexture(imageNamed: "CerchioGrandeFrontF1"), SKTexture(imageNamed:"CerchioGrandeFrontF2")]
        self.walkingAnimationFrontLeft = [SKTexture(imageNamed: "CerchioGrandeFrontF1"), SKTexture(imageNamed:"CerchioGrandeFrontF2")]
        
        self.stunnedAnimation = [SKTexture(imageNamed: "CerchioGrandeMortoF1"), SKTexture(imageNamed: "CerchioGrandeMortoF2"), SKTexture(imageNamed: "CerchioGrandeMortoF3")]
    }
}
