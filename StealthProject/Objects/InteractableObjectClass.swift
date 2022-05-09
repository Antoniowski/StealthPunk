//
//  InteractableObjectClass.swift
//  StealthProject
//
//  Created by Antonio Romano on 06/05/22.
//

import Foundation
import SpriteKit

enum ObjectType: Int{
    case HIDEOUT = 0
    case USABLE = 1
}

class InteractableObject: SKSpriteNode{
    private var objectName: String = ""
    private var type: ObjectType = .USABLE
    
    private var spotted: Bool = false
    private var inUse: Bool = false
    
    var baseTexture: SKTexture = SKTexture()
    var highlightedTexture: SKTexture?
    var shapeHighlighted: SKShapeNode = SKShapeNode(rectOf: CGSize(width: 100, height: 100))
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(texture: SKTexture?, highlighted: SKTexture?, color: UIColor, size: CGSize, type: ObjectType){
        super.init(texture: texture, color: color, size: size)
        self.baseTexture = texture ?? SKTexture()
        self.highlightedTexture = highlighted
        self.spotted = false
        self.inUse = false
        self.type = type
        self.name = "dynamicObject"
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: size.width, height: size.height/2), center: CGPoint(x: 0, y: size.height/4))
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.allowsRotation = false
    }
    
    func action(){
        //DA PERSONALIZZARE IN OGNI SOTTO CLASSE SPECIFICA
    }
    
    
    
    //GET FUNCTIONS
    
    func getName()->String{
        return self.objectName
    }
    
    func getType()->ObjectType{
        return self.type
    }
    
    func getSpottedStatus()->Bool{
        return self.spotted
    }
    
    func getUseStatus()->Bool{
        return self.inUse
    }
    
//    SET FUNCTIONS
    
    func setName(_ newName: String){
        self.objectName = newName
    }
    
    func setType(_ newType: ObjectType){
        self.type = newType
    }
    
    func setUseStatus(_ newStatus: Bool){
        self.inUse = newStatus
    }
    
    func setSpottedStatus(_ newStatus: Bool){
        self.spotted = newStatus
    }
    
}
