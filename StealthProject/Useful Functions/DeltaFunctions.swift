//
//  DeltaFunctions.swift
//  StealthProject
//
//  Created by Antonio Romano on 04/05/22.
//

import Foundation
import SpriteKit

protocol DeltaProtocol: AnyObject{
    var delta: TimeInterval {get set}
    var lastUpdate: TimeInterval? {get set}
    
}

extension DeltaProtocol{
    
    func calcDelta(currentTime: TimeInterval){
        defer{ self.lastUpdate = currentTime}
        guard self.lastUpdate != nil else{
            return
        }
        self.delta = currentTime-lastUpdate!
        guard delta < 1 else{
            return
        }
    }
}
