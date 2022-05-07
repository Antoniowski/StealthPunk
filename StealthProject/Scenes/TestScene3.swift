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
    
    let player = PlayableCharacter(texture: SKTexture(imageNamed: "boyFront"), color: .clear, size: CGSize(width: 35, height: 75), noise: 1, speed: 5, strenght: 5)
    
    override func didMove(to view: SKView) {
        
        self.scene?.physicsWorld.contactDelegate = self
        
        
        spawn()
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        visionCone(entity: guard1, scene: self)
        
        print(guard1.getCenterBall().zRotation)
//        print(guard1.getCenterBall().zRotation * )
        
    }
    
    func spawn(){
        guard1.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
//        addChild(guard1)
        
        player.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        addChild(player)
        
        
//        guard1.run(.rotate(byAngle: 3.14 * 90 / 180, duration: 2))
        
        guard1.getCenterBall().run(.rotate(byAngle: 3.14 * 90 / 180, duration: 2))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        
        let playerPosition = self.player.position
        let clickPosition = touchLocation
        
        arrayOfTouches.append(touchLocation)
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
//            lastTouchLocation = touch.location(in: self)

            arrayOfTouches.append(touch.location(in: self))
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if(arrayOfTouches.count > 1){
            shootProjectile(player: player, scene: self)
        } else {

        }
    }
    
    
}
