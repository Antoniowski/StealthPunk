//
//  Stairs.swift
//  StealthProject
//
//  Created by Antonio Romano on 23/05/22.
//

import Foundation
import SpriteKit

enum FloorLink: Int{
    case ONE_TO_TWO = 0
    case TWO_TO_FINAL = 1
    case FINAL_TO_TWO = 2
    case TWO_TO_ONE = 3
}

class NextFloor: UsableObject{
    private var floorLink: FloorLink = .ONE_TO_TWO
    var nextFloor: SKScene{
        get {
            switch floorLink {
            case .ONE_TO_TWO:
                return newMuseum.secondFloor
            case .TWO_TO_FINAL:
                return newMuseum.finalFloor
            case .FINAL_TO_TWO:
                return newMuseum.secondFloor
            case .TWO_TO_ONE:
                return newMuseum.firstFloor
            }
        }
    }
    
    init(floorLink: FloorLink, floor: FloorType){
        super.init(texture: SKTexture(), highlighted: SKTexture(), color: .clear, size: bloccoSize, type: .USABLE)
        self.floorLink = floorLink
        self.physicsBody = SKPhysicsBody(rectangleOf: bloccoSize)
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.name = "nextLevel"
        self.lightingBitMask =  1|2
        switch floor {
        case .FIRST_FLOOR:
            self.texture = SKTexture(imageNamed: "")
            self.highlightedTexture = SKTexture(imageNamed: "")
        case .SECOND_FLOOE:
            self.texture = SKTexture(imageNamed: "stairsFront")
            self.highlightedTexture = SKTexture(imageNamed: "stairsFront")
            self.normalTexture = SKTexture(imageNamed: "stairsFrontMaschera")
        case .LAST_FLOOR:
            self.texture = SKTexture(imageNamed: "")
            self.highlightedTexture = SKTexture(imageNamed: "")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func loadScene(_ view: SKView, Floor: FloorType){

        switch Floor{
            
        case .FIRST_FLOOR:
            passaggio1 = false
            let scene = TestScene3(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            view.presentScene(scene, transition: .fade(withDuration: 2))
            
        case .SECOND_FLOOE:
            let scene = TestScene4(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            view.presentScene(scene, transition: .fade(withDuration: 2))
            passaggio1 = true
            
        case .LAST_FLOOR:
            print ("hai vinto 2 volte wow wow ")
        }
    }
    
    func getFloorLink()->FloorLink{
        return self.floorLink
    }
}
