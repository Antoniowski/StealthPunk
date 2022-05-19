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
    
    private var numRighe : Int = 0
    private var numColonne : Int = 0
    private var stanza : Matrix = []
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

    
    init(_ archetype: RoomArchetype, startingPosition: CGPoint){
        super.init()
        self.startingPosition = startingPosition
        switch archetype {
        case .FIRST:
            door = DoorPosition(UP: true, DOWN: false, RIGHT: false, LEFT: false)
            tipe = .START
            numRighe = simple1Matrix[1].count
            numColonne = simple1Matrix.count
            stanza = simple1Matrix
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            self.createRoom()
        case .FIRST_2:
            door = DoorPosition(UP: true, DOWN: true, RIGHT: false, LEFT: false)
            tipe = .START
            numRighe = simple1Matrix[1].count
            numColonne = simple1Matrix.count
            stanza = simple1Matrix
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            createRoom()
        case .FIRST_3:
            door = DoorPosition(UP: true, DOWN: true, RIGHT: true, LEFT: false)
            tipe = .START
            numRighe = simple1Matrix[1].count
            numColonne = simple1Matrix.count
            stanza = simple1Matrix
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            createRoom()
        case .FIRST_4:
            door = DoorPosition(UP: true, DOWN: true, RIGHT: true, LEFT: true)
            tipe = .START
            numRighe = simple1Matrix[1].count
            numColonne = simple1Matrix.count
            stanza = simple1Matrix
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            createRoom()
        case .SIMPLE_1:
            door = DoorPosition(UP: true, DOWN: true, RIGHT: false, LEFT: false)
            tipe = .NORMAL
            numRighe = simple1Matrix[1].count
            numColonne = simple1Matrix.count
            stanza = simple1Matrix
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            createRoom()
        case .SIMPLE_2:
            door = DoorPosition(UP: true, DOWN: true, RIGHT: false, LEFT: false)
            tipe = .NORMAL
            numRighe = simple2Matrix[1].count
            numColonne = simple2Matrix.count
            stanza = simple2Matrix
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            createRoom()
        case .SIMPLE_3:
            door = DoorPosition(UP: false, DOWN: true, RIGHT: true, LEFT: true)
            tipe = .NORMAL
            numRighe = simple3Matrix[1].count
            numColonne = simple3Matrix.count
            stanza = simple3Matrix
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            createRoom()
        case .SIMPLE_4:
            door = DoorPosition(UP: true, DOWN: false, RIGHT: true, LEFT: true)
            tipe = .NORMAL
            numRighe = simple4Matrix[1].count
            numColonne = simple4Matrix.count
            stanza = simple4Matrix
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            createRoom()
        case .SIMPLE_5:
            door = DoorPosition(UP: false, DOWN: true, RIGHT: false, LEFT: true)
            tipe = .NORMAL
            numRighe = simple5Matrix[1].count
            numColonne = simple5Matrix.count
            stanza = simple5Matrix
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            createRoom()
        case .SIMPLE_6:
            door = DoorPosition(UP: false, DOWN: true, RIGHT: true, LEFT: false)
            tipe = .NORMAL
            numRighe = simple6Matrix[1].count
            numColonne = simple6Matrix.count
            stanza = simple6Matrix
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            createRoom()
        case .SIMPLE_7:
            door = DoorPosition(UP: false, DOWN: true, RIGHT: true, LEFT: true)
            tipe = .NORMAL
            numRighe = simple7Matrix[1].count
            numColonne = simple7Matrix.count
            stanza = simple7Matrix
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            createRoom()
        case .PROVA1:
            door = DoorPosition(UP: true, DOWN: false, RIGHT: false, LEFT: false)
            tipe = .NORMAL
            numRighe = prova1[1].count
            numColonne = prova1.count
            stanza = prova1
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            createRoom()
        case .PROVA2:
            door = DoorPosition(UP: false, DOWN: true, RIGHT: false, LEFT: false)
            tipe = .NORMAL
            numRighe = prova2[1].count
            numColonne = prova2.count
            stanza = prova2
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            createRoom()
        case .PROVA3:
            door = DoorPosition(UP: false, DOWN: false, RIGHT: false, LEFT: true)
            tipe = .NORMAL
            numRighe = prova3[1].count
            numColonne = prova3.count
            stanza = prova3
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            createRoom()
        case .PROVA4:
            door = DoorPosition(UP: false, DOWN: false, RIGHT: true, LEFT: false)
            tipe = .NORMAL
            numRighe = prova4[1].count
            numColonne = prova4.count
            stanza = prova4
            nemici = []
            setTextures(tipo: .FIRST_FLOOR)
            createRoom()
        case .SCAMBIO1:
            print("ciao")
        case .SCAMBIO2:
            print ("criao")
        case .SCAMBIO3:
            print("ciao")
        case .SCAMBIO4:
            print("ciao")
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
    
    private func setTextures(tipo : FloorType){
        switch tipo {
            
        case .FIRST_FLOOR:
            self.frontWallTexture = SKTexture(imageNamed: "parete frontaleSu")
            self.floorTexture = SKTexture(imageNamed: "erba")
            self.sideRightWallTexture = SKTexture(imageNamed: "parete LateraleDx")
            self.sideLeftWallTexture  = SKTexture(imageNamed: "parete LateraleSx")
            self.cornerRightWallTexture = SKTexture(imageNamed: "angolo frontaleDxSu")
            self.cornerLeftWallTexture = SKTexture(imageNamed: "angolo frontaleSxSu")
            self.frontDoorTexture = SKTexture(imageNamed: "doorClosed")
            self.leftDoorTexture = SKTexture(imageNamed: "porta laterale")
            self.rightDoorTexture = SKTexture(imageNamed: "porta laterale")
            
        case .SECOND_FLOOE:
            self.frontWallTexture = SKTexture(imageNamed: "wall")
            self.floorTexture = SKTexture(imageNamed: "pavimento4")
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
                    floor.name = "floorTile"
                    floor.zPosition = 1
                    floor.position = CGPoint(x: startingPosition.x + Double(j * blocco) + Double(blocco/2) , y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    addChild(floor)
                }
                switch stanza[i][j]{
                    //FRONT WALL
                case 1:
                    let wall = SKSpriteNode(texture: frontWallTexture, size: bloccoSize)
                    wall.name = "wall"
                    wall.zPosition = 2
                    wall.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    wall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    wall.physicsBody?.isDynamic = false
                    wall.physicsBody?.affectedByGravity = false
                    addChild(wall)
                    
                case 2:
                    let leftAngle = SKSpriteNode(texture: cornerLeftWallTexture, size: bloccoSize)
                    leftAngle.name = "wall"
                    leftAngle.zPosition = 2
                    leftAngle.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    leftAngle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    leftAngle.physicsBody?.isDynamic = false
                    leftAngle.physicsBody?.affectedByGravity = false
                    addChild(leftAngle)
                case 3:
                    let myWall = SKSpriteNode(texture: cornerRightWallTexture, size: bloccoSize)
                    myWall.name = "wall"
                    myWall.zPosition = 2
                    myWall.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    myWall.physicsBody?.affectedByGravity = false
                    myWall.physicsBody?.isDynamic = false
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
                    addChild(myWall)
                case 7:
//                    let door = SKSpriteNode(texture: frontDoorTexture, size: bloccoSize)
                    let door = Door(.UP, isOpen: false)
                    door.name = "door"
                    door.zPosition = 2
                    door.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    doorPositionPoints.append((DoorPlacement.UP,door.position, false))
                    door.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    door.physicsBody?.isDynamic = false
                    door.physicsBody?.affectedByGravity = false
                    door.physicsBody?.allowsRotation = false
                    addChild(door)
                case 8:
//                    let door = SKSpriteNode(texture: frontDoorTexture, size: bloccoSize)
                    let door = Door(.DOWN, isOpen: false)
                    door.name = "door"
                    door.zPosition = 2
                    door.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    doorPositionPoints.append((.DOWN,door.position, false))
                    door.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    door.physicsBody?.isDynamic = false
                    door.physicsBody?.affectedByGravity = false
                    door.physicsBody?.allowsRotation = false
                    addChild(door)
                case 9:
//                    let door = SKSpriteNode(texture: leftDoorTexture, size: bloccoSize)
                    let door = Door(.LEFT, isOpen: false)
                    door.name = "door"
                    door.zPosition = 2
                    door.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    doorPositionPoints.append((.LEFT,door.position, false))
                    door.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: -blocco/3, y: 0))
                    door.physicsBody?.isDynamic = false
                    door.physicsBody?.affectedByGravity = false
                    door.physicsBody?.allowsRotation = false
                    addChild(door)
                case 10:
//                    let door = SKSpriteNode(texture: rightDoorTexture, size: bloccoSize)
                    let door = Door(.RIGHT, isOpen: false)
                    door.name = "door"
                    door.zPosition = 2
                    door.position = CGPoint(x: startingPosition.x + Double(j*blocco) + Double(blocco/2), y: startingPosition.y - Double(i*blocco) - Double(blocco/2))
                    doorPositionPoints.append((.RIGHT,door.position, false))
                    door.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: blocco/3, y: 0))
                    door.physicsBody?.isDynamic = false
                    door.physicsBody?.affectedByGravity = false
                    door.physicsBody?.allowsRotation = false
                    addChild(door)
                    
                    
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

