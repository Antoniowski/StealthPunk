//
//  Swipe Functions.swift
//  StealthProject
//
//  Created by Salvatore Manna on 06/05/22.
//

import Foundation
import SpriteKit

func shootProjectile(player: PlayableCharacter, scene: SKScene){
    if(arrayOfTouches.count > 1){
        let xTraslata = arrayOfTouches[0].x - arrayOfTouches[arrayOfTouches.count-1].x
        let yTraslata = arrayOfTouches[0].y - arrayOfTouches[arrayOfTouches.count-1].y
        let ro = sqrt((xTraslata*xTraslata)+(yTraslata*yTraslata))
        let teta = -asin(yTraslata/ro)
        
        var newX: CGFloat = 0
        if(arrayOfTouches[0].x < arrayOfTouches[arrayOfTouches.count-1].x){
            newX = cos(teta)*projectileShootDistance
        }else {
            newX = -cos(teta)*projectileShootDistance
        }
        let newY = sin(teta)*projectileShootDistance
                    
        let square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
        square.strokeColor = .yellow
        square.fillColor = .yellow
        square.position = CGPoint(x: player.position.x, y: player.position.y)
        square.name = "projectile"
        square.zPosition = 50
        scene.addChild(square)
        let distance = sqrt((player.position.x+newX - player.position.x)*(player.position.x+newX - player.position.x)+(player.position.y+newY - player.position.y)*(player.position.y+newY - player.position.y))
        square.run(.move(to: CGPoint(x: player.position.x+newX, y: player.position.y+newY), duration: distance/projectileVelocity))
        
        arrayOfTouches.removeAll()
    } else {
        arrayOfTouches.removeAll()
    }
}