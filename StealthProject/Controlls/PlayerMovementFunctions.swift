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


protocol PlayableScene:SKScene, DeltaProtocol, SKPhysicsContactDelegate{
    
    var player: PlayableCharacter {get set}
    
    var inputVector: CGVector {get set}
    var rollVector: CGVector {get set}
    var velocity: CGVector {get set}
    
    var ACCELLERATION: Double {get set}
    var MAX_SPEED: Double {get set}
    var FRICTION: Double {get set}
    
    var indicatore: Counter {get set}
    
    
}

extension PlayableScene{
    
     func moveState(){
        self.inputVector = CGVector.zero
        inputVector = myMovement
        if inputVector != CGVector.zero{
            rollVector = inputVector.normalized()
            inputVector = inputVector*ACCELLERATION*Double(player.getSpeed())*0.25*delta //AGGIUNGERE ACCELERAZIONE APPROPRIATA
            velocity += inputVector
            velocity = velocity.clamped(maxLength: MAX_SPEED*delta*Double(player.getSpeed())*0.5)
        }else{
            velocity = velocity.moveTowardZero(value: FRICTION*delta)
        }
        
    }
    
    func runningState(){
        self.inputVector = CGVector.zero
        inputVector = myMovement
        if inputVector != CGVector.zero{
            rollVector = inputVector.normalized()
            inputVector = inputVector*ACCELLERATION*Double(player.getSpeed())*0.25*delta //AGGIUNGERE ACCELERAZIONE APPROPRIATA
            velocity += inputVector
            velocity = velocity.clamped(maxLength: MAX_SPEED*Double(player.getSpeed())*delta)
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
        
        velocity = rollVector*MAX_SPEED*2.2*Double(player.getSpeed())*delta
        
    }
    
    func interactState(scene: SKScene, oggetti: [SKNode]){
        if player.getStatus().isInteracting == false && player.getStatus().isExiting == false{
            player.setInteractingStatus(true)
//            print("Interaction")
//            scene.enumerateChildNodes(withName: "ROOM/dynamicObject"){ object, _ in
            for object in oggetti{
                if getDistanceBetween(point1: self.player.position, point2: scene.convert(object.position, from: object.parent ?? SKNode())) <= self.player.getInteractRange(){
                    let interact = object as? InteractableObject
                    switch interact?.getType(){
                    case .USABLE:
                        let usable = interact as? UsableObject
                        switch usable?.getUsableCategory(){
                        case .SWITCH:
                            let lightSwitch = usable as? LightSwitch
                            lightSwitch?.action(scene)
                        case .CHEST:
                            let chest = usable as? Chest
                            chest?.action(scene: scene)
                        case .TAVERNA_DOOR:
                            let door = usable as? TavernaDoor
                            door?.run(.playSoundFileNamed("doorTaverna", waitForCompletion: false), completion: {
                                door?.action(self.view!)
                            })
                        case .TAVERNA_SCRIGNO:
                            let chest = usable as? Inventory
                            chest?.action(scene: scene)
                        default:
                            return
                        }
                    case .HIDEOUT:
                        let hideout = interact as? Hideout
                        hideout?.action(player: self.player)
                        switch hideout?.getHideoutCategory(){
                        case .CLOSET:
                            let useCloset = hideout as? Closet
                            useCloset?.action()
                        case .BUSH:
                            let useBush = hideout as? Bush
                            useBush?.action()
                        case .PANCA:
                            let panca = hideout as? Cassapanca
                            panca?.action()
                        case .VETRINA:
                            let vetrina = hideout as? Vetrina
                            vetrina?.action()
                        default :
                            print("")
                        }
                    default:
                        return
                    }
                }
                
            }
////            self.player.setActionState(.MOVE)
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: { //FUNZIONA MA NON SO COME
//                self.player.setInteractingStatus(false)                    //IL DELAY E' NECESSARIO ALTRIMENTI L'AZIONE VIENE
//                                                                           //RICHIAMATA PIU' VOLTE VISTO CHE "A" RIMANE PREMUTO
//                self.player.setActionState(.MOVE)
//                //IL DELAY ANDRA' SOSTITUITO DALL'ANIMAZIONE
//            })
            
        }
    }
    
    func hiddenState(){
        if player.getStatus().isHidden == false{
            player.setHiddenStatus(true)
            DispatchQueue.main.asyncAfter(deadline: .now()+0.35, execute: {
            self.player.alpha = 0
                self.player.physicsBody = SKPhysicsBody()
                self.player.physicsBody?.isDynamic = false
                self.player.physicsBody?.affectedByGravity = false
                self.player.physicsBody?.allowsRotation = false
            self.player.setEnteringStatus(false)
        })
        }
    }
    
    
    
//    func didBegin(_ contact: SKPhysicsContact) {
//        var firstBody = SKPhysicsBody()
//        var secondBody = SKPhysicsBody()
//
//        if contact.bodyA.node?.name == "player"{
//            firstBody = contact.bodyA
//            secondBody = contact.bodyB
//        }else if contact.bodyB.node?.name == "player"{
//            firstBody = contact.bodyB
//            secondBody = contact.bodyA
//        }
//
//
//        if firstBody.node?.name == "player" && secondBody.node?.name == "collectible"{
//            let item = secondBody.node as? Collectible
//            item?.action(player: firstBody.node as? PlayableCharacter ?? PlayableCharacter())
//            if item?.getType() == .COIN{
////                indicatore.run(.moveBy(x: 0, y: -90, duration: 0.5), completion: {
////                    self.indicatore.run(.sequence([.wait(forDuration: 1.5), .moveBy(x: 0, y: 90, duration: 0.5)]))
////                })
//                indicatore.run(.moveTo(y: UIScreen.main.bounds.height*0.8, duration: 10.5), completion: {
//                    self.indicatore.run(.sequence([.wait(forDuration: 1.5), .moveTo(y: UIScreen.main.bounds.height*1.2, duration: 0.5)]))
//                })
//                item?.action(contatore: indicatore)
//            }
//            secondBody.node?.removeFromParent()
//        }
//        if firstBody.node?.name == "player" && secondBody.node?.name == "door"{
//            let door = secondBody.node as? Door
//            door?.open()
//        }
//    }
    
    func playerEssential(scene: SKScene, nemici: [SKNode], oggetti: [SKNode]){
        player.updateActionState(scene: scene, oggetti: oggetti)
//        player.updateMovingDirection()
        player.animationTree()
        player.searchObject(scene: scene, oggetti: oggetti)
        player.updateFocus(scene: scene, enemies: nemici, oggetti: oggetti)
        
        
        
        switch player.getActionState(){
        case .MOVE:
            moveState()
            
        case .ATTACK:
            attackState(scene: scene)
            
        case .INTERACT:
            interactState(scene: scene, oggetti: oggetti)
            
        case .ROLL:
            rollState()
            
        case .HIDDEN:
            hiddenState()
            
        case .RUNNING:
            runningState()
        }
    }
}


