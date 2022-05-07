//
//  testRoom.swift
//  StealthProject
//
//  Created by Gennaro Cirillo on 06/05/22.
//

import Foundation
import SpriteKit
import GameplayKit

class Piano1: SKScene {
    
    
    var roomWalls : [[Int]] = []
    
    override func didMove(to view: SKView) {
        

        
        
        roomWalls =  [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
                      [1, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1],
                      [1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1],
                      [1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1],
                      [1, 0, 0, 3, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1],
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
        
        createRoom()
        createNPC()
        
        var cazzillo : SKSpriteNode = SKSpriteNode(imageNamed: "boyFront")
        cazzillo.size.width = cazzillo.size.width/10
        cazzillo.size.height = cazzillo.size.height/10
                    
            cazzillo.position = CGPoint(x: frame.size.width/2 - 300 , y: frame.size.height/2 + 10)
            addChild(cazzillo)
            
            // 2
            let path = CGMutablePath()
        path.move(to: CGPoint(x: -100, y: 0))
            path.addLine(to: CGPoint(x: -100, y: 0))
            let followLine = SKAction.follow(path, speed: 50.0)
                
            // 3
            let reversedLine = followLine.reversed()
                
            // 4
            let square = UIBezierPath(rect: CGRect(x: 0,y: 0, width: 300, height: 0))
            let followSquare = SKAction.follow(square.cgPath, asOffset: true, orientToPath: false, duration: 5.0)
                
            // 5
            let circle = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 100), cornerRadius: 100)
            let followCircle = SKAction.follow(circle.cgPath, asOffset: true, orientToPath: false, duration: 5.0)
                
            // 6
            cazzillo.run(SKAction.repeatForever(followSquare))
            
        
    }
    
    
    func createRoom(){
        for index in 0...roomWalls.count-1{
            for index2 in 0...roomWalls[1].count-1{
                if(roomWalls[index][index2] == 1){
                    let myWall = SKShapeNode(rectOf: CGSize(width: 30, height: 30))
                    myWall.strokeColor = .systemGray3
                    myWall.fillColor = .systemGray3
                    myWall.name = "wall"+String(index)+String(index2)
                    myWall.zPosition = 5
                    myWall.position = CGPoint(x: size.width * 0 + CGFloat(30*index2) + 30/2, y: size.height - CGFloat(30*index) + 30/2)
                    myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 30, height: 30))
                    myWall.physicsBody?.restitution = 0
                    myWall.physicsBody?.affectedByGravity = false
                    myWall.physicsBody?.isDynamic = true
                    addChild(myWall)
                    
                }
            }
        }
    }
    
    func createNPC(){
        for index3 in 0...roomWalls.count-1{
            for index4 in 0...roomWalls[1].count-1{
                if(roomWalls[index3][index4] == 2){
                    var player1 = SKShapeNode(rectOf: CGSize(width: 20, height: 20))
                    player1.zPosition = 10
                    player1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
                    player1.physicsBody?.affectedByGravity = false
                    player1.position = CGPoint(x: size.width * 0 + CGFloat(30*index4) + 30/2, y: size.height - CGFloat(30*index3) + 30/2)
                    player1.strokeColor = .blue
                    player1.name = "player"
                    player1.fillColor = .blue
                    addChild(player1)
                    
                }
                if(roomWalls[index3][index4] == 3){
                    var nemico1 = Guard(imageNamed: "boyFront")
                    nemico1.zPosition = 10
                    nemico1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
                    nemico1.physicsBody?.affectedByGravity = false
                    nemico1.position = CGPoint(x: size.width * 0 + CGFloat(30*index4) + 30/2, y: size.height - CGFloat(30*index3) + 30/2)
                    nemico1.setVisionConeRadius(150)
                    nemico1.name = "cattivone" + String(index3) + String(index4)
                    nemico1.size.width = nemico1.size.width/10
                    nemico1.size.height = nemico1.size.height/10
                    
                    addChild(nemico1)
                    
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
//        enumerateChildNodes(withName: "*cattivone*"){node, _ in
//            print("mannagg u bucchin 2")
////            let nodeName = node.name
////            if(node.name != nil){
////                if(node.name!.contains("cattivone")){
//////                    print(node.name)
////                    visionCone(entity: node as! Guard, scene: self)
////                }
//////                if(nodeName!.contains("cattivone")){
//////                    visionCone(entity: node as! Guard , scene: self)
//////                }
////            }
//
//            if(node.name!.contains("cattivone")){
//                    print("mannagg u bucchin")
//                visionCone(entity: node as! Guard, scene: self)
//            }
//        }
    }
}


