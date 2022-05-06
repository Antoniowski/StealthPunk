//
//  TestScene2.swift
//  StealthProject
//
//  Created by Salvatore Manna on 04/05/22.
//

import UIKit
import GameplayKit


var test: [SKTexture] = [SKTexture(imageNamed: "boyWalk1"), SKTexture(imageNamed:"boyWalk2"), SKTexture(imageNamed:"boyWalk3"), SKTexture(imageNamed:"boyWalk4"), SKTexture(imageNamed:"boyWalk5"), SKTexture(imageNamed:"boyWalk6"), SKTexture(imageNamed:"boyWalk7"), SKTexture(imageNamed:"boyWalk8")]
var test2: [SKTexture] = [SKTexture(imageNamed: "boyFrontWalk1"), SKTexture(imageNamed: "boyFrontWalk2"), SKTexture(imageNamed: "boyFrontWalk3"), SKTexture(imageNamed: "boyFrontWalk4")]
var test3: [SKTexture] = [SKTexture(imageNamed: "boyWalkLeft1"), SKTexture(imageNamed:"boyWalkLeft2"), SKTexture(imageNamed:"boyWalkLeft3"), SKTexture(imageNamed:"boyWalkLeft4"), SKTexture(imageNamed:"boyWalkLeft5"), SKTexture(imageNamed:"boyWalkLeft6"), SKTexture(imageNamed:"boyWalkLeft7"), SKTexture(imageNamed:"boyWalkLeft8")]
var test4: [SKTexture] = [SKTexture(imageNamed: "boyBackWalk1"), SKTexture(imageNamed: "boyBackWalk2"), SKTexture(imageNamed: "boyBackWalk3"), SKTexture(imageNamed: "boyBackWalk4")]

var rolltest: [SKTexture] = [SKTexture(imageNamed: "boyRoll1"), SKTexture(imageNamed: "boyRoll2"), SKTexture(imageNamed: "boyRoll3"), SKTexture(imageNamed: "boyRoll4"), SKTexture(imageNamed: "boyRoll5"), SKTexture(imageNamed: "boyRoll6"), SKTexture(imageNamed: "boyRoll7"), SKTexture(imageNamed: "boyRoll8")]


class TestScene2: SKScene, PlayableScene, SKPhysicsContactDelegate {
    
    var delta: TimeInterval = 0.0
    var lastUpdate: TimeInterval?
    
    var player: PlayableCharacter = Human(texture: SKTexture(imageNamed: "boyFront"), color: .clear, size: CGSize(width: 35, height: 70), noise: 1, speed: 1, strenght: 1)
    var armadio: InteractableObject = InteractableObject(texture: SKTexture(imageNamed: "closet"), color: .clear, size: CGSize(width: 100, height: 100), type: .HIDEOUT)
    var lampione = InteractableObject(texture: SKTexture(imageNamed: "lampione"), color: .clear, size: CGSize(width: 70, height: 140), type: .STATIC)

    
    var scenecamera = SKCameraNode()
    
    
    var inputVector: CGVector = CGVector.zero
    var rollVector: CGVector = CGVector.init(dx: 1, dy: 0)
    var velocity: CGVector = CGVector.zero
    
    var ACCELLERATION: Double = 20
    var MAX_SPEED: Double = 100
    var FRICTION: Double = 10
    
    
    override func didMove(to view: SKView) {
        myGameController.connectController()
        camera = scenecamera
        scenecamera.position = player.position
        armadio.position = player.position
        armadio.position.x += 250
        lampione.position = player.position
        lampione.position.y += 100
        player.zPosition = 3
        armadio.zPosition = 1
        lampione.zPosition = 1
        addChild(player)
        addChild(armadio)
        addChild(lampione)
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        calcDelta(currentTime: currentTime)
        player.updateActionState()
//        player.updateMovingDirection()
        player.animationWalking()
        
        switch player.getActionState(){
        case .MOVE:
            moveState()
        case .ATTACK:
            print("")
            
        case .INTERACT:
            interactState(scene: self)
            
        case .ROLL:
            rollState()
        }
        
        playerMovement(player: player as SKSpriteNode, velocity: velocity)
        
//        scenecamera.position = player.position
//        print(player.getFacingDirection())
    }
    
    
    
    
    
}
