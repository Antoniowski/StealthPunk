//
//  TestScene3.swift
//  StealthProject
//
//  Created by Salvatore Manna on 06/05/22.
//

import UIKit
import SpriteKit

class TestScene3: SKScene, SKPhysicsContactDelegate {

    let guard1 = Guard(texture: SKTexture(imageNamed: "boyFront"), color: .clear, size: CGSize(width: 35, height: 75), strenght: 2, speed: 2, visionConeRadius: 150, visionConeAngle: 60)
    
    override func didMove(to view: SKView) {
        
        self.scene?.physicsWorld.contactDelegate = self
        
        
        spawn()
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        visionCone(entity: guard1, scene: self)
        
        
    }
    
    func spawn(){
        guard1.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        addChild(guard1)
        
        guard1.run(.rotate(byAngle: 3.14 * 90 / 180, duration: 2))
    }
}
