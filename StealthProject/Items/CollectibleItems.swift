//
//  CollectibleItems.swift
//  StealthProject
//
//  Created by Antonio Romano on 17/05/22.
//

import Foundation
import SpriteKit

enum CollectibleItemCategory: Int{
    case COIN = 0    //CURRENCY
    case BOOTS = 1   //NOISE -1
    case KNUCKLES = 2   //STRENGHT +1
    case POTION = 3   //SPEED +1
    case SIRINGE = 4  //STRENGHT +1, SPEED +1, NOISE +1
    case HAT = 5    //SPEED +1, NOISE -1, STRENGHT -1
    case CLOCK1 = 6 //+30SEC
    case CLOCK2 = 7 // +1MIN
    case FINAL = 8 // FINAL
}

class Collectible: SKSpriteNode{
    private var collectibleName: String = ""
    private var objectDescription: String = ""
    private var type: CollectibleItemCategory = .COIN
    
    var sprite: SKTexture = SKTexture()
    
    init(type: CollectibleItemCategory){
        super.init(texture: sprite, color: .clear, size: CGSize(width: 40, height: 40))
        self.name = "collectible"
        self.type = type
        switch type {
        case .COIN:
            sprite = SKTexture(imageNamed: "ingranaggio")
            self.collectibleName = "gear"
            self.run(.setTexture(sprite))
            self.run(.repeatForever(.rotate(byAngle: 1, duration: 1)))
            
        case .BOOTS:
            sprite = SKTexture(imageNamed: "bootsWhite")
            self.collectibleName = "Silent Boots"
            self.objectDescription = "Like a cat"
            self.run(.setTexture(sprite))
        
        case .KNUCKLES:
            sprite = SKTexture(imageNamed: "knuckleWhiteBlur")
            self.collectibleName = "Knuckles"
            self.objectDescription = "Hit harder"
            self.run(.setTexture(sprite))
        case .POTION:
            sprite = SKTexture(imageNamed: "potionBlur")
            self.collectibleName = "Speed Potion"
            self.objectDescription = "Blue Cow"
            self.run(.setTexture(sprite))
        case .SIRINGE:
            sprite = SKTexture(imageNamed: "siringaBlur")
            self.run(.setTexture(sprite))
            self.collectibleName = "Siringe"
            self.objectDescription = "All Natural"
        case .HAT:
            sprite = SKTexture(imageNamed: "cappelloBlur")
            self.collectibleName = "Hat"
            self.objectDescription = "Stylish thief"
            self.run(.setTexture(sprite))
        case .CLOCK1:
            sprite = SKTexture(imageNamed: "orologio+30sec")
            self.collectibleName = "Clock"
            self.objectDescription = "More time"
            self.run(.setTexture(sprite))
        case .CLOCK2:
            sprite = SKTexture(imageNamed: "orologio+1min")
            self.collectibleName = "Clock"
            self.objectDescription = "More more time" 
            self.run(.setTexture(sprite))
        case .FINAL:
            sprite = SKTexture(imageNamed: "crownBorder")
            self.size = CGSize(width: 70, height: 70)
            self.run(.setTexture(sprite))
        }
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        
        self.physicsBody?.categoryBitMask = ColliderType.COLLECTIBLE.rawValue
        self.physicsBody?.collisionBitMask = ColliderType.PLAYER.rawValue
        self.physicsBody?.contactTestBitMask = ColliderType.PLAYER.rawValue
        
        self.run(.repeatForever(.sequence([.moveBy(x: 0, y: 5, duration: 0.5), .moveBy(x: 0, y: -5, duration: 0.5)])))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func action(player: PlayableCharacter){
        switch type {
        case .COIN:
            player.run(.run {
                music.starsSound(filenamed: music.swing)
            })
        case .BOOTS:
            player.run(.run {
                music.starsSound(filenamed: music.swing)
            })
            if player.getNoise() > 0{
                player.setNoise(newNoise: player.getNoise() - 1)
            }
        case .KNUCKLES:
            player.run(.run {
                music.starsSound(filenamed: music.swing)
            })
            player.setStrenght(newStrenght: player.getStrenght() + 1)
            if player.getStrenght() > 7{
                player.setStrenght(newStrenght: 7)
            }
        case .POTION:
            player.run(.run {
                music.starsSound(filenamed: music.swing)
            })
            player.setSpeed(newSpeed: player.getSpeed() + 1)
            if player.getSpeed() > 7 {
                player.setSpeed(newSpeed: 7)
            }
        case .SIRINGE:
            player.run(.run {
                music.starsSound(filenamed: music.swing)
            })
            player.setSpeed(newSpeed: player.getSpeed() + 1)
            player.setStrenght(newStrenght: player.getStrenght() + 1)
            player.setNoise(newNoise: player.getNoise() + 1)
            
            if player.getNoise() > 7{
                player.setNoise(newNoise: 7)
            }
            if player.getSpeed() > 7{
                player.setSpeed(newSpeed: 7)
            }
            if player.getStrenght() > 7 {
                player.setStrenght(newStrenght: 7)
            }
        case .HAT:
            player.run(.run {
                music.starsSound(filenamed: music.swing)
            })
            player.setSpeed(newSpeed: player.getSpeed() + 1)
            player.setStrenght(newStrenght: player.getStrenght() - 1)
            player.setNoise(newNoise: player.getNoise() - 1)
            
            if player.getNoise() < 0{
                player.setNoise(newNoise: 0)
            }
            if player.getSpeed() > 7{
                player.setSpeed(newSpeed: 7)
            }
            if player.getStrenght() < 0 {
                player.setStrenght(newStrenght: 0)
            }
        case .CLOCK1:
            player.run(.run {
                music.starsSound(filenamed: music.swing)
            })
            SECONDS = SECONDS + 30
            
        case .CLOCK2:
            player.run(.run {
                music.starsSound(filenamed: music.swing)
            })
            MINUTE = MINUTE + 1
        case .FINAL:
            player.removeAllActions()
            self.removeAllActions()
            myMovement = .zero
            myGameController.disconnectController()
            self.physicsBody = SKPhysicsBody()
            self.physicsBody?.isDynamic = false
            self.physicsBody?.affectedByGravity = false
            self.physicsBody?.allowsRotation = false
            self.run(.scale(to: 0.35, duration: 3), completion: {
                self.run(.move(to: player.position, duration: 1))
                self.run(.scale(to: 0.05, duration: 1), completion: {
                    self.removeFromParent()
                })
            })
            self.run(.moveBy(x: 0, y: 25, duration: 1.5))
        }
    }
    
    func action(contatore: Counter) {
        if self.type == .COIN {
            contatore.number += 1
        }
    }
    
    
    
    
    
    
    
    // GET FUNCTION
    
    func getItemName()->String{
        return self.collectibleName
    }
    
    func getItemDescription()->String{
        return self.objectDescription
    }
    
    func getType()->CollectibleItemCategory{
        return self.type
    }
    
    
}
