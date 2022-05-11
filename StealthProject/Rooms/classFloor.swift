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

class Floor{
    
    private var stanze: [Room] = []
    private var numeroStanze: Int = 0
    
    init(_ scene: SKScene){
        self.numeroStanze = Int.random(in: 4...7)
        for x in 0..<numeroStanze{
            let room = pianoInterno[Int.random(in: 0..<pianoInterno.count)]
            
        }
    }
    
}
