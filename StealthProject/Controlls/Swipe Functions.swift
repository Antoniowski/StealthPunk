//
//  Swipe Functions.swift
//  StealthProject
//
//  Created by Salvatore Manna on 06/05/22.
//

import Foundation
import SpriteKit

func shootProjectile(player: PlayableCharacter, scene: SKScene, timer: TimeCounter){
    
//    scene.enumerateChildNodes(withName: "touchBall"){
//        node, _ in
//        node.removeFromParent()
//    }
    
    if(arrayOfTouches.count > 1){
        
        
//        for index in 0...arrayOfTouches.count-1{
//            let touchBall: SKShapeNode = SKShapeNode(circleOfRadius: 10)
//            touchBall.name = "touchBall"
//            touchBall.strokeColor = .red
//            touchBall.fillColor = .red
//            touchBall.position = arrayOfTouches[index]
//            touchBall.zPosition = 1100
//            scene.addChild(touchBall)
//        }
        //Controllo che i punti dello swipe abbiano una differenza in gradi l'unot ocn l'altro di al massimo 20°
        var xTraslataIniziale: CGFloat
        var yTraslataIniziale: CGFloat
        var roIniziale: CGFloat
        var tetaIniziale: CGFloat
        if(arrayOfTouches.count >= 2){
            xTraslataIniziale = arrayOfTouches[0].x - arrayOfTouches[arrayOfTouches.count-1].x
            yTraslataIniziale = arrayOfTouches[0].y - arrayOfTouches[arrayOfTouches.count-1].y
            roIniziale = sqrt((xTraslataIniziale*xTraslataIniziale)+(yTraslataIniziale*yTraslataIniziale))
            tetaIniziale = -asin(yTraslataIniziale/roIniziale)
            for index in 2...arrayOfTouches.count-1{
                let xTraslata = arrayOfTouches[1].x - arrayOfTouches[index].x
                let yTraslata = arrayOfTouches[1].y - arrayOfTouches[index].y
                let ro = sqrt((xTraslata*xTraslata)+(yTraslata*yTraslata))
                let teta = -asin(yTraslata/ro)
                if teta > tetaIniziale + (20*3.14/180) || teta < tetaIniziale - (20*3.14/180) {
                    return
                }
            }
            //Controllo che trail secondo punto dello swipe e l'ultimo ci sia una tolleranza in gradi di al massimo 20°
            let xTraslata = arrayOfTouches[1].x - arrayOfTouches[arrayOfTouches.count-1].x
            let yTraslata = arrayOfTouches[1].y - arrayOfTouches[arrayOfTouches.count-1].y
            let ro = sqrt((xTraslata*xTraslata)+(yTraslata*yTraslata))
            let teta = -asin(yTraslata/ro)
            if teta > tetaIniziale + (20*3.14/180) || teta < tetaIniziale - (20*3.14/180) {
                return
            }
            
        }
        
        let distance = getDistanceBetween(point1: arrayOfTouches[0], point2: arrayOfTouches[arrayOfTouches.count-1])
            
        if distance > 80 {
            if(ammo > 0){
                ammo -= 1
                if(ammo == 1){
                    timer.proiettile1.alpha = 0.5
                } else if (ammo == 0){
                    timer.proiettile1.alpha = 0.5
                    timer.proiettile2.alpha = 0.5
                }
                
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
                
                
                
                let projectile = SKSpriteNode(imageNamed: "bullet")
                projectile.size = CGSize(width: 50, height: 50)
                projectile.position = CGPoint(x: player.position.x, y: player.position.y)
                projectile.name = "projectile"
                projectile.zPosition = 50
                projectile.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 7, height: 4))
                projectile.physicsBody?.isDynamic = true
                projectile.physicsBody?.restitution = 0
                projectile.physicsBody?.affectedByGravity = false
                projectile.physicsBody?.categoryBitMask = ColliderType.PROJECTILE.rawValue
                projectile.physicsBody?.collisionBitMask = ColliderType.NONE.rawValue
                projectile.physicsBody?.contactTestBitMask = ColliderType.ENEMY.rawValue | ColliderType.WALL.rawValue | ColliderType.DOOR.rawValue
                scene.addChild(projectile)
                if(arrayOfTouches[0].x > arrayOfTouches[arrayOfTouches.count-1].x){
                    projectile.zRotation = -teta + pi
                } else {
                    projectile.zRotation = teta
                }
                
                print("ZROTATION: \(projectile.zRotation * 180 / 3.14) + \(teta * 180 / 3.14)")

                
//                let square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
//                square.strokeColor = .yellow
//                square.fillColor = .yellow
//                square.position = CGPoint(x: player.position.x, y: player.position.y)
//                square.name = "projectile"
//                square.zPosition = 50
//                square.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 10, height: 10))
//                square.physicsBody?.isDynamic = true
//                square.physicsBody?.restitution = 0
//                square.physicsBody?.affectedByGravity = false
//                square.physicsBody?.categoryBitMask = ColliderType.PROJECTILE.rawValue
//                square.physicsBody?.collisionBitMask = ColliderType.NONE.rawValue
//                square.physicsBody?.contactTestBitMask = ColliderType.ENEMY.rawValue | ColliderType.WALL.rawValue | ColliderType.DOOR.rawValue
//                scene.addChild(square)
                
                let distance = sqrt((player.position.x+newX - player.position.x)*(player.position.x+newX - player.position.x)+(player.position.y+newY - player.position.y)*(player.position.y+newY - player.position.y))
                projectile.run(.move(to: CGPoint(x: player.position.x+newX, y: player.position.y+newY), duration: distance/projectileVelocity))
//                square.run(.move(to: CGPoint(x: player.position.x+newX, y: player.position.y+newY), duration: 1000))

                
                arrayOfTouches.removeAll()

            }
        }
    } else {
        arrayOfTouches.removeAll()
    }
}
