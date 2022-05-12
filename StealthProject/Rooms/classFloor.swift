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
        self.numeroStanze = Int.random(in: 4...7)
        var lastRoomsAdded: [Room] = []
        switch Int.random(in: 0...3){
        case 0:
            let room = Room(.FIRST, scene: scene, startingPosition: .zero)
            lastRoomsAdded.append(room)
        case 1:
            let room = Room(.FIRST_2, scene: scene, startingPosition: .zero)
            lastRoomsAdded.append(room)
        case 2:
            let room = Room(.FIRST_3, scene: scene, startingPosition: .zero)
            lastRoomsAdded.append(room)
        default:
            let room = Room(.FIRST_4, scene: scene, startingPosition: .zero)
            lastRoomsAdded.append(room)
        }
        var actualAdded: Int = 1
        while actualAdded < numeroStanze{
            var doorNumbers: Int = 0
            for room in lastRoomsAdded{
                doorNumbers += room.getDoorNumber()
            }
            if doorNumbers + actualAdded <= numeroStanze{
                lastRoomsAdded = []
                for _ in 0..<doorNumbers{
                    let newRoom = Room(.SIMPLE_1, scene: scene, startingPosition: .zero)
                    lastRoomsAdded.append(newRoom)
                    actualAdded+=1
                }
            }else{
                lastRoomsAdded = []
                //AGGIUNGE STANZE CON UNA PORTA
                for _ in 0..<doorNumbers{
                    let newRoom = Room(.SIMPLE_1, scene: scene, startingPosition: .zero)
                    lastRoomsAdded.append(newRoom)
                }
                actualAdded = numeroStanze+1
            }
        }
    }
    
}
