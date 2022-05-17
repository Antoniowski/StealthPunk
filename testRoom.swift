//
//  testRoom.swift
//  StealthProject
//
//  Created by Gennaro Cirillo on 06/05/22.
//

import Foundation
import SpriteKit
import GameplayKit

let enemyDimensionWidth: Double = 24
let enemyDimensionHeight: Double = 48

let blockDimension: Int = 60


class Piano1: SKScene {
    var roomWalls : [[Int]] = []
    var roomWalls2: [[Int]] = []
    var roomWalls3: [[Int]] = []
//    var player = Human()
//    var scenecamera: SKCameraNode = SKCameraNode()
    
    let guard1: GuardConoGrande = GuardConoGrande(texture: SKTexture(imageNamed: "ConoGrandeFrontF2"), color: .clear, size: CGSize(width: enemyDimensionWidth, height: enemyDimensionHeight))
    
    
    
    
    override func didMove(to view: SKView) {
        roomWalls =  [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
                      [1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1],
                      [1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1],
                      [1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1],
                      [1, 0, 0, 51, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1],
                      [1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1],
                      [1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1],
                      [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1],
                      [1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 3, 0, 0, 0, 0, 0, 0, 1],
                      [1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 2, 1],
                      [1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1],
                      [1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1],
                      [1, 0, 0, 0, 0, 0, 3, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1],
                      [1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1],
                      [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]]
                
        roomWalls3 = [[0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
                      [0 ,1 ,1 ,1 ,1 ,1,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
                      [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
                      [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
                      [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
                      [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
                      [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
                      [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
                      [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
                      [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
                      [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0]]
        
        
     
        createRoom()
        
        guard1.run(.setTexture(SKTexture(imageNamed: "ConoGrandeBackF1")))
        
        createPath(entity: guard1, arrayOfActions:
                    [myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y: 6), angle: -90),
                     myAction(actionType: ActionType.PATH_ACTION, duration: 2, startingPoint: CGPoint(x: 3, y: 3), endingPoint: CGPoint(x: 7, y: 3), angle: 0),
                     myAction(actionType: ActionType.WAIT_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y: 6), angle: 90),
                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y: 5), angle: 0),
                     myAction(actionType: ActionType.PATH_ACTION, duration: 2, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y:  5), angle: -135),
                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y:  5), angle: 45),
                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y:  0), angle: -45),
                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 13, y: 5), endingPoint: CGPoint(x: 7, y:  5), angle: -90),
                     myAction(actionType: ActionType.PATH_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 13, y:  5), angle: -270),
                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 13, y:  5), angle: 90),
                     myAction(actionType: ActionType.PATH_ACTION, duration: 1, startingPoint: CGPoint(x: 13, y: 5), endingPoint: CGPoint(x: 7, y:  5), angle: -270),
                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 13, y:  5), angle: 180),
                     myAction(actionType: ActionType.PATH_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 7, y:  3), angle: -180),
                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 7, y:  3), angle: 90),
                     myAction(actionType: ActionType.PATH_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 3, y:  3), angle: -180)])
        
                
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0 , y: 180))
        let followLine = SKAction.follow(path, duration: 2.0)
        
        
            // 4
            let square = UIBezierPath(rect: CGRect(x: 0,y: 0, width: 220, height: 0))
            let followSquare = SKAction.follow(square.cgPath, asOffset: true, orientToPath: false, duration: 5.0)
        
        let square2 = UIBezierPath(rect: CGRect(x: 0,y: 0, width: 0, height: 180))
        let followSquare2 = SKAction.follow(square2.cgPath, asOffset: true, orientToPath: false, duration: 5.0)
                
            // 5
            let circle = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 100), cornerRadius: 100)
            let followCircle = SKAction.follow(circle.cgPath, asOffset: true, orientToPath: false, duration: 5.0)
                
            // 6
        let percorso = SKAction.sequence([followSquare,followSquare2])
//            cazzillo.run(SKAction.repeatForever(percorso))
        let percorso2 = SKAction.sequence([followLine, ])
//        cazzillo.run(followLine)
//        cazzillo.run(.repeatForever(followSquare2))
            
        
        
//        guard1.run(.repeatForever(.animate(with: guard1.walkingAnimationRight, timePerFrame: 0.125)))
        
    }
    
    
    func createRoom(){
        for index in 0...roomWalls.count-1{
            for index2 in 0...roomWalls[1].count-1{
                    if(roomWalls[index][index2] == 1){
                        let myWall = SKShapeNode(rectOf: CGSize(width: blockDimension, height: blockDimension))
                        myWall.strokeColor = .systemGray3
                        myWall.fillColor = .systemGray3
                        myWall.name = "wall"+String(index)+String(index2)
                        myWall.zPosition = 5
                        myWall.position = CGPoint(x: size.width * 0 + CGFloat(blockDimension*index2) + CGFloat(blockDimension/2), y: size.height - CGFloat(blockDimension*index) + CGFloat(blockDimension/2))
                        myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blockDimension, height: blockDimension))
                        myWall.physicsBody?.restitution = 0
                        myWall.physicsBody?.affectedByGravity = false
                        myWall.physicsBody?.isDynamic = true
                        addChild(myWall)
                        
                    }
                
                if(roomWalls[index][index2] == 2){
                    var player1 = SKShapeNode(rectOf: CGSize(width: 20, height: 20))
                    player1.zPosition = 10
                    player1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
                    player1.physicsBody?.affectedByGravity = false
                    player1.position = CGPoint(x: size.width * 0 + CGFloat(blockDimension*index2) + CGFloat(blockDimension/2), y: size.height - CGFloat(blockDimension*index) + CGFloat(blockDimension/2))
                    player1.strokeColor = .blue
                    player1.name = "player"
                    player1.fillColor = .blue
                    addChild(player1)
                    
                }
                
                
                if(roomWalls[index][index2] == 51){
                    guard1.zPosition = 10
                    guard1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: enemyDimensionWidth, height: enemyDimensionHeight))
                    guard1.physicsBody?.affectedByGravity = false
                    guard1.position = CGPoint(x: size.width * 0 + CGFloat(blockDimension*index2) + CGFloat(blockDimension/2), y: size.height - CGFloat(blockDimension*index) + CGFloat(blockDimension/2))
                    guard1.name = "cattivone" + String(index) + String(index2)
                    
                    addChild(guard1)
                }

                
                }
            }
        }
    
    
    func createStraightPath(startRow: Int, startColumn: Int, endRow: Int, endColumn: Int){
//        guard1.set5
        
        let initMovement = SKAction.customAction(withDuration: 0.01, actionBlock: {
            node, elapsedTime in
            self.guard1.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
        })
        
        let idleMovement = SKAction.customAction(withDuration: 0.01, actionBlock: {
            node, elapsedTime in
            self.guard1.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.IDLE)
        })
        
//        guard1.getCenterBall().zRotation = 3.14 * (-90) / 180
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (endColumn - startColumn)*blockDimension, y: 0))
        let waitAction = SKAction.wait(forDuration: 2)
        let customAction1 = SKAction.customAction(withDuration: 0.01, actionBlock: {
            node, elapsedTime in
            self.guard1.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
            self.guard1.setGuardMovementDirection(movementDirection: Direction.RIGHT)
        })
        let customAction2 = SKAction.customAction(withDuration: 0.01, actionBlock: {
            node, elapsedTime in
            self.guard1.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
            self.guard1.setGuardMovementDirection(movementDirection: Direction.LEFT)
        })
        let followLine = SKAction.follow(path, asOffset: true, orientToPath: false, duration: 2)
        let rotateMinus90 = SKAction.rotate(byAngle: 3.14 * (-90) / 180, duration: 1)
        let reversedFollowLine = followLine.reversed()
        let upperRightRotate = SKAction.rotate(byAngle: 3.14 * 90 / 180, duration: 1)
        let upperRightRotateDown = SKAction.rotate(byAngle: 3.14 * (-60) / 180, duration: 2)
        let upperRightRotateUp = SKAction.rotate(byAngle: 3.14 * 30 / 180, duration: 2)
        let upperRightRotateLeft = SKAction.rotate(byAngle: 3.14 * 120 / 180, duration: 2)
        let resetRotation = SKAction.rotate(byAngle: 3.14 * (-180) / 180, duration: 2)
        let mySequence = SKAction.sequence([waitAction ,  rotateMinus90, customAction1, followLine, idleMovement, waitAction, upperRightRotate, upperRightRotateDown, upperRightRotateUp, upperRightRotateLeft, customAction2, reversedFollowLine, idleMovement])
        guard1.getCenterBall().run(.repeatForever(mySequence))
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        visionCone(entity: guard1, scene: self)
        
        guard1.checkState() 
        
        
//        enumerateChildNodes(withName: "*cattivone*"){node, _ in
//            let nodeName = node.name
//            if(node.name != nil){
//                if(node.name!.contains("cattivone")){
////                    print(node.name)
//                    visionCone(entity: node as! Guard, scene: self)
//                }
////                if(nodeName!.contains("cattivone")){
////                    visionCone(entity: node as! Guard , scene: self)
////                }
//            }
//
//            if(node.name!.contains("cattivone")){
//                    print("mannagg u bucchin")
//                visionCone(entity: node as! Guard, scene: self)
//            }
//        }
    }
}



