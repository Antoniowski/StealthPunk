//
//  DeltaFunctions.swift
//  StealthProject
//
//  Created by Antonio Romano on 04/05/22.
//

import Foundation
import SpriteKit

protocol DeltaProtocol{
    var delta: TimeInterval {get set}
    var lastUpdate: TimeInterval! {get set}
    
    func calcDelta()
}

extension DeltaProtocol{
    mutating func calcDelta(currentTime: TimeInterval){
        defer{ lastUpdate = currentTime}
        guard lastUpdate != nil else{
            return
        }
        delta = currentTime-lastUpdate
        guard delta < 1 else{
            return
        }
    }
}
