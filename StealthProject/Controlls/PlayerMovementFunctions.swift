//
//  PlayerMovementFunctions.swift
//  StealthProject
//
//  Created by Antonio Romano on 03/05/22.
//

import Foundation
import SpriteKit

func playerMovement(player: SKShapeNode, velocity: CGVector){
    player.position.x += velocity.dx
    player.position.y += velocity.dy
}


