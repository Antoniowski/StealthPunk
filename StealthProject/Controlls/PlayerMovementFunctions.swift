//
//  PlayerMovementFunctions.swift
//  StealthProject
//
//  Created by Antonio Romano on 03/05/22.
//

import Foundation
import SpriteKit
import SwiftUI

func playerMovement(player: SKShapeNode, velocity: CGVector){
    player.position.x += velocity.dx
    player.position.y += velocity.dy
}


protocol PlayableScene: DeltaProtocol{
    var inputVector: CGVector {get set}
    var rollVector: CGVector {get set}
    var velocity: CGVector {get set}
    
    var ACCELLERATION: Double {get set}
    var MAX_SPEED: Double {get set}
    var FRICTION: Double {get set}
    
    func moveState()
    func attackState()
    func rollState()
    func interactState()
}

extension PlayableScene{
    mutating func moveState(){
        self.inputVector = CGVector.zero
        inputVector = myMovement
        if inputVector != CGVector.zero{
            rollVector = inputVector
            inputVector = inputVector*ACCELLERATION*delta //AGGIUNGERE ACCELERAZIONE APPROPRIATA
            velocity += inputVector
            velocity = velocity.clamped(maxLength: MAX_SPEED) //AGGIUNGERE MAX VELOCITY
        }else{
            velocity = velocity.moveTowardZero(value: FRICTION*delta)
            rollVector = CGVector.init(dx: 0, dy: 1)
        }
        
    }
    
    mutating func attackState(){
        
    }
    
    mutating func rollState(){
        if velocity != CGVector.zero{
            velocity = velocity.moveTowardZero(value: 1000)
        }
        velocity = rollVector*MAX_SPEED*1.5*delta
//        run(SKAction.sequence([.wait(forDuration: 0.2), .run {
//            self.velocity = self.velocity.moveTowardZero(value: self.FRICTION*self.delta)
//        }])) DA RISOLVERE
    }
    
    mutating func interactState(){
        
    }
}


