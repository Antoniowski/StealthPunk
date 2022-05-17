//
//  CollectibleItems.swift
//  StealthProject
//
//  Created by Antonio Romano on 17/05/22.
//

import Foundation
import SpriteKit

enum CollectibleItemCategory: Int{
    case COIN = 0
    case BOOTS = 1
    case KNUCKLES = 2
    case POTION = 3
}

class Collectible: SKSpriteNode{
    private var collectibleName: String = ""
    private var objectDescription: String = ""
    private var type: CollectibleItemCategory = .COIN
    
    private var sprite: SKTexture = SKTexture()
    
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
            self.run(.setTexture(sprite))
        
        case .KNUCKLES:
            sprite = SKTexture(imageNamed: "knuckleWhiteBlur")
            self.collectibleName = "Knuckles"
            self.run(.setTexture(sprite))
        case .POTION:
            sprite = SKTexture(imageNamed: "potionBlur")
            self.collectibleName = "Speed Potion"
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
            print("")
        case .BOOTS:
            if player.getNoise() > 0{
                player.setNoise(newNoise: player.getNoise() - 1)
            }
        case .KNUCKLES:
            player.setStrenght(newStrenght: player.getStrenght() + 1)
            if player.getStrenght() > 7{
                player.setStrenght(newStrenght: 7)
            }
        case .POTION:
            player.setSpeed(newSpeed: player.getSpeed() + 1)
            if player.getSpeed() > 7 {
                player.setSpeed(newSpeed: 7)
            }
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