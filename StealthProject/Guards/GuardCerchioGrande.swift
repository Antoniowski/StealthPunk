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
        
        self.currentIdleDirectionTexture = self.backTexture
        
        self.walkingAnimationFront = [SKTexture(imageNamed: "CerchioGrandeFrontF1"), SKTexture(imageNamed: "CerchioGrandeFrontF2"),
                                      SKTexture(imageNamed: "CerchioGrandeFrontF3"), SKTexture(imageNamed: "CerchioGrandeFrontF4")]
        self.walkingAnimationBack = [SKTexture(imageNamed: "CerchioGrandeFrontF1"), SKTexture(imageNamed: "CerchioGrandeFrontF2"),
                                     SKTexture(imageNamed: "CerchioGrandeFrontF3"), SKTexture(imageNamed: "CerchioGrandeFrontF4")]
        self.walkingAnimationLeft = [SKTexture(imageNamed: "CerchioGrandeSideF4"), SKTexture(imageNamed:"CerchioGrandeSideF1"),
                                     SKTexture(imageNamed: "CerchioGrandeSideF2"), SKTexture(imageNamed:"CerchioGrandeSideF3")]
        self.walkingAnimationRight = [SKTexture(imageNamed: "CerchioGrandeSideF4"), SKTexture(imageNamed:"CerchioGrandeSideF1"),
                                      SKTexture(imageNamed: "CerchioGrandeSideF2"), SKTexture(imageNamed:"CerchioGrandeSideF3")]
        self.walkingAnimationBackLeft = [SKTexture(imageNamed: "CerchioGrande3:4F1"), SKTexture(imageNamed:"CerchioGrandeF2"),
                                         SKTexture(imageNamed: "CerchioGrande3:4F2"), SKTexture(imageNamed:"CerchioGrandeFrontF4")]
        self.walkingAnimationBackRight = [SKTexture(imageNamed: "CerchioGrande3:4F1"), SKTexture(imageNamed:"CerchioGrandeF2"),
                                          SKTexture(imageNamed: "CerchioGrande3:4F2"), SKTexture(imageNamed:"CerchioGrandeFrontF4")]
        self.walkingAnimationFrontRight = [SKTexture(imageNamed: "CerchioGrande3:4F1"), SKTexture(imageNamed:"CerchioGrandeF2"),
                                           SKTexture(imageNamed: "CerchioGrande3:4F2"), SKTexture(imageNamed:"CerchioGrandeFrontF4")]
        self.walkingAnimationFrontLeft = [SKTexture(imageNamed: "CerchioGrande3:4F1"), SKTexture(imageNamed:"CerchioGrandeF2"),
                                          SKTexture(imageNamed: "CerchioGrande3:4F2"), SKTexture(imageNamed:"CerchioGrandeFrontF4")]
        
        self.stunnedAnimation = [SKTexture(imageNamed: "CerchioGrandeMortoF1"), SKTexture(imageNamed: "CerchioGrandeMortoF2"), SKTexture(imageNamed: "CerchioGrandeMortoF3")]
    }
}
