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
        super.init(texture: texture, color: color, size: size, strength: 3, speed: 150, visionConeRadius: 200, visionConeAngle: 60)
        setAnimationsArray()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setAnimationsArray(){
        self.frontTexture = SKTexture(imageNamed: "ConoGrandeFrontF2")
        self.backTexture = SKTexture(imageNamed: "ConoGrandeBackF1")
        self.sideLTexture = SKTexture(imageNamed: "ConoGrandeSideF2")
        self.sideRTexture = SKTexture(imageNamed: "ConoGrandeSideMirrorF2")
        self.halfBackLTexture = SKTexture(imageNamed: "ConoGrande3:4BackMirrorF1")
        self.halfBackRTexture = SKTexture(imageNamed: "ConoGrande3:4BackF1")
        self.halfFrontRTexture = SKTexture(imageNamed: "ConoGrande3:4FrontMirrorF1")
        self.halfFrontLTexture = SKTexture(imageNamed: "ConoGrande3:4FrontF3")
        
        self.walkingAnimationRight = [SKTexture(imageNamed: "ConoGrandeSideMirrorF2"), SKTexture(imageNamed:"ConoGrandeSideMirrorF3"), SKTexture(imageNamed:"ConoGrandeSideMirrorF4"), SKTexture(imageNamed:"ConoGrandeSideMirrorF1")]
        self.walkingAnimationFront = [SKTexture(imageNamed: "ConoGrandeFrontF3"), SKTexture(imageNamed: "ConoGrandeFrontF4"), SKTexture(imageNamed: "ConoGrandeFrontF1"), SKTexture(imageNamed: "ConoGrandeFrontF2")]
        self.walkingAnimationLeft = [SKTexture(imageNamed: "ConoGrandeSideF3"), SKTexture(imageNamed:"ConoGrandeSideF4"), SKTexture(imageNamed:"ConoGrandeSideF1"), SKTexture(imageNamed:"ConoGrandeSideF2")]
        self.walkingAnimationBack = [SKTexture(imageNamed: "ConoGrandeBackF1"), SKTexture(imageNamed: "ConoGrandeBackF2"), SKTexture(imageNamed: "ConoGrandeBackF3"), SKTexture(imageNamed: "ConoGrandeBackF4")]
    }
}
