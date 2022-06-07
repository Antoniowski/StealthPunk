//
//  RayCastingVisionCone.swift
//  StealthProject
//
//  Created by Salvatore Manna on 06/05/22.
//

import Foundation
import SpriteKit
import SwiftUI

func visionCone(entity: Guard, scene: SKScene, timer: TimeCounter){
//    entity.centerBall()
    
    entity.rayCastingPlayerFound = false
    
//    if(!entity.getInitBall()){
//        scene.addChild(entity.getCenterBall())
//        entity.setInitBall()
//        entity.getCenterBall().position = entity.position
//    }
//
    entity.position = entity.getCenterBall().position

    
    entity.parent!.enumerateChildNodes(withName: "*"){node, _ in
        if(node.name == entity.name!+"visualCone"){
            node.removeFromParent()
        }
    }
    
    entity.resetArrayOfPoints()
            
        
    if(!entity.getStatus().isHit){
        if(entity.getVisionConeAngle() != 360){
            visionConeRayCasting(entity: entity, scene: scene, timer: timer)
        } else {
            visionConeRayCasting360(entity: entity, scene: scene, timer: timer)
        }

    }
}

func visionConeRayCasting360(entity: Guard, scene: SKScene, timer: TimeCounter){
    var rayCastingPlayerFound: Bool = false
    
    for index in 0...Int(entity.getVisionConeAngle())-1{
        var newAngle = entity.getCenterBall().zRotation + CGFloat(index)
        var newX4 = cos(newAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
        var newY4 = sin(newAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
        rayCasting(myX: entity.roomReference.convert(entity.position, to: scene).x + newX4, myY: entity.roomReference.convert(entity.position, to: scene).y + newY4, entity: entity, scene: scene, rayCastingPlayerFound: &rayCastingPlayerFound)
    }
    
        
    createVisionCone360(entity: entity, scene: scene, timer: timer)
}

func visionConeRayCasting(entity: Guard, scene: SKScene, timer: TimeCounter){
    var rayCastingPlayerFound: Bool = false
    
    let myAngle = entity.getCenterBall().zRotation * 180 / 3.14 + 90
    
    
    let newX = cos(myAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
    let newY = sin(myAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
  
    let counter = Int(entity.getVisionConeAngle()/2)
    
    for index in 1...counter {
        var newAngle = myAngle + CGFloat(counter - index)
        var newX4 = cos(newAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
        var newY4 = sin(newAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
        rayCasting(myX: entity.roomReference.convert(entity.position, to: scene).x + newX4, myY: entity.roomReference.convert(entity.position, to: scene).y + newY4, entity: entity, scene: scene, rayCastingPlayerFound: &rayCastingPlayerFound)
        
    }
    
    rayCasting(myX: entity.roomReference.convert(entity.position, to: scene).x + newX, myY: entity.roomReference.convert(entity.position, to: scene).y + newY, entity: entity, scene: scene, rayCastingPlayerFound: &rayCastingPlayerFound)
    
    
    for index in 1...counter {
        var newAngle = myAngle - CGFloat(index)
        var newX4 = cos(newAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
        var newY4 = sin(newAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
        rayCasting(myX: entity.roomReference.convert(entity.position, to: scene).x + newX4, myY: entity.roomReference.convert(entity.position, to: scene).y + newY4, entity: entity, scene: scene, rayCastingPlayerFound: &rayCastingPlayerFound)
    }
    
    
    
    createVisionCone(entity: entity, scene: scene, timer: timer)
}

func createVisionCone360(entity: Guard, scene: SKScene, timer: TimeCounter){
    var myPath = UIBezierPath()
    
//    myPath.move(to: entity.arrayOfPoints[0])
    myPath.move(to: scene.convert(entity.getArrayOfVisionPoints()[0], to: entity.parent!))
    
    let totalElements = entity.getArrayOfVisionPoints().count
    
    for index in 0..<entity.getArrayOfVisionPoints().count{
        let square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
        myPath.addLine(to: scene.convert(entity.getArrayOfVisionPoints()[index], to: entity.parent!))
    }
    
    let visualCone = SKShapeNode(path: myPath.cgPath)
    if(entity.playerInVisualCone){
        visualCone.fillColor = .red
        visualCone.strokeColor = .red
    } else {
        visualCone.fillColor = UIColor(red: 255/255, green: 255/255, blue: 120/255, alpha: 1)
        visualCone.strokeColor = UIColor(red: 255/255, green: 255/255, blue: 120/255, alpha: 1)
    }
    visualCone.alpha = 0.2
    visualCone.zPosition = entity.zPosition - 1
    visualCone.name = entity.name!+"visualCone"
    
    entity.parent!.addChild(visualCone)
    
    var posizioneGiocatore: CGPoint = CGPoint(x: 0, y: 0)
    
    scene.enumerateChildNodes(withName: "player"){
        node, _ in
        posizioneGiocatore = node.position
    }
    
    if(entity.rayCastingPlayerFound){
        if(!entity.playerInVisualCone){
            entity.playerInVisualCone = true
            if(moltiplicatoreTempo == 1){
                moltiplicatoreTempo = moltiplicatoreTempo2
                timer.cerchio1.fillColor = .red
            } else if (moltiplicatoreTempo == moltiplicatoreTempo2){
                moltiplicatoreTempo = moltiplicatoreTempo3
                timer.cerchio2.fillColor = .red
            } else if (moltiplicatoreTempo == moltiplicatoreTempo3){
                moltiplicatoreTempo = moltiplicatoreTempo4
                timer.cerchio3.fillColor = .red
            } else if (moltiplicatoreTempo == moltiplicatoreTempo4){
                loseFlag = true
            }
        }
        
    } else if(!entity.rayCastingPlayerFound){
        entity.playerInVisualCone = false
    }
    
}

func createVisionCone(entity: Guard, scene: SKScene, timer: TimeCounter){
    var myPath = UIBezierPath()
    
    myPath.move(to: entity.position)
//    myPath.move(to: entity.roomReference.convert(entity.position, to: scene))
            
    for index in 0..<entity.getArrayOfVisionPoints().count{
        let square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
        myPath.addLine(to: scene.convert(entity.getArrayOfVisionPoints()[index], to: entity.parent!))
    }
    
    myPath.move(to: entity.position)
//    myPath.addLine(to: entity.roomReference.convert(entity.position, to: scene))
    
    let visualCone = SKShapeNode(path: myPath.cgPath)
    if(entity.playerInVisualCone){
        visualCone.fillColor = .red
        visualCone.strokeColor = .red
    } else {
        visualCone.fillColor = UIColor(red: 255/255, green: 255/255, blue: 120/255, alpha: 1)
        visualCone.strokeColor = UIColor(red: 255/255, green: 255/255, blue: 120/255, alpha: 1)
        
    }
    visualCone.alpha = 0.2
    visualCone.zPosition = entity.zPosition - 1
    visualCone.name = entity.name!+"visualCone"
    
    entity.parent!.addChild(visualCone)
    
    var posizioneGiocatore: CGPoint = CGPoint(x: 0, y: 0)
    
    scene.enumerateChildNodes(withName: "player"){
        node, _ in
        posizioneGiocatore = node.position
    }
    
    if(entity.rayCastingPlayerFound){
        if(!entity.playerInVisualCone){
            entity.playerInVisualCone = true
            if(moltiplicatoreTempo == 1){
                moltiplicatoreTempo = moltiplicatoreTempo2
                timer.cerchio1.fillColor = .red
            } else if (moltiplicatoreTempo == moltiplicatoreTempo2){
                moltiplicatoreTempo = moltiplicatoreTempo3
                timer.cerchio2.fillColor = .red
            } else if (moltiplicatoreTempo == moltiplicatoreTempo3){
                timer.cerchio3.fillColor = .red
                moltiplicatoreTempo = moltiplicatoreTempo4
            } else if (moltiplicatoreTempo == moltiplicatoreTempo4){
                loseFlag = true
            }
        }
        
    } else if(!entity.rayCastingPlayerFound){
        entity.playerInVisualCone = false
    }
    
}


func rayCasting(myX: CGFloat, myY: CGFloat, entity: Guard, scene: SKScene, rayCastingPlayerFound: inout Bool){
    var foundObject: Bool = false
    scene.physicsWorld.enumerateBodies(alongRayStart: entity.roomReference.convert(entity.position, to: scene), end: CGPoint(x: myX, y: myY)){ body, point, vector, object in
        if(body.node?.name == "player"){
            entity.rayCastingPlayerFound = true
        } else if(body.node?.name == "collectible"){
            
        } else {
            foundObject = true
            entity.appendToArrayOfPoints(point: point)
            object.pointee = true
        }

    }
    
    if(!foundObject){
        entity.appendToArrayOfPoints(point: CGPoint(x: myX, y: myY))
    }
    
}
