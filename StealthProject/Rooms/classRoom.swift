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
    private var doorTexture: SKTexture = SKTexture()
    private var frontWallTexture: SKTexture = SKTexture()
    private var sideLeftWallTexture: SKTexture = SKTexture()
    private var sideRightWallTexture: SKTexture = SKTexture()
    private var cornerLeftWallTexture: SKTexture = SKTexture()
    private var cornerRightWallTexture: SKTexture = SKTexture()
    private var frontWallLightTexture: SKTexture = SKTexture()
    private var floorTexture: SKTexture = SKTexture()
    private var carpetTexture: [SKTexture] = []

    
    init(_ archetype: RoomArchetype, scene: SKScene, startingPosition: CGPoint){
        switch archetype {
        case .SIMPLE_1:
            door = DoorPosition(UP: true, DOWN: true, RIGHT: false, LEFT: false)
            tipe = .NORMAL
            numRighe = 15
            numColonne = 15
            stanza = simple1Matrix
            nemici = []
            self.frontWallTexture = SKTexture(imageNamed: "wall")
            self.floorTexture = SKTexture(imageNamed: "pavimento2")
            self.sideRightWallTexture = SKTexture(imageNamed: "wallR")
            self.sideLeftWallTexture  = SKTexture(imageNamed: "wallL")
            self.cornerRightWallTexture = SKTexture(imageNamed: "wallAngleR")
            self.cornerLeftWallTexture = SKTexture(imageNamed: "wallAngleL")
            createRoom(scene: scene, startingPosition: startingPosition)
        }
    }
    
    
    //TODO: AGGIUSTARE LO SPAWN
    private func createRoom(scene: SKScene, startingPosition: CGPoint){
        for i in 0..<stanza.count{
            for j in 0..<stanza[1].count{
                if stanza[i][j] != 0{
                    let floor = SKSpriteNode(texture: floorTexture, size: CGSize(width: blocco, height: blocco))
                    floor.name = "floorTile"
                    floor.zPosition = 1
                    floor.position = CGPoint(x: startingPosition.x + Double(j * blocco) - Double(blocco/2) , y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    scene.addChild(floor)
                }
                switch stanza[i][j]{
                    //FRONT WALL
                case 1:
                    let wall = SKSpriteNode(texture: frontWallTexture, size: bloccoSize)
                    wall.name = "wall"
                    wall.zPosition = 2
                    wall.position = CGPoint(x: startingPosition.x + Double(j*blocco) - Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    wall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    wall.physicsBody?.isDynamic = false
                    wall.physicsBody?.affectedByGravity = false
                    scene.addChild(wall)
                    
                case 2:
                    let leftAngle = SKSpriteNode(texture: cornerLeftWallTexture, size: bloccoSize)
                    leftAngle.name = "wall"
                    leftAngle.zPosition = 2
                    leftAngle.position = CGPoint(x: startingPosition.x + Double(j*blocco) - Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    leftAngle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    leftAngle.physicsBody?.isDynamic = false
                    leftAngle.physicsBody?.affectedByGravity = false
                    scene.addChild(leftAngle)
                case 3:
                    let myWall = SKSpriteNode(texture: cornerRightWallTexture, size: bloccoSize)
                    myWall.name = "wall"
                    myWall.zPosition = 2
                    myWall.position = CGPoint(x: startingPosition.x + Double(j*blocco) - Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    myWall.physicsBody?.affectedByGravity = false
                    myWall.physicsBody?.isDynamic = false
                    scene.addChild(myWall)
                case 4:
                    let myWall = SKSpriteNode(texture: sideLeftWallTexture, size: bloccoSize)
                    myWall.name = "wall"
                    myWall.zPosition = 2
                    myWall.position = CGPoint(x: startingPosition.x + Double(j*blocco) - Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: -blocco/3, y: 0))
                    if i == 1{
                        myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco*2), center: CGPoint(x: -blocco/3, y: 0))
                    }
                    myWall.physicsBody?.affectedByGravity = false
                    myWall.physicsBody?.isDynamic = false
                    scene.addChild(myWall)
                case 5:
                    let myWall = SKSpriteNode(texture: sideRightWallTexture, size: bloccoSize)
                    myWall.name = "wall"
                    myWall.zPosition = 2
                    myWall.position = CGPoint(x: startingPosition.x + Double(j*blocco) - Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: blocco/3, y: 0))
                    if i == 1{
                        myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco*2), center: CGPoint(x: blocco/3, y: 0))
                    }
                    myWall.physicsBody?.affectedByGravity = false
                    myWall.physicsBody?.isDynamic = false
                    scene.addChild(myWall)
                case 7:
                    let door = SKSpriteNode(texture: doorTexture, size: bloccoSize)
                    door.name = "door"
                    door.zPosition = 2
                    door.position = CGPoint(x: startingPosition.x + Double(j*blocco) - Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    door.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: blocco/3, y: 0))
                    if i == 1{
                        door.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco*2), center: CGPoint(x: blocco/3, y: 0))
                    }
                    door.physicsBody?.affectedByGravity = false
                    door.physicsBody?.isDynamic = false
                    scene.addChild(door)
                    
                    
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
