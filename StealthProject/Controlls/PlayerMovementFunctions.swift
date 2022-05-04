//
//  PlayerMovementFunctions.swift
//  StealthProject
//
//  Created by Antonio Romano on 03/05/22.
//

import Foundation
import SpriteKit
import SwiftUI

func playerMovement(player: SKShapeNode, velocity: CGVector){
    player.position.x += velocity.dx
    player.position.y += velocity.dy
}


protocol PlayableScene{
    var inputVector: CGVector {get set}
    var rollVector: CGVector {get set}
    
    func moveState()
    func attackState()
    func rollState()
    func interactState()
}

extension PlayableScene{
    mutating func moveState(){
        self.inputVector = CGVector.zero
        inputVector = myMovement
        if inputVector != CGVector.zero{
            rollVector = inputVector
            inputVector = inputVector
        }
        
    }
}


