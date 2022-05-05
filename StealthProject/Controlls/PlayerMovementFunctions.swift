//
//  PlayerMovementFunctions.swift
//  StealthProject
//
//  Created by Antonio Romano on 03/05/22.
//

import Foundation
import SpriteKit
import SwiftUI

func playerMovement(player: SKSpriteNode, velocity: CGVector){
    player.position.x += velocity.dx
    player.position.y += velocity.dy
}


protocol PlayableScene: DeltaProtocol{
    
    var player: PlayableCharacter {get set}
    
    var inputVector: CGVector {get set}
    var rollVector: CGVector {get set}
    var velocity: CGVector {get set}
    
    var ACCELLERATION: Double {get set}
    var MAX_SPEED: Double {get set}
    var FRICTION: Double {get set}
    
    func moveState()
    
}

extension PlayableScene{
     func moveState(){
        self.inputVector = CGVector.zero
        inputVector = myMovement
        if inputVector != CGVector.zero{
            rollVector = inputVector.normalized()
            inputVector = inputVector*ACCELLERATION*delta //AGGIUNGERE ACCELERAZIONE APPROPRIATA
            velocity += inputVector
            velocity = velocity.clamped(maxLength: MAX_SPEED*delta) //AGGIUNGERE MAX VELOCITY
        }else{
            velocity = velocity.moveTowardZero(value: FRICTION*delta)
        }
        
    }
    
     func attackState(){
        
    }
    
     func rollState(){
        if velocity != CGVector.zero{
            velocity = velocity.moveTowardZero(value: 1000)
        }
         velocity = rollVector*MAX_SPEED*1.5*delta
         
         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
             self.velocity = self.velocity.moveTowardZero(value: self.FRICTION*self.delta)
         })
         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.3, execute: {
             self.player.setActionState(.MOVE)
         })
    }
    
     func interactState(){
        
    }
}


