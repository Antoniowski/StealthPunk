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

enum RoomArchetype: Int{
    case SIMPLE_1 = 0
}

enum RoomsType: Int{
    case NORMAL = 0
    case START = 1
    case END = 2
}

struct DoorPosition{
    var UP: Bool = false
    var DOWN: Bool = false
    var RIGHT: Bool = false
    var LEFT: Bool = false
}


class Room {
    
    private var door : DoorPosition = DoorPosition()
    private var tipe : RoomsType = .NORMAL
    private var archetype: RoomArchetype = .SIMPLE_1
    
    private var numRighe : Int = 0
    private var numColonne : Int = 0
    private var stanza : [[Int]] = []
    private var nemici : [Guard] = []
    private var oggetti : [InteractableObject] = []
    
    //TEXTURES
    private var frontWallTexture: SKTexture = SKTexture()
    private var sideLeftWallTexture: SKTexture = SKTexture()
    private var sideRightWallTexture: SKTexture = SKTexture()
    private var cornerLeftWallTexture: SKTexture = SKTexture()
    private var cornerRightWallTexture: SKTexture = SKTexture()
    private var frontWallLightTexture: SKTexture = SKTexture()
    private var floorTexture: SKTexture = SKTexture()
    private var carpetTexture: [SKTexture] = []

    
    init(_ archetype: RoomArchetype, scene: SKScene){
        switch archetype {
        case .SIMPLE_1:
            door = DoorPosition(UP: true, DOWN: true, RIGHT: false, LEFT: false)
            tipe = .NORMAL
            numRighe = 15
            numColonne = 15
            stanza = [[]]
            nemici = []
            createRooms(righe: numRighe, colonne: numRighe, matrice: stanza, scene: scene)
        }
    }
    
    
    //TODO: AGGIUSTARE LO SPAWN
    private func createRooms(righe :Int, colonne :Int, matrice :[[Int]], scene :SKScene){
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
    
    private func createRoom(scene: SKScene){
        for i in 0..<numRighe{
            for j in 0..<numColonne{
                if stanza[i][j] != 0{
                    let floor = SKSpriteNode(texture: floorTexture, size: CGSize(width: blocco, height: blocco))
                    floor.name = "floorTile"
                    floor.zPosition = 1
                    floor.position = CGPoint(x: 0, y: 0)
                }
                switch stanza[i][j]{
                case 1:
                    print("")
                default:
                    print("")
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

