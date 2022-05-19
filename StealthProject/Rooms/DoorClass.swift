//
//  DoorClass.swift
//  StealthProject
//
//  Created by Antonio Romano on 13/05/22.
//

import Foundation
import SpriteKit

class Door: SKSpriteNode{
    
    private var isOpen: Bool = false
    
    private var closedTexture: SKTexture = SKTexture()
    private var openTexture: SKTexture = SKTexture()
    private var doorPlacement: DoorPlacement = .UP
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(_ placement: DoorPlacement, isOpen: Bool, floor: FloorType){
        if isOpen == false{
            super.init(texture: closedTexture, color: .clear, size: CGSize(width: blocco, height: blocco))
            self.doorPlacement = placement
            setTexture(placement, floor: floor)
            self.isOpen = false
            self.run(.setTexture(closedTexture))
        }else{
            super.init(texture: openTexture, color: .clear, size: CGSize(width: blocco, height: blocco))
            self.doorPlacement = placement
            setTexture(placement, floor: floor)
            self.isOpen = true
            self.run(.setTexture(openTexture))
        }
        self.name = "door"
        self.physicsBody?.categoryBitMask = ColliderType.DOOR.rawValue
        self.physicsBody?.collisionBitMask = ColliderType.PLAYER.rawValue
        self.physicsBody?.contactTestBitMask = ColliderType.PLAYER.rawValue
    }
    
    private func setTexture(_ placement: DoorPlacement, floor: FloorType){
        if floor == .SECOND_FLOOE || floor == .LAST_FLOOR{
            switch placement {
            case .UP, .DOWN:
                closedTexture = SKTexture(imageNamed: "doorClosed")
                openTexture = SKTexture(imageNamed: "doorOpen")
            case .LEFT:
                closedTexture = SKTexture(imageNamed: "doorLeft")
                openTexture = SKTexture(imageNamed: "doorOpenLeft")
            case .RIGHT:
                closedTexture = SKTexture(imageNamed: "doorRight")
                openTexture = SKTexture(imageNamed: "doorOpenRight")
            }
        }else{
            switch placement {
            case .UP, .DOWN:
                closedTexture = SKTexture(imageNamed: "portaEsternaChiusa")
                openTexture = SKTexture(imageNamed: "portaEsternaAperta")
            case .LEFT:
                closedTexture = SKTexture(imageNamed: "portaEsternaLateraleChiusaSx")
                openTexture = SKTexture(imageNamed: "portaEsternaLateraleApertaSx")
            case .RIGHT:
                closedTexture = SKTexture(imageNamed: "portaEsternaLateraleChiusaDx")
                openTexture = SKTexture(imageNamed: "portaEsternaLateraleApertaDx")
            }
        }
        
    }
    
                 
    func getOpenStaus()->Bool{
        return self.isOpen
    }
    
    func open(){
        self.isOpen = true
        self.run(.setTexture(openTexture))
        self.physicsBody = SKPhysicsBody()
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.allowsRotation = false
    }
    

}
