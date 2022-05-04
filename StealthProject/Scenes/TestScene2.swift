//
//  TestScene2.swift
//  StealthProject
//
//  Created by Salvatore Manna on 04/05/22.
//

import UIKit
import GameplayKit


class TestScene2: SKScene, PlayableScene {
    
    var delta: TimeInterval = 0.0
    var lastUpdate: TimeInterval?
    
    var player: PlayableCharacterClass = PlayableCharacterClass(texture: SKTexture(imageNamed: "boyFront"), color: .clear, size: CGSize(width: 25, height: 50), noise: 1, speed: 1, strenght: 1)
    
    var scenecamera = SKCameraNode()
    
    
    var inputVector: CGVector = CGVector.zero
    var rollVector: CGVector = CGVector.init(dx: 1, dy: 0)
    var velocity: CGVector = CGVector.zero
    
    var ACCELLERATION: Double = 10
    var MAX_SPEED: Double = 100
    var FRICTION: Double = 50
    
    
    override func didMove(to view: SKView) {
        myGameController.connectController()
        camera = scenecamera
        scenecamera.position = player.position
        addChild(player)
    }
    
    override func update(_ currentTime: TimeInterval) {
        calcDelta(currentTime: currentTime)
        player.updateActionState()
        
        switch player.getActionState(){
        case .MOVE:
            moveState()
        case .ATTACK:
            print("")
            
        case .INTERACT:
            print("")
            
        case .ROLL:
            print("")
        }
        
        playerMovement(player: player as SKSpriteNode, velocity: velocity)
//        scenecamera.position = player.position
        print(inputVector)
    }
    
    
    
    
    
}
