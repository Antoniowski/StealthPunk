//
//  classRoom.swift
//  StealthProject
//
//  Created by Gennaro Cirillo on 09/05/22.
//

import Foundation
import SpriteKit
import GameplayKit
import SwiftUI

enum roomsType: Int{
    case NORMAL = 0
    case START = 1
    case END = 2
}

enum doorPosition: Int{
    case UP = 0
    case DOWN = 1
    case RIGHT = 2
    case LEFT = 3
    case NOT = 4
}


class Room {
    
    private var door : doorPosition = .DOWN
    private var tipy : roomsType = .NORMAL
    
    private var numRighe : Int = 0
    private var numColonne : Int = 0
    private var stanza : [[Int]] = []
    private var nemici : [Guard] = []
    private var oggetti : [InteractableObject] = []
    
    func createRooms(righe :Int, colonne :Int, matrice :[[Int]], scene :SKScene){
        for index in 0...matrice.count-1{
            for index2 in 0...matrice[1].count-1{
                if(matrice[index][index2] == 1){
                    let myWall = SKShapeNode(rectOf: CGSize(width: 30, height: 30))
                    myWall.strokeColor = .systemGray3
                    myWall.fillColor = .systemGray3
                    myWall.name = "wall"+String(index)+String(index2)
                    myWall.zPosition = 5
                    myWall.position = CGPoint(x: scene.size.width * 0 + CGFloat(30*index2) + 30/2, y: scene.size.height - CGFloat(30*index) + 30/2)
                    myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 30, height: 30))
                    myWall.physicsBody?.restitution = 0
                    myWall.physicsBody?.affectedByGravity = false
                    myWall.physicsBody?.isDynamic = true
                    scene.addChild(myWall)
                    
                }
                
                if(matrice[index][index2] == 2){
                    var player1 = SKShapeNode(rectOf: CGSize(width: 20, height: 20))
                    player1.zPosition = 10
                    player1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
                    player1.physicsBody?.affectedByGravity = false
                    player1.position = CGPoint(x: scene.size.width * 0 + CGFloat(30*index2) + 30/2, y: scene.size.height - CGFloat(30*index) + 30/2)
                    player1.strokeColor = .blue
                    player1.name = "player"
                    player1.fillColor = .blue
                    scene.addChild(player1)
                }
                
                if(matrice[index][index2] == 3){
                    var nemico1 = Guard(imageNamed: "boyFront")
                    nemico1.zPosition = 10
                    nemico1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
                    nemico1.physicsBody?.affectedByGravity = false
                    nemico1.position = CGPoint(x: scene.size.width * 0 + CGFloat(30*index2) + 30/2, y: scene.size.height - CGFloat(30*index) + 30/2)
                    nemico1.setVisionConeRadius(150)
                    nemico1.name = "cattivone" + String(index) + String(index2)
                    nemico1.size.width = nemico1.size.width/10
                    nemico1.size.height = nemico1.size.height/10
                    
                    scene.addChild(nemico1)
                    
                }
                
            }
        }
    }
    
    func getRighe() -> Int{
        return self.numRighe
    }
    
    func getColonne() -> Int{
        return self.numColonne
    }
    
    func getEnemy() -> [Guard]{
        return self.nemici
    }
    
    func getOggetti() -> [InteractableObject]{
        return self.oggetti
    }
    
    func getStanza() -> [[Int]]{
        return self.stanza
    }
    
    func setRighe(_ righe :Int ){
        self.numRighe = righe
    }
    
    func setColonne(_ colonne :Int){
        self.numColonne = colonne
    }
}

