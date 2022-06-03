//
//  GuardConoPiccolo.swift
//  StealthProject
//
//  Created by Salvatore Manna on 30/05/22.
//

import Foundation
import SpriteKit


class GuardConoPiccolo: Guard{
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size, strength: 3, speed: 150, visionConeRadius: 100, visionConeAngle: 50)
        setAnimationsArray()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setAnimationsArray(){
        self.frontTexture = SKTexture(imageNamed: "ConoPiccoloFrontF1")
        self.backTexture = SKTexture(imageNamed: "ConoPiccoloBackF1")
        self.sideLTexture = SKTexture(imageNamed: "ConoPiccoloSideF1")
        self.sideRTexture = SKTexture(imageNamed: "ConoPiccoloSideMirrorF1")
        self.halfBackLTexture = SKTexture(imageNamed: "ConoPiccolo3:4BackMirrorF1")
        self.halfBackRTexture = SKTexture(imageNamed: "ConoPiccolo3:4BackF1")
        self.halfFrontRTexture = SKTexture(imageNamed: "ConoPiccolo3:4FrontMirrorF1")
        self.halfFrontLTexture = SKTexture(imageNamed: "ConoPiccolo3:4FrontF1")
        
        self.currentIdleDirectionTexture = self.backTexture
        
        self.walkingAnimationFront = [SKTexture(imageNamed: "ConoPiccoloFrontF2"), SKTexture(imageNamed: "ConoPiccoloFrontF1")]
        self.walkingAnimationBack = [SKTexture(imageNamed: "ConoPiccoloBackF2"), SKTexture(imageNamed: "ConoPiccoloBackF1")]
        self.walkingAnimationLeft = [SKTexture(imageNamed: "ConoPiccoloSideF1"), SKTexture(imageNamed:"ConoPiccoloSideF1")]
        self.walkingAnimationRight = [SKTexture(imageNamed: "ConoPiccoloSideMirrorF2"), SKTexture(imageNamed:"ConoPiccoloSideMirrorF1")]
        self.walkingAnimationBackLeft = [SKTexture(imageNamed: "ConoPiccolo3:4BackMirrorF2"), SKTexture(imageNamed:"ConoPiccolo3:4BackMirrorF1")]
        self.walkingAnimationBackRight = [SKTexture(imageNamed: "ConoPiccolo3:4BackF2"), SKTexture(imageNamed:"ConoPiccolo3:4BackF1")]
        self.walkingAnimationFrontRight = [SKTexture(imageNamed: "ConoPiccolo3:4FrontMirrorF2"), SKTexture(imageNamed:"ConoPiccolo3:4FrontMirrorF1")]
        self.walkingAnimationFrontLeft = [SKTexture(imageNamed: "ConoPiccolo3:4FrontF2"), SKTexture(imageNamed:"ConoPiccolo3:4FrontF1")]
        
        self.stunnedAnimation = [SKTexture(imageNamed: "ConoPiccoloMortoF1"), SKTexture(imageNamed: "ConoPiccoloMortoF2"), SKTexture(imageNamed: "ConoPiccoloMortoF3")]
    }
}
