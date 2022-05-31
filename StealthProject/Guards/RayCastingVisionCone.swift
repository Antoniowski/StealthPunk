//
//  RayCastingVisionCone.swift
//  StealthProject
//
//  Created by Salvatore Manna on 06/05/22.
//

import Foundation
import SpriteKit

func visionCone(entity: Guard, scene: SKScene){
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
    
//    scene.enumerateChildNodes(withName: "*"){node, _ in
//        if(node.name == entity.name!+"visualCone"){
//            node.removeFromParent()
//        }
//    }
    
    entity.resetArrayOfPoints()
            
    
    if(entity.getVisionConeAngle() != 360){
        visionConeRayCasting(entity: entity, scene: scene)
    } else {
        visionConeRayCasting360(entity: entity, scene: scene)
    }
}

func visionConeRayCasting360(entity: Guard, scene: SKScene){
    var rayCastingPlayerFound: Bool = false
    
    for index in 0...Int(entity.getVisionConeAngle())-1{
        var newAngle = entity.getCenterBall().zRotation + CGFloat(index)
        var newX4 = cos(newAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
        var newY4 = sin(newAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
        rayCasting(myX: entity.roomReference.convert(entity.position, to: scene).x + newX4, myY: entity.roomReference.convert(entity.position, to: scene).y + newY4, entity: entity, scene: scene, rayCastingPlayerFound: &rayCastingPlayerFound)
    }
    
    
    if(entity.rayCastingPlayerFound){
        if(!entity.playerInVisualCone){
            entity.playerInVisualCone = true
            if(moltiplicatoreTempo == 1){
                moltiplicatoreTempo = 2
            } else if (moltiplicatoreTempo == 2){
                moltiplicatoreTempo = 7
            } else if (moltiplicatoreTempo == 7){
                
            }
        }
        
    } else if(!entity.rayCastingPlayerFound){
        entity.playerInVisualCone = false
    }
    
    createVisionCone360(entity: entity, scene: scene)
}

func visionConeRayCasting(entity: Guard, scene: SKScene){
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
    
    
    
    createVisionCone(entity: entity, scene: scene)
//    if(entity.getPlayerFound()){
//        scene.enumerateChildNodes(withName: "*"){node, _ in
//            if(node.name! == entity.name!+"visualCone"){
//                node.removeFromParent()
//            }
//        }
//    }
    
}

func createVisionCone360(entity: Guard, scene: SKScene){
    var myPath = UIBezierPath()
    
//    myPath.move(to: entity.arrayOfPoints[0])
    myPath.move(to: scene.convert(entity.getArrayOfVisionPoints()[0], to: entity.parent!))
    
    let totalElements = entity.getArrayOfVisionPoints().count
    
    for index in 0..<entity.getArrayOfVisionPoints().count{
        let square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
        myPath.addLine(to: scene.convert(entity.getArrayOfVisionPoints()[index], to: entity.parent!))
    }
    
    let visualCone = SKShapeNode(path: myPath.cgPath)
    visualCone.fillColor = .yellow
    visualCone.strokeColor = .yellow
    visualCone.alpha = 0.35
    visualCone.zPosition = entity.zPosition - 1
    visualCone.name = entity.name!+"visualCone"
    
    entity.parent!.addChild(visualCone)
    
//    if(entity.rayCastingPlayerFound){
//        print("Trovato")
//        entity.setPlayerFoundTrue()
//        entity.setPlayerFoundTransitioningTrue()
//    } else {
//        print("NonTrovato")
//        entity.setPlayerFoundFalse()
//        entity.setPlayerFoundTransitioningFalse()
//    }
}

func createVisionCone(entity: Guard, scene: SKScene){
    var myPath = UIBezierPath()
    
    myPath.move(to: entity.position)
            
    for index in 0..<entity.getArrayOfVisionPoints().count{
        let square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
        myPath.addLine(to: scene.convert(entity.getArrayOfVisionPoints()[index], to: entity.parent!))
    }
    
    myPath.addLine(to: entity.position)
    
    let visualCone = SKShapeNode(path: myPath.cgPath)
    visualCone.fillColor = .yellow
    visualCone.strokeColor = .yellow
    visualCone.alpha = 0.35
    visualCone.zPosition = entity.zPosition - 1
    visualCone.name = entity.name!+"visualCone"
    
    entity.parent!.addChild(visualCone)
    
    
    if(entity.rayCastingPlayerFound){
        if(!entity.playerInVisualCone){
            entity.playerInVisualCone = true
            if(moltiplicatoreTempo == 1){
                moltiplicatoreTempo = 2
            } else if (moltiplicatoreTempo == 2){
                moltiplicatoreTempo = 7
            } else if (moltiplicatoreTempo == 7){
                
            }
        }
        
    } else if(!entity.rayCastingPlayerFound){
        entity.playerInVisualCone = false
    }
    
//    if(entity.rayCastingPlayerFound){
//        if (entity.getGuardActionState() == .IDLE || entity.getGuardActionState() == .MOVE || entity.getGuardActionState() == .ROTATING_ACTION){
//            entity.pathToChasing = true
//        } else if (entity.getGuardActionState() == .SEARCHING || entity.getGuardActionState() == .ROTATING || entity.getGuardActionState() == .RETURNING){
//            entity.pathToChasing = true
//        }
//    } else {
//        if (entity.getGuardActionState() == .CHASING ){
//            entity.chasingToSearching = true
//        } else if (entity.getGuardActionState() == .ROTATING && entity.readyToReturn){
//            entity.readyToReturn = false
//            entity.rotatingToReturn = true
//        }
//    }
    
//    if(entity.rayCastingPlayerFound){
//        entity.setPlayerFoundTrue()
//        entity.setPlayerFoundTransitioningTrue()
//
//    } else {
//        if(entity.chasing){
//            entity.setPlayerFoundFalse()
////            entity.searching = true
//            entity.transitionToSearch = true
//        } else {
//            entity.setPlayerFoundFalse()
//            entity.setPlayerFoundTransitioningFalse()
//        }
//    }
    
    
    
}


func rayCasting(myX: CGFloat, myY: CGFloat, entity: Guard, scene: SKScene, rayCastingPlayerFound: inout Bool){
//    var foundObject: Bool = false
//    let intersectedBody = scene.physicsWorld.body(alongRayStart: entity.roomReference.convert(entity.position, to: scene), end: CGPoint(x: myX, y: myY))
//    if(intersectedBody != nil && intersectedBody?.node?.name! == "player"){
//        entity.rayCastingPlayerFound = true
//    }
//    scene.physicsWorld.enumerateBodies(alongRayStart: entity.roomReference.convert(entity.position, to: scene), end: CGPoint(x: myX, y: myY)){ body, point, vector, object in
//        if(intersectedBody?.node?.name! != "player" || intersectedBody?.node?.name! != "collectible"){
//            foundObject = true
//            entity.appendToArrayOfPoints(point: point)
//            object.pointee = true
//        }
//    }
//
//    if(!foundObject){
//        entity.appendToArrayOfPoints(point: CGPoint(x: myX, y: myY))
//    }
    
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
