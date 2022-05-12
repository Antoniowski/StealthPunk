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
        self.numeroStanze = Int.random(in: 4...4)
        var lastRoomsAdded: [Room] = []
        switch Int.random(in: 0...0){
        case 0:
            let room = Room(.SIMPLE_1, startingPosition: .zero)
            lastRoomsAdded.append(room)
        case 1:
            let room = Room(.FIRST_2,  startingPosition: .zero)
            lastRoomsAdded.append(room)
        case 2:
            let room = Room(.FIRST_3,  startingPosition: .zero)
            lastRoomsAdded.append(room)
        default:
            let room = Room(.FIRST_4, startingPosition: .zero)
            lastRoomsAdded.append(room)
        }
        var actualAdded: Int = 1
        while actualAdded < numeroStanze{
            var doorNumbers: Int = 0
            var doorPoints: [(DoorPlacement, CGPoint)] = []
            for room in lastRoomsAdded{
                doorNumbers += room.getDoorNumber()
                doorPoints += room.getDoorPosition()
            }
            if doorNumbers + actualAdded <= numeroStanze{
                lastRoomsAdded = []
                for x in 0..<doorNumbers{
                    switch doorPoints[x].0{
                        //RANDOMIZZARE IN FUNZINE DELLA POSIZIONE DELLA PORTA
                    case .UP:
                        //DEVE AVERE UNA PORTA SOTTO
                        //ORGANIZZARE ARRAY IN MODO CHE SAI A PRIORI LA POSIZIONE DELLA PORTA
                        let newRoom2 = Room(.SIMPLE_1, startingPosition: CGPoint(x: doorPoints[x].1.x, y: doorPoints[x].1.y - Double(blocco/2)))
                        let newRoom = Room(.SIMPLE_1, startingPosition: CGPoint(x: newRoom2.getStartingPosition().x - newRoom2.getUpDoorPosition().x - Double(blocco/2), y: newRoom2.getStartingPosition().y + Double(blocco/2)))
                        lastRoomsAdded.append(newRoom)
                        actualAdded+=1
                        scene.addChild(newRoom)
                    case .DOWN:
                        let newRoom = Room(.SIMPLE_1, startingPosition: .zero)
                        lastRoomsAdded.append(newRoom)
                        actualAdded+=1
                    case .LEFT:
                        let newRoom = Room(.SIMPLE_1, startingPosition: .zero)
                        lastRoomsAdded.append(newRoom)
                        actualAdded+=1
                    case .RIGHT:
                        let newRoom = Room(.SIMPLE_1, startingPosition: .zero)
                        lastRoomsAdded.append(newRoom)
                        actualAdded+=1
                    }
                }
            }else{
                lastRoomsAdded = []
                //AGGIUNGE STANZE CON UNA PORTA
                for _ in 0..<doorNumbers{
                    let newRoom = Room(.SIMPLE_1, startingPosition: .zero)
                    lastRoomsAdded.append(newRoom)
                }
                actualAdded = numeroStanze+1
            }
        }
    }
    
}
