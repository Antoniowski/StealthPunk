//
//  PlayerMovementFunctions.swift
//  StealthProject
//
//  Created by Antonio Romano on 03/05/22.
//





//PER L'ATTACCO E L'INTERAZIONE POSSIAMO CREARE UN ARRAY DI NEMICI E
//OGGETTI INTERAGIBILI E PASSARE QUEGLI ARRAY ALLE FUNZIONI, IN MODO
//DA SOSTITUIRE LA FUNZIONE DI ENUMERATE BASE CHE NON CI PERMETTE DI
//AVERE ACCESSO ALLE STATS DEI PERSONAGGI

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
    
    func attackState(scene: SKScene){
        
        scene.enumerateChildNodes(withName: "enemy"){ object, _ in
            if getDistanceBetween(point1: self.player.position, point2: object.position) <= self.player.getAttackRange(){
                //TO DO
            }

        }
        print("Attack")
        self.player.setActionState(.MOVE)
    }
    
     func rollState(){
        
         velocity = rollVector*MAX_SPEED*3*delta
         
         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2, execute: {
             self.velocity = .zero
         })
//         DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.3, execute: {
//             self.player.setActionState(.MOVE)
//         })
    }
    
    func interactState(scene: SKScene){
         scene.enumerateChildNodes(withName: "interactable"){ object, _ in
             if getDistanceBetween(point1: self.player.position, point2: object.position) <= self.player.getInteractRange(){
                 object.run(.rotate(byAngle: pi/2, duration: 1))
                 self.player.setHiddenStatus(true)
             }
             
         }
         self.player.setActionState(.MOVE)

    }
}


