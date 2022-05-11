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

//TODO: AGGIUSTARE LA POSSIBILITA' DI USARE MEZZO STICK PER MUOVERSI PIU' LENTAMENTE E FARE MENO RUMORE

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
            velocity = velocity.clamped(maxLength: MAX_SPEED*delta*0.5)
        }else{
            velocity = velocity.moveTowardZero(value: FRICTION*delta)
        }
        
    }
    
    func runningState(){
        self.inputVector = CGVector.zero
        inputVector = myMovement
        if inputVector != CGVector.zero{
            rollVector = inputVector.normalized()
            inputVector = inputVector*ACCELLERATION*delta //AGGIUNGERE ACCELERAZIONE APPROPRIATA
            velocity += inputVector
            velocity = velocity.clamped(maxLength: 1.5*MAX_SPEED*delta)
        }else{
            velocity = velocity.moveTowardZero(value: FRICTION*delta)
        }
    }
    
    func attackState(scene: SKScene){
        
//        scene.enumerateChildNodes(withName: "enemy"){ object, _ in
//            if getDistanceBetween(point1: self.player.position, point2: object.position) <= self.player.getAttackRange(){
//                //TO DO
//            }
//
//        }
//        print("Attack")
//        self.player.setActionState(.MOVE)
        print("ATTACK!")
        velocity = .zero
    }
    
    func rollState(){
        
        velocity = rollVector*MAX_SPEED*3*delta
        
    }
    
    func interactState(scene: SKScene){
        if player.getStatus().isInteracting == false{
            player.setInteractingStatus(true)
//            print("Interaction")
            scene.enumerateChildNodes(withName: "dynamicObject"){ object, _ in
                if getDistanceBetween(point1: self.player.position, point2: object.position) <= self.player.getInteractRange(){
                    let interact = object as? InteractableObject
                    switch interact?.getType(){
                    case .USABLE:
                        let usable = interact as? UsableObject
                        switch usable?.getUsableCategory(){
                        case .SWITCH:
                            let lightSwitch = usable as? LightSwitch
                            lightSwitch?.action(scene)
                        default:
                            return
                        }
                    case .HIDEOUT:
                        let hideout = interact as? Hideout
                        hideout?.action(player: self.player)
                    default:
                        return
                    }
                }
                
            }
//            self.player.setActionState(.MOVE)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: { //FUNZIONA MA NON SO COME
                self.player.setInteractingStatus(false)                    //IL DELAY E' NECESSARIO ALTRIMENTI L'AZIONE VIENE
                                                                           //RICHIAMATA PIU' VOLTE VISTO CHE "A" RIMANE PREMUTO
                self.player.setActionState(.MOVE)
                //IL DELAY ANDRA' SOSTITUITO DALL'ANIMAZIONE
            })
            
        }
    }
    
    func hiddenState(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.player.alpha = 0
            self.player.setEnteringStatus(false)
        })
    }
}


