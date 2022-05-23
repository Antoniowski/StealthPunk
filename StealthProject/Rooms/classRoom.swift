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
    case FIRST = 0
    case FIRST_2 = 1
    case FIRST_3 = 2
    case FIRST_4 = 3
    case SIMPLE_1 = 4
    case SIMPLE_2 = 5
    case SIMPLE_3 = 6
    case SIMPLE_4 = 7
    case SIMPLE_5 = 8
    case SIMPLE_6 = 9
    case SIMPLE_7 = 18
    case PROVA1 = 10
    case PROVA2 = 11
    case PROVA3 = 12
    case PROVA4 = 13
    case SCAMBIO1 = 14
    case SCAMBIO2 = 15
    case SCAMBIO3 = 16
    case SCAMBIO4 = 17
    case LOBBY = 19
}

enum RoomsType: Int{
    case NORMAL = 0
    case START = 1
    case END = 2
}

enum DoorPlacement: Int{
    case UP = 0
    case DOWN = 1
    case LEFT = 2
    case RIGHT = 3
}

struct DoorPosition{
    var UP: Bool = false
    var DOWN: Bool = false
    var RIGHT: Bool = false
    var LEFT: Bool = false
}


class Room: SKNode {
    
    private var door : DoorPosition = DoorPosition()
    private var tipe : RoomsType = .NORMAL
    private var archetype: RoomArchetype = .SIMPLE_1
    private var floor: FloorType = .FIRST_FLOOR
    
    private var numRighe : Int = 0
    private var numColonne : Int = 0
    private var stanza : Matrix = []
    private var pavimento: Matrix = []
    private var nemici : [Guard] = []
    private var oggetti : [InteractableObject] = []
    private var startingPosition: CGPoint = .zero
    
    private var doorPositionPoints: [(placement: DoorPlacement, point: CGPoint, isOccupied: Bool)] = []
    
    //TEXTURES
    private var frontDoorTexture: SKTexture = SKTexture()
    private var leftDoorTexture: SKTexture = SKTexture()
    private var rightDoorTexture: SKTexture = SKTexture()
    private var frontWallTexture: SKTexture = SKTexture()
    private var sideLeftWallTexture: SKTexture = SKTexture()
    private var sideRightWallTexture: SKTexture = SKTexture()
    private var cornerLeftWallTexture: SKTexture = SKTexture()
    private var cornerRightWallTexture: SKTexture = SKTexture()
    private var frontWallLightTexture: SKTexture = SKTexture()
    private var floorTexture: SKTexture = SKTexture()
    private var carpetTexture: [SKTexture] = []
    private var internalAngledx: SKTexture = SKTexture()
    private var internalAnglesx: SKTexture = SKTexture()
    private var internalAngledx2: SKTexture = SKTexture()
    private var internalAnglesx2: SKTexture = SKTexture()
    
    private var frontDoorTextureMap: SKTexture = SKTexture()
    private var leftDoorTextureMap: SKTexture = SKTexture()
    private var rightDoorTextureMap: SKTexture = SKTexture()
    private var frontWallTextureMap: SKTexture = SKTexture()
    private var sideLeftWallTextureMap: SKTexture = SKTexture()
    private var sideRightWallTextureMap: SKTexture = SKTexture()
    private var cornerLeftWallTextureMap: SKTexture = SKTexture()
    private var cornerRightWallTextureMap: SKTexture = SKTexture()
    private var frontWallLightTextureMap: SKTexture = SKTexture()
    private var floorTextureMap: SKTexture = SKTexture()
    private var carpetTextureMap: [SKTexture] = []
    private var internalAngledxMap: SKTexture = SKTexture()
    private var internalAnglesxMap: SKTexture = SKTexture()
    private var internalAngledx2Map: SKTexture = SKTexture()
    private var internalAnglesx2Map: SKTexture = SKTexture()
    
    init(_ archetype: RoomArchetype, startingPosition: CGPoint, floor: FloorType){
        super.init()
        self.name = "ROOM"
        self.startingPosition = startingPosition
        self.floor = floor
        self.physicsBody = SKPhysicsBody()
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.affectedByGravity = false
        switch archetype {
        case .FIRST:
            door = DoorPosition(UP: true, DOWN: false, RIGHT: false, LEFT: false)
            tipe = .START
            numRighe = simple1Matrix[1].count
            numColonne = simple1Matrix.count
            stanza = simple1Matrix
            nemici = []
            setTextures(tipo: floor)
            self.createRoom()
        case .FIRST_2:
            door = DoorPosition(UP: true, DOWN: true, RIGHT: false, LEFT: false)
            tipe = .START
            numRighe = simple1Matrix[1].count
            numColonne = simple1Matrix.count
            stanza = simple1Matrix
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .FIRST_3:
            door = DoorPosition(UP: true, DOWN: true, RIGHT: true, LEFT: false)
            tipe = .START
            numRighe = simple1Matrix[1].count
            numColonne = simple1Matrix.count
            stanza = simple1Matrix
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .FIRST_4:
            door = DoorPosition(UP: true, DOWN: true, RIGHT: true, LEFT: true)
            tipe = .START
            numRighe = simple1Matrix[1].count
            numColonne = simple1Matrix.count
            stanza = simple1Matrix
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .SIMPLE_1:
            door = DoorPosition(UP: true, DOWN: true, RIGHT: false, LEFT: false)
            tipe = .NORMAL
            numRighe = simple1Matrix[1].count
            numColonne = simple1Matrix.count
            stanza = simple1Matrix
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .SIMPLE_2:
            door = DoorPosition(UP: true, DOWN: true, RIGHT: false, LEFT: false)
            tipe = .NORMAL
            numRighe = simple2Matrix[1].count
            numColonne = simple2Matrix.count
            stanza = simple2Matrix
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .SIMPLE_3:
            door = DoorPosition(UP: false, DOWN: true, RIGHT: true, LEFT: true)
            tipe = .NORMAL
            numRighe = simple3Matrix[1].count
            numColonne = simple3Matrix.count
            stanza = simple3Matrix
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .SIMPLE_4:
            door = DoorPosition(UP: true, DOWN: false, RIGHT: true, LEFT: true)
            tipe = .NORMAL
            numRighe = simple4Matrix[1].count
            numColonne = simple4Matrix.count
            stanza = simple4Matrix
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .SIMPLE_5:
            door = DoorPosition(UP: false, DOWN: true, RIGHT: false, LEFT: true)
            tipe = .NORMAL
            numRighe = simple5Matrix[1].count
            numColonne = simple5Matrix.count
            stanza = simple5Matrix
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .SIMPLE_6:
            door = DoorPosition(UP: false, DOWN: true, RIGHT: true, LEFT: false)
            tipe = .NORMAL
            numRighe = simple6Matrix[1].count
            numColonne = simple6Matrix.count
            stanza = simple6Matrix
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .SIMPLE_7:
            door = DoorPosition(UP: false, DOWN: true, RIGHT: true, LEFT: true)
            tipe = .NORMAL
            numRighe = simple7Matrix[1].count
            numColonne = simple7Matrix.count
            stanza = simple7Matrix
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .PROVA1:
            door = DoorPosition(UP: true, DOWN: false, RIGHT: false, LEFT: false)
            tipe = .NORMAL
            numRighe = prova1[1].count
            numColonne = prova1.count
            stanza = prova1
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .PROVA2:
            door = DoorPosition(UP: false, DOWN: true, RIGHT: false, LEFT: false)
            tipe = .NORMAL
            numRighe = prova2[1].count
            numColonne = prova2.count
            stanza = prova2
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .PROVA3:
            door = DoorPosition(UP: false, DOWN: false, RIGHT: false, LEFT: true)
            tipe = .NORMAL
            numRighe = prova3[1].count
            numColonne = prova3.count
            stanza = prova3
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .PROVA4:
            door = DoorPosition(UP: false, DOWN: false, RIGHT: true, LEFT: false)
            tipe = .NORMAL
            numRighe = prova4[1].count
            numColonne = prova4.count
            stanza = prova4
            nemici = []
            setTextures(tipo: floor)
            createRoom()
            
        case .SCAMBIO1:
            door = DoorPosition(UP: false, DOWN: true, RIGHT: false, LEFT: false)
            tipe = .NORMAL
            numRighe = simple1Scambio[1].count
            numColonne = simple1Scambio.count
            stanza = simple1Scambio
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .SCAMBIO2:
            door = DoorPosition(UP: false, DOWN: false, RIGHT: false, LEFT: true)
            tipe = .NORMAL
            numRighe = simple2Scambio[1].count
            numColonne = simple2Scambio.count
            stanza = simple2Scambio
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .SCAMBIO3:
            door = DoorPosition(UP: true, DOWN: false, RIGHT: false, LEFT: false)
            tipe = .NORMAL
            numRighe = simple3Scambio[1].count
            numColonne = simple3Scambio.count
            stanza = simple3Scambio
            nemici = []
            setTextures(tipo: floor)
            createRoom()
        case .SCAMBIO4:
            door = DoorPosition(UP: false, DOWN: false, RIGHT: true, LEFT: false)
            tipe = .NORMAL
            numRighe = simple4Scambio[1].count
            numColonne = simple4Scambio.count
            stanza = simple4Scambio
            nemici = []
            setTextures(tipo: floor)
            createRoom()
            
        case .LOBBY:
            door = DoorPosition(UP: true, DOWN: false, RIGHT: false, LEFT: false)
            self.tipe = .NORMAL
            self.stanza = taverna
            self.pavimento = tavernaPavimento
            numRighe = taverna[1].count
            numColonne = taverna.count
            nemici = []
            setTextureTaverna()
            createRoom()
            addRugsAndLights()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    private func setTextures(){
//        self.frontWallTexture = SKTexture(imageNamed: "wall")
//        self.floorTexture = SKTexture(imageNamed: "pavimento4")
//        self.sideRightWallTexture = SKTexture(imageNamed: "wallR")
//        self.sideLeftWallTexture  = SKTexture(imageNamed: "wallL")
//        self.cornerRightWallTexture = SKTexture(imageNamed: "wallAngleR")
//        self.cornerLeftWallTexture = SKTexture(imageNamed: "wallAngleL")
//        self.frontDoorTexture = SKTexture(imageNamed: "doorClosed")
//        self.leftDoorTexture = SKTexture(imageNamed: "doorLeft")
//        self.rightDoorTexture = SKTexture(imageNamed: "doorRight")
//    }
    
    private func setTextureTaverna(){
        self.frontWallTexture = SKTexture(imageNamed: "parete centrale")
        self.frontWallTextureMap = SKTexture(imageNamed: "parete centrale normal map")
        self.floorTexture = SKTexture(imageNamed: "pavimento taverna")
        self.floorTextureMap = SKTexture(imageNamed: "pavimento taverna normal map")
        self.sideRightWallTexture = SKTexture(imageNamed: "parete lato dx")
        self.sideLeftWallTexture  = SKTexture(imageNamed: "parete lato sx")
        self.cornerRightWallTexture = SKTexture(imageNamed: "parete angolo dx")
        self.cornerRightWallTextureMap = SKTexture(imageNamed: "pareta angolo dx normal map")
        self.cornerLeftWallTextureMap = SKTexture(imageNamed: "pareta angolo sx normal map")
        self.cornerLeftWallTexture = SKTexture(imageNamed: "parete angolo sx")
        self.frontDoorTexture = SKTexture(imageNamed: "porta chiusa")
    }
    
    private func setTextures(tipo : FloorType){
        switch tipo {
            
        case .FIRST_FLOOR:
            self.frontWallTexture = SKTexture(imageNamed: "parete frontaleSu")
            self.frontWallTextureMap = SKTexture(imageNamed: "parete frontaleSu normal map")
            self.floorTexture = SKTexture(imageNamed: "erba")
            self.sideRightWallTexture = SKTexture(imageNamed: "parete LateraleDx")
            self.sideLeftWallTexture  = SKTexture(imageNamed: "parete LateraleSx")
            self.cornerRightWallTexture = SKTexture(imageNamed: "angolo frontaleDxSu")
            self.cornerLeftWallTexture = SKTexture(imageNamed: "angolo frontaleSxSu")
            self.frontDoorTexture = SKTexture(imageNamed: "doorClosed")
            self.leftDoorTexture = SKTexture(imageNamed: "porta laterale")
            self.rightDoorTexture = SKTexture(imageNamed: "porta laterale")
            self.internalAngledx = SKTexture(imageNamed: "angolo interno Dx")
            self.internalAnglesx = SKTexture(imageNamed: "angolo interno Sx")
            self.internalAngledx2 = SKTexture(imageNamed: "angolo interno Dx 2")
            self.internalAnglesx2 = SKTexture(imageNamed: "angolo interno Sx 2")
            
        case .SECOND_FLOOE:
            self.frontWallTexture = SKTexture(imageNamed: "wall")
            self.floorTexture = SKTexture(imageNamed: "pavimento4")
            self.floorTextureMap = SKTexture(imageNamed: "pavimento4NormalMap2")
            self.sideRightWallTexture = SKTexture(imageNamed: "wallR")
            self.sideLeftWallTexture  = SKTexture(imageNamed: "wallL")
            self.cornerRightWallTexture = SKTexture(imageNamed: "wallAngleR")
            self.cornerLeftWallTexture = SKTexture(imageNamed: "wallAngleL")
            self.frontDoorTexture = SKTexture(imageNamed: "doorClosed")
            self.leftDoorTexture = SKTexture(imageNamed: "doorLeft")
            self.rightDoorTexture = SKTexture(imageNamed: "doorRight")
            
        case .LAST_FLOOR:
            self.frontWallTexture = SKTexture(imageNamed: "pavimento2 tappeto lato su")
            self.floorTexture = SKTexture(imageNamed: "pavimento2")
            self.sideRightWallTexture = SKTexture(imageNamed: "pavimento2 tappeto lato dx")
            self.sideLeftWallTexture  = SKTexture(imageNamed: "pavimento2 tappeto lato sx")
            self.cornerRightWallTexture = SKTexture(imageNamed: "pavimento2 tappeto angolo dx su")
            self.cornerLeftWallTexture = SKTexture(imageNamed: "pavimento2 tappeto angolo sx su")
            self.frontDoorTexture = SKTexture(imageNamed: "doorClosed")
            self.leftDoorTexture = SKTexture(imageNamed: "porta laterale")
            self.rightDoorTexture = SKTexture(imageNamed: "porta laterale")
        }
    }
    
    
    //TODO: AGGIUSTARE LO SPAWN
    private func createRoom(){
        for i in 0..<stanza.count{
            for j in 0..<stanza[1].count{
                if stanza[i][j] != 0{
                    let floor = SKSpriteNode(texture: floorTexture, size: CGSize(width: blocco, height: blocco))
                    floor.normalTexture = floorTextureMap
                    floor.name = "floorTile"
                    floor.zPosition = 1
                    floor.position = CGPoint(x: startingPosition.x + Double(j * blocco) + Double(blocco/2) , y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    floor.lightingBitMask = 1 | 2
                    addChild(floor)
                }
                switch stanza[i][j]{
                    //FRONT WALL
                case 1:
                    let wall = SKSpriteNode(texture: frontWallTexture, size: bloccoSize)
                    wall.name = "wall"
                    wall.zPosition = 2
                    wall.normalTexture = frontWallTextureMap
                    wall.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    wall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    wall.physicsBody?.isDynamic = false
                    wall.physicsBody?.affectedByGravity = false
                    wall.lightingBitMask = 1 | 2
                    addChild(wall)
                    
                case 2:
                    let leftAngle = SKSpriteNode(texture: cornerLeftWallTexture, size: bloccoSize)
                    leftAngle.name = "wall"
                    leftAngle.zPosition = 2
                    leftAngle.normalTexture = cornerLeftWallTextureMap
                    leftAngle.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    leftAngle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    leftAngle.physicsBody?.isDynamic = false
                    leftAngle.physicsBody?.affectedByGravity = false
                    leftAngle.lightingBitMask = 1 | 2

                    addChild(leftAngle)
                case 3:
                    let myWall = SKSpriteNode(texture: cornerRightWallTexture, size: bloccoSize)
                    myWall.name = "wall"
                    myWall.zPosition = 2
                    myWall.normalTexture = cornerRightWallTextureMap
                    myWall.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    myWall.physicsBody?.affectedByGravity = false
                    myWall.physicsBody?.isDynamic = false
                    myWall.lightingBitMask = 1 | 2
                    addChild(myWall)
                case 4:
                    let myWall = SKSpriteNode(texture: sideLeftWallTexture, size: bloccoSize)
                    myWall.name = "wall"
                    myWall.zPosition = 3
                    myWall.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: -blocco/3, y: 0))
                    if i == 1{
                        myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco*2), center: CGPoint(x: -blocco/3, y: 0))
                    }
                    myWall.physicsBody?.affectedByGravity = false
                    myWall.physicsBody?.isDynamic = false
                    myWall.lightingBitMask = 1 | 2
                    addChild(myWall)
                case 5:
                    let myWall = SKSpriteNode(texture: sideRightWallTexture, size: bloccoSize)
                    myWall.name = "wall"
                    myWall.zPosition = 3
                    myWall.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: blocco/3, y: 0))
                    if i == 1{
                        myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco*2), center: CGPoint(x: blocco/3, y: 0))
                    }
                    myWall.physicsBody?.affectedByGravity = false
                    myWall.physicsBody?.isDynamic = false
                    myWall.lightingBitMask = 1 | 2
                    addChild(myWall)
                case 7:
//                    let door = SKSpriteNode(texture: frontDoorTexture, size: bloccoSize)
                    let door = Door(.UP, isOpen: false, floor: self.floor)
                    door.name = "door"
                    door.zPosition = 2
                    door.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    doorPositionPoints.append((DoorPlacement.UP,door.position, false))
                    door.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    door.physicsBody?.isDynamic = false
                    door.physicsBody?.affectedByGravity = false
                    door.physicsBody?.allowsRotation = false
                    if self.archetype == .LOBBY{
                        door.run(.setTexture(SKTexture(imageNamed: "porta chiusa")))
                    }
                    door.lightingBitMask = 1 | 2
                    addChild(door)
                case 8:
//                    let door = SKSpriteNode(texture: frontDoorTexture, size: bloccoSize)
                    let door = Door(.DOWN, isOpen: false, floor: self.floor)
                    door.name = "door"
                    door.zPosition = 2
                    door.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    doorPositionPoints.append((.DOWN,door.position, false))
                    door.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    door.physicsBody?.isDynamic = false
                    door.physicsBody?.affectedByGravity = false
                    door.physicsBody?.allowsRotation = false
                    door.lightingBitMask = 1 | 2
                    addChild(door)
                case 9:
//                    let door = SKSpriteNode(texture: leftDoorTexture, size: bloccoSize)
                    let door = Door(.LEFT, isOpen: false, floor: self.floor)
                    door.name = "door"
                    door.zPosition = 2
                    door.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    doorPositionPoints.append((.LEFT,door.position, false))
                    door.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: -blocco/3, y: 0))
                    door.physicsBody?.isDynamic = false
                    door.physicsBody?.affectedByGravity = false
                    door.physicsBody?.allowsRotation = false
                    door.lightingBitMask = 1 | 2
                    addChild(door)
                case 10:
//                    let door = SKSpriteNode(texture: rightDoorTexture, size: bloccoSize)
                    let door = Door(.RIGHT, isOpen: false, floor: self.floor)
                    door.name = "door"
                    door.zPosition = 2
                    door.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    doorPositionPoints.append((.RIGHT,door.position, false))
                    door.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: blocco/3, y: 0))
                    door.physicsBody?.isDynamic = false
                    door.physicsBody?.affectedByGravity = false
                    door.physicsBody?.allowsRotation = false
                    door.lightingBitMask = 1 | 2
                    addChild(door)
                case 11:
                    let door = TavernaDoor()
                    door.size = bloccoSize
                    door.zPosition = 2
//                    door.normalTexture = SKTexture(imageNamed: "porta chiusa normal map")
                    door.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    door.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    door.physicsBody?.isDynamic = false
                    door.physicsBody?.affectedByGravity = false
                    door.physicsBody?.allowsRotation = false
                    door.lightingBitMask = 1 | 2
                    addChild(door)
                case 16:
                    let barile = SKSpriteNode(imageNamed: "bott9")
                    barile.name = "staticObject"
                    barile.size = bloccoSize
                    barile.zPosition = 2
                    barile.normalTexture = SKTexture(imageNamed: "bott9NormalMap")
                    barile.lightingBitMask = 1 | 2
                    barile.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    barile.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    barile.physicsBody?.isDynamic = false
                    barile.physicsBody?.affectedByGravity = false
                    barile.physicsBody?.allowsRotation = false
                    addChild(barile)
                case 21:
                    let barile = SKSpriteNode(imageNamed: "bott9")
                    barile.name = "staticObject"
                    barile.size = bloccoSize
                    barile.zPosition = 2
                    barile.normalTexture = SKTexture(imageNamed: "bott9NormalMap")
                    barile.lightingBitMask = 1 | 2
                    barile.position = CGPoint(x: startingPosition.x + Double(j*blocco) - Double(blocco/4), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    barile.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    barile.physicsBody?.isDynamic = false
                    barile.physicsBody?.affectedByGravity = false
                    barile.physicsBody?.allowsRotation = false
                    addChild(barile)
                case 18:
                    let bancone = SKSpriteNode(imageNamed: "bancone2")
                    bancone.name = "staticObject"
                    bancone.size = bloccoSize
                    bancone.zPosition = 2
                    bancone.normalTexture = SKTexture(imageNamed: "bancone2 normal map")
                    bancone.position = CGPoint(x: startingPosition.x + Double(j*blocco) - Double(blocco/4), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    bancone.physicsBody = SKPhysicsBody(rectangleOf: .init(width: blocco/2, height: blocco))
                    bancone.physicsBody?.isDynamic = false
                    bancone.physicsBody?.affectedByGravity = false
                    bancone.physicsBody?.allowsRotation = false
                    bancone.lightingBitMask = 1 | 2
                    addChild(bancone)
                case 19:
                    let bancone = SKSpriteNode(imageNamed: "bancone")
                    bancone.name = "staticObject"
                    bancone.size = bloccoSize
                    bancone.zPosition = 2
                    bancone.normalTexture = SKTexture(imageNamed: "bancone normal map")
                    bancone.position = CGPoint(x: startingPosition.x + Double(j*blocco) - Double(blocco/4), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    bancone.physicsBody = SKPhysicsBody(rectangleOf: .init(width: blocco/2, height: blocco))
                    bancone.physicsBody?.isDynamic = false
                    bancone.physicsBody?.affectedByGravity = false
                    bancone.physicsBody?.allowsRotation = false
                    bancone.lightingBitMask = 1 | 2
                    addChild(bancone)
                case 17:
                    let tavolo = SKSpriteNode(imageNamed: "tavolino")
                    tavolo.name = "staticObject"
                    tavolo.size = bloccoSize
                    tavolo.zPosition = 2
                    tavolo.normalTexture = SKTexture(imageNamed: "tavolino normal map")
                    tavolo.lightingBitMask = 1 | 2
                    tavolo.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    tavolo.physicsBody = SKPhysicsBody(texture: tavolo.texture ?? SKTexture(), size: tavolo.size)
                    tavolo.physicsBody?.isDynamic = false
                    tavolo.physicsBody?.affectedByGravity = false
                    tavolo.physicsBody?.allowsRotation = false
                    addChild(tavolo)
                case 20:
                    let scrigno = SKSpriteNode(imageNamed: "forziere")
                    scrigno.name = "staticObject"
                    scrigno.size = bloccoSize
                    scrigno.zPosition = 4
                    scrigno.normalTexture = SKTexture(imageNamed: "forziere normal map")
                    scrigno.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco), y: startingPosition.y - Double(i*blocco))
                    scrigno.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    scrigno.physicsBody?.isDynamic = false
                    scrigno.physicsBody?.affectedByGravity = false
                    scrigno.physicsBody?.allowsRotation = false
                    scrigno.lightingBitMask = 1 | 2
//                    let ombraScrigno = SKShapeNode(ellipseIn: .init(x: -blocco/2, y: -blocco/4, width: blocco, height: blocco/4))
//                    ombraScrigno.fillColor = .black
//                    ombraScrigno.strokeColor = .init(red: 0, green: 0, blue: 0, alpha: 0.15)
//                    ombraScrigno.alpha = 0.15
//                    ombraScrigno.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco), y: startingPosition.y - Double(i*blocco) - Double(blocco/4))
//                    ombraScrigno.zPosition = 3
//                    addChild(ombraScrigno)
                    addChild(scrigno)
                    
                case 15:
                    let passaggio = SKShapeNode(rectOf: CGSize(width: 100, height: 100))
                    passaggio.zPosition = 10
                    passaggio.fillColor = .red
                    passaggio.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    addChild(passaggio)
                    
                case 31:
                    let internalAngleDx = SKSpriteNode(texture: internalAngledx, size: bloccoSize)
                    internalAngleDx.name = "wall"
                    internalAngleDx.zPosition = 2
                    internalAngleDx.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    internalAngleDx.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: blocco/3, y: blocco/2))
                    internalAngleDx.physicsBody?.isDynamic = false
                    internalAngleDx.physicsBody?.affectedByGravity = false
                    addChild(internalAngleDx)
                    
                case 32:
                    let internalAngleSx = SKSpriteNode(texture: internalAnglesx, size: bloccoSize)
                    internalAngleSx.name = "wall"
                    internalAngleSx.zPosition = 2
                    internalAngleSx.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    internalAngleSx.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: -blocco/3, y: blocco/2))
                    internalAngleSx.physicsBody?.isDynamic = false
                    internalAngleSx.physicsBody?.affectedByGravity = false
                    addChild(internalAngleSx)
                    
                case 33:
                    let internalAngleDx2 = SKSpriteNode(texture: internalAngledx2, size: bloccoSize)
                    internalAngleDx2.name = "wall"
                    internalAngleDx2.zPosition = 2
                    internalAngleDx2.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    internalAngleDx2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: blocco/3, y: -blocco/6))
                    internalAngleDx2.physicsBody?.isDynamic = false
                    internalAngleDx2.physicsBody?.affectedByGravity = false
                    addChild(internalAngleDx2)
                    
                case 34:
                    let internalAngleSx2 = SKSpriteNode(texture: internalAnglesx2, size: bloccoSize)
                    internalAngleSx2.name = "wall"
                    internalAngleSx2.zPosition = 2
                    internalAngleSx2.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    internalAngleSx2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: -blocco/3, y: -blocco/6))
                    internalAngleSx2.physicsBody?.isDynamic = false
                    internalAngleSx2.physicsBody?.affectedByGravity = false
                    addChild(internalAngleSx2)
                
                case 12:
                    var colonna = StaticObject(texture: SKTexture(imageNamed: "column"), color: .clear, size: .init(width: blocco/2, height: blocco), objectName: "column", objectCategory: .MOBILIO)
                    if self.floor == .FIRST_FLOOR{
                       colonna = StaticObject(texture: SKTexture(imageNamed: "colonna"), color: .clear, size: .init(width: blocco, height: blocco), objectName: "column", objectCategory: .MOBILIO)
                    }
                    colonna.normalTexture = SKTexture(imageNamed: "colonnaNormalMap")
                    colonna.physicsBody = SKPhysicsBody(rectangleOf: .init(width: Double(blocco/2), height: Double(blocco)*0.8), center: CGPoint (x: 0, y: Double(blocco)*0.12))
                    colonna.physicsBody?.affectedByGravity = false
                    colonna.physicsBody?.allowsRotation = false
                    colonna.physicsBody?.isDynamic = false
                    colonna.zPosition = 3
                    colonna.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    colonna.lightingBitMask = 1 | 2
                    addChild(colonna)
                    
                case 13:
                    
                    var furnitureBig = StaticObject(texture: SKTexture(imageNamed: "stand1"), color: .clear, size: .init(width: blocco, height: blocco), objectName: "stand1", objectCategory: .MOBILIO)
                    furnitureBig.physicsBody = SKPhysicsBody(rectangleOf: .init(width: Double(blocco), height: Double(blocco)), center: CGPoint (x: 0, y: Double(blocco) - 0.7*Double(blocco)))
                    furnitureBig.physicsBody?.affectedByGravity = false
                    furnitureBig.physicsBody?.allowsRotation = false
                    furnitureBig.physicsBody?.isDynamic = false
                    if self.floor == .FIRST_FLOOR{
                        furnitureBig = StaticObject(texture: SKTexture(imageNamed: "colonna"), color: .clear, size: .init(width: blocco, height: blocco), objectName: "column", objectCategory: .MOBILIO)
                        furnitureBig.physicsBody = SKPhysicsBody(rectangleOf: .init(width: Double(blocco/2), height: Double(blocco)*0.8), center: CGPoint (x: 0, y: Double(blocco)*0.12))
                        furnitureBig.physicsBody?.affectedByGravity = false
                        furnitureBig.physicsBody?.allowsRotation = false
                        furnitureBig.physicsBody?.isDynamic = false
                    }
                    furnitureBig.zPosition = 3
                    furnitureBig.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    furnitureBig.lightingBitMask = 1 | 2
                    addChild(furnitureBig)
                    
                case 14:
                    var furnitureSmall = StaticObject(texture: SKTexture(imageNamed: "stand2"), color: .clear, size: .init(width: blocco/2, height: blocco), objectName: "stand2", objectCategory: .MOBILIO)
                    furnitureSmall.physicsBody = SKPhysicsBody(rectangleOf: .init(width: Double(blocco), height: Double(blocco)), center: CGPoint (x: 0, y: Double(blocco) - 0.7*Double(blocco)))
                    furnitureSmall.physicsBody?.affectedByGravity = false
                    furnitureSmall.physicsBody?.allowsRotation = false
                    furnitureSmall.physicsBody?.isDynamic = false
                    furnitureSmall.zPosition = 3
                    furnitureSmall.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    furnitureSmall.normalTexture = SKTexture(imageNamed: "stand2NormalMap")
                    if self.floor == .FIRST_FLOOR{
                        furnitureSmall = Lampione(lightBitmask: 1 | 2)
                        furnitureSmall.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
//                        let appoggio = furnitureSmall as? Lampione
//                        appoggio?.light.ambientColor = .init(red: 0.624, green: 0.624, blue: 0.914, alpha: 0.5)
                    }
                    furnitureSmall.zPosition = 3
                    furnitureSmall.lightingBitMask = 1 | 2
                    addChild(furnitureSmall)
                case 40:
                    var armadio: Hideout = Hideout()
                    if Int.random(in: 0...10) > 5{
                        armadio = Cassapanca()
                    }else{
                        armadio = Vetrina()
                    }
                    if floor == .FIRST_FLOOR{
                        armadio = Bush()
                    }
                    armadio.name = "dynamicObject"
                    armadio.zPosition = 3
                    armadio.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    armadio.lightingBitMask = 1 | 2

                    addChild(armadio)
                case 41:
                    var armadio: Hideout = Hideout()
                    if Int.random(in: 0...10) > 5{
                        armadio = Cassapanca()
                    }else{
                        armadio = Vetrina()
                    }
                    if floor == .FIRST_FLOOR{
                        armadio = Bush()
                    }
                    armadio.name = "dynamicObject"
                    armadio.zPosition = 3
                    armadio.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    armadio.lightingBitMask = 1 | 2
                    addChild(armadio)
                default:
                    print("")
                }
            }
        }
    }
    
    //TAPPETI E LUCI
    
    func addRugsAndLights(){
        for i in 0..<pavimento.count{
            for j in 0..<pavimento[1].count{
                switch pavimento[i][j]{
                case 2:
                    let tappeto = SKSpriteNode(texture: SKTexture(imageNamed: "pavimento taverna tappeto 3"), size: bloccoSize)
                    tappeto.normalTexture = SKTexture(imageNamed: "pavimento taverna tappeto 3 normal map")
                    tappeto.name = "floorTile"
                    tappeto.zPosition = 2
                    tappeto.position = CGPoint(x: startingPosition.x + Double(j * blocco) + Double(blocco) , y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    tappeto.lightingBitMask = 1 | 2
                    addChild(tappeto)
                case 3:
                    let tappeto = SKSpriteNode(texture: SKTexture(imageNamed: "pavimento taverna tappeto 2"), size: bloccoSize)
                    tappeto.normalTexture = SKTexture(imageNamed: "pavimento taverna tappeto 2 normal map")
                    tappeto.name = "floorTile"
                    tappeto.zPosition = 2
                    tappeto.position = CGPoint(x: startingPosition.x + Double(j * blocco) , y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    tappeto.lightingBitMask = 1 | 2
                    addChild(tappeto)
                case 4:
                    let pareteLanterna = LuceTaverna(lightBitmask: 1|2)
                    pareteLanterna.normalTexture = SKTexture(imageNamed: "parete lanterna normal map")
                    pareteLanterna.name = "light"
                    pareteLanterna.zPosition = 3
                    pareteLanterna.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    pareteLanterna.lightingBitMask = 1 | 2
                    addChild(pareteLanterna)
                case 5:
                    let pareteTubi = SKSpriteNode(texture: SKTexture(imageNamed:"parete centrale tubi"), size: bloccoSize)
                    pareteTubi.normalTexture = SKTexture(imageNamed: "parete centrale tubi normal map")
                    pareteTubi.name = "wall"
                    pareteTubi.zPosition = 3
                    pareteTubi.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    pareteTubi.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    pareteTubi.physicsBody?.isDynamic = false
                    pareteTubi.physicsBody?.affectedByGravity = false
                    pareteTubi.lightingBitMask = 1 | 2
                    addChild(pareteTubi)
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
    
    func getStartingPosition()->CGPoint{
        return self.startingPosition
    }
    
    func getDoorNumber()->Int{
        if (door.RIGHT == true && door.UP == false && door.DOWN == false && door.LEFT == false) || (door.RIGHT == false && door.UP == true && door.DOWN == false && door.LEFT == false) || (door.RIGHT == false && door.UP == false && door.DOWN == true && door.LEFT == false) || (door.RIGHT == false && door.UP == false && door.DOWN == false && door.LEFT == true){
            return 1
        }
        if (door.RIGHT == true && door.UP == true && door.DOWN == false && door.LEFT == false) || (door.RIGHT == true && door.UP == false && door.DOWN == false && door.LEFT == true) || (door.RIGHT == true && door.UP == false && door.DOWN == true && door.LEFT == false) || (door.RIGHT == false && door.UP == true && door.DOWN == true && door.LEFT == false) || (door.RIGHT == false && door.UP == true && door.DOWN == false && door.LEFT == true) || (door.RIGHT == false && door.UP == false && door.DOWN == true && door.LEFT == true){
            return 2
        }
        
        if (door.RIGHT == true && door.UP == true && door.DOWN == true && door.LEFT == false) || (door.RIGHT == true && door.UP == false && door.DOWN == true && door.LEFT == true) || (door.RIGHT == true && door.UP == true && door.DOWN == false && door.LEFT == true) || (door.RIGHT == false && door.UP == true && door.DOWN == true && door.LEFT == true){
            return 3
        }
        if (door.RIGHT == true && door.UP == true && door.DOWN == true && door.LEFT == true){
            return 4
        }
        return 0
    }
    
    func getDoorPosition()->[(DoorPlacement, CGPoint, Bool)]{
        return self.doorPositionPoints
    }
    
    func getUpDoorPosition()->CGPoint{
        for x in doorPositionPoints{
            if x.placement == .UP{
                return x.point
            }
        }
        return .zero
    }
    
    func getDownDoorPosition()->CGPoint{
        for x in doorPositionPoints{
            if x.placement == .DOWN{
                return x.point
            }
        }
        return .zero
    }
    
    func getLeftDoorPosition()->CGPoint{
        for x in doorPositionPoints{
            if x.placement == .LEFT{
                return x.point
            }
        }
        return .zero
    }
    
    func getRightDoorPosition()->CGPoint{
        for x in doorPositionPoints{
            if x.placement == .RIGHT{
                return x.point
            }
        }
        return .zero
    }
    
//    SET FUNCTIONS
    
    func setDoorOccupiedStatus(placement: DoorPlacement, _ newStatus: Bool){
        switch placement {
        case .UP:
            for x in 0..<doorPositionPoints.count{
                if doorPositionPoints[x].placement == .UP{
                    doorPositionPoints[x].isOccupied = newStatus
                }
            }
        case .DOWN:
            for x in 0..<doorPositionPoints.count{
                if doorPositionPoints[x].placement == .DOWN{
                    doorPositionPoints[x].isOccupied = newStatus
                }
                
            }
        case .LEFT:
            for x in 0..<doorPositionPoints.count{
                if doorPositionPoints[x].placement == .LEFT{
                    doorPositionPoints[x].isOccupied = newStatus
                }
                
            }
        case .RIGHT:
            for x in 0..<doorPositionPoints.count{
                if doorPositionPoints[x].placement == .RIGHT{
                    doorPositionPoints[x].isOccupied = newStatus
                }
            }
        }
        
    }
    
    func setRighe(_ righe :Int ){
        self.numRighe = righe
    }
    
    func setColonne(_ colonne :Int){
        self.numColonne = colonne
    }
}

