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

    func getType()-> FloorType{
        return type
    }

    init(_ scene: SKScene, floorType: FloorType){
        self.type = floorType
        self.numeroStanze = Int.random(in: 6...6)
        var lastRoomsAdded: [Room] = []
        var actualAdded: Int = 0
        var doorNumbers: Int = 0
        var doorPoints: [(placement: DoorPlacement, point: CGPoint, isOccupied: Bool)] = []
        switch Int.random(in: 0...3){
        case 0:
            let room = Room(.SIMPLE_1, startingPosition: CGPoint(x: 50, y: 50))
            lastRoomsAdded.append(room)
            scene.addChild(room)
            actualAdded+=1
        case 1:
            let room = Room(.SIMPLE_2,  startingPosition: CGPoint(x: 50, y: 50))
            lastRoomsAdded.append(room)
            scene.addChild(room)
            actualAdded+=1
        case 2:
            let room = Room(.SIMPLE_3,  startingPosition: CGPoint(x: 50, y: 50))
            lastRoomsAdded.append(room)
            scene.addChild(room)
            actualAdded+=1
        default:
            let room = Room(.SIMPLE_4, startingPosition: CGPoint(x: 50, y: 50))
            lastRoomsAdded.append(room)
            scene.addChild(room)
            accortSX = true
            accortDX = true
            actualAdded+=1
        }

        var firstCycle: Bool = true
        while actualAdded <= numeroStanze{
            doorNumbers = 0
            doorPoints.removeAll()
            for room in lastRoomsAdded{
                if firstCycle{
                    doorNumbers += room.getDoorNumber()
                    for door in room.getDoorPosition(){
                        doorPoints.append(door)
                    }
                }else{
                    doorNumbers += room.getDoorNumber() - 1
                    for door in room.getDoorPosition(){
                        if door.2 == false{
                            let pos = scene.convert(door.1, from: room)
                            let newDoor = (door.0, pos, door.2)
                            doorPoints.append(newDoor)
                        }
                    }
                }

            }

            if firstCycle{
                firstCycle = false
            }

//            print("Numero porte \(doorNumbers)")
//            print("Numero porte Array \(doorPoints)")
            if (doorNumbers + actualAdded) <= numeroStanze{
                lastRoomsAdded.removeAll()
                for door in doorPoints{
                    switch door.0{
                    case .UP:
//                      FUNZIONA PER DIO!
                        let type = STANZE_D.randomElement()
                        let newRoom = Room(type ?? .SIMPLE_1, startingPosition:  CGPoint(x: door.1.x, y: door.1.y))
                        newRoom.position.x -= ((newRoom.getDownDoorPosition().x)-door.1.x)
                        newRoom.position.y += Double(newRoom.getColonne()*blocco - blocco/2)
                        newRoom.setDoorOccupiedStatus(placement: .DOWN, true)
                        lastRoomsAdded.append(newRoom)
                        scene.addChild(newRoom)
                    case .DOWN:
                        let type = STANZE_U.randomElement()
                        let newRoom = Room(type ?? .SIMPLE_1, startingPosition: CGPoint(x: door.1.x, y: door.1.y))
//                        newRoom.convert(door.point, to: scene)

                        newRoom.position.x -= ((newRoom.getUpDoorPosition().x - door.1.x))
                        newRoom.position.y += Double(blocco/2)
                        newRoom.setDoorOccupiedStatus(placement: .UP, true)
                        lastRoomsAdded.append(newRoom)
                        scene.addChild(newRoom)
                    case .LEFT:
                        if(accortSX){
                        let type = STANZE_R_SAFE.randomElement()
                        let newRoom = Room(type!, startingPosition: CGPoint(x: door.1.x, y: door.1.y))
//                        newRoom.convert(door.point, to: newRoom)

                        newRoom.position.x -= Double(newRoom.getRighe()*blocco + blocco/2)
                        newRoom.position.y -= (newRoom.getRightDoorPosition().y - door.1.y)
                        newRoom.setDoorOccupiedStatus(placement: .RIGHT, true)
                        lastRoomsAdded.append(newRoom)
                        scene.addChild(newRoom)
                        }
                        else{
                            let type = STANZE_R.randomElement()
                            let newRoom = Room(type!, startingPosition: CGPoint(x: door.1.x, y: door.1.y))
    //                        newRoom.convert(door.point, to: newRoom)

                            newRoom.position.x -= Double(newRoom.getRighe()*blocco + blocco/2)
                            newRoom.position.y -= (newRoom.getRightDoorPosition().y - door.1.y)
                            newRoom.setDoorOccupiedStatus(placement: .RIGHT, true)
                            lastRoomsAdded.append(newRoom)
                            scene.addChild(newRoom)
                        }
                    case .RIGHT:
                        if(accortDX){
                            let type = STANZE_L_SAFE.randomElement()
                        let newRoom = Room(type!, startingPosition: CGPoint(x: door.1.x, y: door.1.y))
//                        newRoom.convert(door.point, to: newRoom)

                        newRoom.position.x += Double(blocco/2)
                        newRoom.position.y -= (newRoom.getLeftDoorPosition().y - door.1.y)
                        newRoom.setDoorOccupiedStatus(placement: .LEFT, true)
                        lastRoomsAdded.append(newRoom)
                        scene.addChild(newRoom)
                        }
                        else {
                            let type = STANZE_L.randomElement()
                            let newRoom = Room(type!, startingPosition: CGPoint(x: door.1.x, y: door.1.y))
    //                        newRoom.convert(door.point, to: newRoom)

                            newRoom.position.x += Double(blocco/2)
                            newRoom.position.y -= (newRoom.getLeftDoorPosition().y - door.1.y)
                            newRoom.setDoorOccupiedStatus(placement: .LEFT, true)
                            lastRoomsAdded.append(newRoom)
                            scene.addChild(newRoom)
                        }
                    }
                }
                actualAdded = actualAdded + doorNumbers
            }else if (actualAdded+doorNumbers) > numeroStanze{
                print("FINAL ITERATION")
                lastRoomsAdded.removeAll()
                //AGGIUNGE STANZE CON UNA PORTA
                for door in doorPoints{
                        switch door.0{
                        case .UP:
    //                      FUNZIONA PER DIO!
                            let type = STANZE_D_1DOOR.randomElement()
                            let newRoom = Room(type ?? .SIMPLE_1, startingPosition:  CGPoint(x: door.1.x, y: door.1.y))
                            newRoom.position.x -= ((newRoom.getDownDoorPosition().x)-door.1.x)
                            newRoom.position.y += Double(newRoom.getColonne()*blocco - blocco/2)
                            scene.addChild(newRoom)
                        case .DOWN:
                            let type = STANZE_U_1DOOR.randomElement()
                            let newRoom = Room(type ?? .SIMPLE_1, startingPosition: CGPoint(x: door.1.x, y: door.1.y))
                            newRoom.position.x -= ((newRoom.getUpDoorPosition().x - door.1.x))
                            newRoom.position.y += Double(blocco/2)
                            scene.addChild(newRoom)
                        case .LEFT:
                            let type = STANZE_R_1DOOR.randomElement()
                            let newRoom = Room(type!, startingPosition: CGPoint(x: door.1.x, y: door.1.y))
                            newRoom.position.x -= Double(newRoom.getRighe()*blocco + blocco/2)
                            newRoom.position.y -= (newRoom.getRightDoorPosition().y - door.1.y)
                            scene.addChild(newRoom)

                        case .RIGHT:
                            let type = STANZE_L_1DOOR.randomElement()
                            let newRoom = Room(type!, startingPosition: CGPoint(x: door.1.x, y: door.1.y))
                            newRoom.position.x += Double(blocco/2)
                            newRoom.position.y -= (newRoom.getLeftDoorPosition().y - door.1.y)
                            scene.addChild(newRoom)

                        }
                }
                actualAdded = numeroStanze+1
            }
        }
    }

}

