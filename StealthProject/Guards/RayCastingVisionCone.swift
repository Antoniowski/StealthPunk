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
    
    if(!entity.getInitBall()){
        scene.addChild(entity.getCenterBall())
        entity.setInitBall()
    }
    
    scene.enumerateChildNodes(withName: "*"){node, _ in
//        guard node.name != nil && entity.name != nil else{
//            return
//        }
        if(node.name == entity.name!+"visualCone"){
            node.removeFromParent()
        }
    }
    
    entity.resetArrayOfPoints()
            
    
    if(entity.getVisionConeAngle() != 360){
        visionConeRayCasting(entity: entity, scene: scene)
    } else {
        visionConeRayCasting360(entity: entity, scene: scene)
    }
}

func visionConeRayCasting360(entity: Guard, scene: SKScene){
    
    for index in 0...Int(entity.getVisionConeAngle())-1{
        var newAngle = entity.getCenterBall().zRotation + CGFloat(index)
        var newX4 = cos(newAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
        var newY4 = sin(newAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
        rayCasting(myX: entity.position.x + newX4, myY: entity.position.y + newY4, entity: entity, scene: scene)
    }
    
    
    createVisionCone360(entity: entity, scene: scene)
    if(entity.getPlayerFound()){
        scene.enumerateChildNodes(withName: "*"){node, _ in
            if(node.name! == entity.name!+"visualCone"){
                node.removeFromParent()
            }
        }
    }
    
}

func visionConeRayCasting(entity: Guard, scene: SKScene){
    let myAngle = entity.getCenterBall().zRotation * 180 / 3.14 + 90
    
    
    let newX = cos(myAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
    let newY = sin(myAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
  
    let counter = Int(entity.getVisionConeAngle()/2)
    
    for index in 1...counter {
        var newAngle = myAngle + CGFloat(counter - index)
        var newX4 = cos(newAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
        var newY4 = sin(newAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
        rayCasting(myX: entity.position.x + newX4, myY: entity.position.y + newY4, entity: entity, scene: scene)
        
    }
    
    rayCasting(myX: entity.position.x + newX, myY: entity.position.y + newY, entity: entity, scene: scene)
    
    
    for index in 1...counter {
        var newAngle = myAngle - CGFloat(index)
        var newX4 = cos(newAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
        var newY4 = sin(newAngle * 3.14 / 180)*CGFloat(entity.getVisionConeRadius())
        rayCasting(myX: entity.position.x + newX4, myY: entity.position.y + newY4, entity: entity, scene: scene)
    }
    
    createVisionCone(entity: entity, scene: scene)
    if(entity.getPlayerFound()){
        scene.enumerateChildNodes(withName: "*"){node, _ in
            if(node.name! == entity.name!+"visualCone"){
                node.removeFromParent()
            }
        }
    }
    
}

func createVisionCone360(entity: Guard, scene: SKScene){
    var myPath = UIBezierPath()
    
//    myPath.move(to: entity.arrayOfPoints[0])
    myPath.move(to: entity.getArrayOfVisionPoints()[0])
    
    let totalElements = entity.getArrayOfVisionPoints().count
    
    for index in 0..<entity.getArrayOfVisionPoints().count{
        let square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
        myPath.addLine(to: entity.getArrayOfVisionPoints()[index])
    }
    
    let visualCone = SKShapeNode(path: myPath.cgPath)
    visualCone.fillColor = .green
    visualCone.strokeColor = .green
    visualCone.zPosition = 20
    visualCone.name = entity.name!+"visualCone"
    
    scene.addChild(visualCone)
}

func createVisionCone(entity: Guard, scene: SKScene){
    var myPath = UIBezierPath()
    
    myPath.move(to: entity.position)
            
    for index in 0..<entity.getArrayOfVisionPoints().count{
        let square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
        myPath.addLine(to: entity.getArrayOfVisionPoints()[index])
    }
    
    myPath.addLine(to: entity.position)
    
    let visualCone = SKShapeNode(path: myPath.cgPath)
    visualCone.fillColor = .green
    visualCone.strokeColor = .green
    visualCone.zPosition = 20
    visualCone.name = entity.name!+"visualCone"
    
    scene.addChild(visualCone)
}


func rayCasting(myX: CGFloat, myY: CGFloat, entity: Guard, scene: SKScene){
    
    let intersectedBody = scene.physicsWorld.body(alongRayStart: entity.position, end: CGPoint(x: myX, y: myY))
    if(intersectedBody != nil){
        scene.physicsWorld.enumerateBodies(alongRayStart: entity.position, end: CGPoint(x: myX, y: myY)){ body, point, vector, object in
            if(intersectedBody?.node?.name! == body.node?.name){
                entity.appendToArrayOfPoints(point: point)
            } else if(intersectedBody?.node?.name! == "player"){
                entity.setPlayerFoundTrue()
                
            }
            
        }
    } else {
        var square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
        entity.appendToArrayOfPoints(point: CGPoint(x: myX, y: myY))
        
    }
    
//        if(scene?.physicsWorld.body(alongRayStart: entity.position, end: CGPoint(x: myX, y: myY)) != nil){
//            self.physicsWorld.enumerateBodies(alongRayStart: entity.position, end: CGPoint(x: myX, y: myY)){ body, point, vector, object in
//                if(body.node?.name == "player"){
////                    print("Trovato")
//                    entity.plyaerFound = true
//
//                }
//                entity.arrayOfPoints.append(point)
//            }
//        } else {
//            var square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
//            entity.arrayOfPoints.append(CGPoint(x: myX, y: myY))
//
//        }
    
    
}
