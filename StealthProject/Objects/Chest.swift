//
//  Chest.swift
//  StealthProject
//
//  Created by Antonio Romano on 17/05/22.
//

import Foundation
import SpriteKit

class Chest: UsableObject{
    private var isOpen: Bool = false
    private var locked: Bool = false
    
    var openTexture: SKTexture = SKTexture(imageNamed: "forziereAperto")
    
    init(locked: Bool){
        super.init(texture: SKTexture(imageNamed: "forziere"), highlighted: SKTexture(imageNamed: "blur forziere"), color: .clear, size: CGSize(width: 75, height: 75), type: .USABLE)
        self.isOpen = false
        self.locked = locked
        self.setUsableCategory(.CHEST)
        self.setName("chest")
        self.openTexture = SKTexture(imageNamed: "forziereAperto")
        self.physicsBody = SKPhysicsBody(rectangleOf: .init(width: 75, height: 18), center: .init(x: 0, y: 9))
        self.physicsBody?.isDynamic = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.affectedByGravity = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func action(scene: SKScene){
        if isOpen == false{
            self.physicsBody = SKPhysicsBody(rectangleOf: .init(width: 75, height: 37.5), center: .init(x: 0, y: 18.75))
            self.physicsBody?.isDynamic = false
            self.physicsBody?.allowsRotation = false
            self.physicsBody?.affectedByGravity = false
            self.isOpen = true
            self.highlightedTexture = openTexture
            self.run(.setTexture(openTexture))
            let items: [CollectibleItemCategory] = [.POTION, .COIN , .KNUCKLES, .BOOTS, .HAT, .SIRINGE]
            let type = items.randomElement()
            let itemObject = Collectible(type: type ?? .COIN)
            itemObject.position = scene.convert(self.position, from: self.parent!)
            itemObject.physicsBody = SKPhysicsBody()
            itemObject.physicsBody?.affectedByGravity = false
            itemObject.setScale(0.1)
            itemObject.zPosition = 15
            scene.addChild(itemObject)
            itemObject.run(.scale(to: 1, duration: 0.8))
            itemObject.run(.sequence([.moveTo(y: scene.convert(self.position, from: self.parent!).y + 20, duration: 0.8), .wait(forDuration: 0.5) , .moveTo(y: scene.convert(self.position, from: self.parent!).y - 100, duration: 0.5)]), completion: {
                itemObject.physicsBody = SKPhysicsBody(rectangleOf: itemObject.size)
                itemObject.physicsBody?.affectedByGravity = false
                itemObject.physicsBody?.isDynamic = false
                itemObject.physicsBody?.allowsRotation = false
            })
            
        }
    }
    
    
    func getOpenStatus()->Bool{
        return self.isOpen
    }
    
    func getLockedStatus()->Bool{
        return self.locked
    }
    
    func setOpenStatus(_ newStatus: Bool){
        self.isOpen = newStatus
    }
    
    func setLockedStatus(_ newStatus: Bool){
        self.locked = newStatus
    }
}
