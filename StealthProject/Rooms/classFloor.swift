//
//  Floors.swift
//  StealthProject
//
//  Created by Gennaro Cirillo on 09/05/22.
//

import Foundation
import SpriteKit
import GameplayKit
import SwiftUI

enum FloorType: Int{
    case FIRST_FLOOR = 0
    case SECOND_FLOOE = 1
    case LAST_FLOOR = 2
}

class Floor{
    
    private var type: FloorType = .FIRST_FLOOR
    
    private var stanze: [Room] = []
    private var numeroStanze: Int = 0
    
    init(_ scene: SKScene, floorType: FloorType){
        self.type = floorType
        self.numeroStanze = Int.random(in: 10...10)
        var lastRoomsAdded: [Room] = []
        var actualAdded: Int = 0
        var doorNumbers: Int = 0
        var doorPoints: [(DoorPlacement, CGPoint)] = []
        switch Int.random(in: 0...3){
        case 0:
            let room = Room(.SIMPLE_1, startingPosition: CGPoint(x: 0, y: 0))
            lastRoomsAdded.append(room)
            scene.addChild(room)
            actualAdded+=1
        case 1:
            let room = Room(.SIMPLE_1,  startingPosition: CGPoint(x: 0, y: 0))
            lastRoomsAdded.append(room)
            scene.addChild(room)
            actualAdded+=1
        case 2:
            let room = Room(.SIMPLE_1,  startingPosition: CGPoint(x: 0, y: 0))
            lastRoomsAdded.append(room)
            scene.addChild(room)
            actualAdded+=1
        default:
            let room = Room(.SIMPLE_1, startingPosition: CGPoint(x: 0, y: 0))
            lastRoomsAdded.append(room)
            scene.addChild(room)
            actualAdded+=1
        }
        while actualAdded < numeroStanze{
            doorNumbers = 0
            for room in lastRoomsAdded{
                doorNumbers += room.getDoorNumber()
                print(doorNumbers)
//                doorPoints += room.getDoorPosition()
                for door in room.getDoorPosition(){
                    doorPoints.append(door)
                }
            }
            if doorNumbers + actualAdded <= numeroStanze{
                lastRoomsAdded = []
                for door in doorPoints{
                    switch door.0{
                    case .UP:
                        //DEVE AVERE UNA PORTA SOTTO
                        //FUNZIONA QUESTO CASO
                        let type = STANZE_D.randomElement()
                        let newRoom = Room(type ?? .SIMPLE_1, startingPosition: CGPoint(x: door.1.x, y: door.1.y))
                        newRoom.position.x -= ((newRoom.getDownDoorPosition().x - door.1.x))
                        newRoom.position.y += Double(newRoom.getColonne()*blocco - blocco/2)
                        lastRoomsAdded.append(newRoom)
                        actualAdded+=1
                        scene.addChild(newRoom)
                    case .DOWN:
                        let type = STANZE_U.randomElement()
                        let newRoom = Room(type ?? .SIMPLE_1, startingPosition: CGPoint(x: door.1.x, y: door.1.y))
                        newRoom.position.x -= ((newRoom.getUpDoorPosition().x - door.1.x))
                        newRoom.position.y += Double(blocco/2)
                        lastRoomsAdded.append(newRoom)
                        actualAdded+=1
                    case .LEFT:
                        let type = STANZE_R.randomElement()
                        let newRoom = Room(type ?? .SIMPLE_1, startingPosition: CGPoint(x: door.1.x , y: door.1.y))
                        newRoom.position.y += (newRoom.getRightDoorPosition().y - door.1.y)
                        newRoom.position.x -= Double(newRoom.getRighe()*blocco - blocco)
                        lastRoomsAdded.append(newRoom)
                        actualAdded+=1
                    case .RIGHT:
                        let type = STANZE_L.randomElement()
                        let newRoom = Room(type ?? .SIMPLE_1, startingPosition: CGPoint(x: door.1.x , y: door.1.y))
                        newRoom.position.y += (newRoom.getLeftDoorPosition().y - door.1.y)
                        lastRoomsAdded.append(newRoom)
                        actualAdded+=1
                    }
                }
            }
            else{
//                lastRoomsAdded = []
//                //AGGIUNGE STANZE CON UNA PORTA
//                for door in doorPoints{
//                    switch door.0{
//                    case .UP:
//                        //DEVE AVERE UNA PORTA SOTTO
//                        //ORGANIZZARE ARRAY IN MODO CHE SAI A PRIORI LA POSIZIONE DELLA PORTA
//                        let type = STANZE_D.randomElement()
//                        let newRoom = Room(type ?? .SIMPLE_1, startingPosition: CGPoint(x: door.1.x, y: door.1.y))
//                        newRoom.position.x -= (abs(newRoom.getDownDoorPosition().x - door.1.x))
//                        newRoom.position.y += Double(newRoom.getColonne()*blocco)
//                        lastRoomsAdded.append(newRoom)
//                        scene.addChild(newRoom)
//                    case .DOWN:
//                        let type = STANZE_U.randomElement()
//                        let newRoom = Room(type ?? .SIMPLE_1, startingPosition: CGPoint(x: door.1.x, y: door.1.y))
//                        newRoom.position.x -= (abs(newRoom.getUpDoorPosition().x - door.1.x))
//                        lastRoomsAdded.append(newRoom)
//                    case .LEFT:
//                        let type = STANZE_R.randomElement()
//                        let newRoom = Room(type ?? .SIMPLE_1, startingPosition: CGPoint(x: door.1.x - Double(blocco/2), y: door.1.y))
//                        newRoom.position.y += abs(newRoom.getRightDoorPosition().y - door.1.y)
//                        newRoom.position.x -= Double(newRoom.getRighe()*blocco)
//                        lastRoomsAdded.append(newRoom)
//                    case .RIGHT:
//                        let type = STANZE_L.randomElement()
//                        let newRoom = Room(type ?? .SIMPLE_1, startingPosition: CGPoint(x: door.1.x + Double(blocco/2), y: door.1.y))
//                        newRoom.position.y += abs(newRoom.getLeftDoorPosition().y - door.1.y)
//                        lastRoomsAdded.append(newRoom)
//                    }
//                }
                actualAdded = numeroStanze+1
            }
        }
    }
    
}
