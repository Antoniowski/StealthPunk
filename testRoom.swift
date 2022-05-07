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
    var roomWalls2: [[Int]] = []
    var roomWalls3: [[Int]] = []
    
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
        
        roomWalls2 = [Array(repeating: 1, count: 50),
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      [1] + Array(repeating: 0, count: 48)+[1],
                      Array(repeating: 1, count: 50)]
        
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
//        createNPC()
        
        
    }
    
    
    func createRoom(){
        for index in 0...roomWalls2.count-1{
            for index2 in 0...roomWalls2[1].count-1{
                    if(roomWalls2[index][index2] == 1){
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
        for index in 0...roomWalls2.count-1{
            for index2 in 0...roomWalls2[1].count-1{
                    if(roomWalls2[index][index2] == 0){
                        let myWall = SKShapeNode(rectOf: CGSize(width: 30, height: 30))
                        myWall.strokeColor = .orange
                        myWall.fillColor = .orange
                        myWall.name = "wall"+String(index)+String(index2)
                        myWall.zPosition = 4
                        myWall.position = CGPoint(x: size.width * 0 + CGFloat(30*index2) + 30/2, y: size.height - CGFloat(30*index) + 30/2)
                        addChild(myWall)
                        
                    }
                }
            }
        
        for index in 0...roomWalls3.count-1{
            for index2 in 0...roomWalls3[1].count-1{
                    if(roomWalls2[index][index2] == 1){
                        let myWall = SKShapeNode(rectOf: CGSize(width: 30, height: 30))
                        myWall.strokeColor = .blue
                        myWall.fillColor = .blue
                        myWall.name = "wall"+String(index)+String(index2)
                        myWall.zPosition = 4
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
                        player1.fillColor = .blue
                        addChild(player1)
                            
                    }
                if(roomWalls[index3][index4] == 3){
                    var nemico1 = SKShapeNode(rectOf: CGSize(width: 20, height: 20))
                    nemico1.zPosition = 10
                    nemico1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
                    nemico1.physicsBody?.affectedByGravity = false
                    nemico1.position = CGPoint(x: size.width * 0 + CGFloat(30*index4) + 30/2, y: size.height - CGFloat(30*index3) + 30/2)
                    nemico1.strokeColor = .red
                    nemico1.fillColor = .red
                    addChild(nemico1)
                        
                }
            }
    }
                   }
}


