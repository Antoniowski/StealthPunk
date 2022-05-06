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
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, type: ObjectType){
        super.init(texture: texture, color: color, size: size)
        self.name = "interactable"
        self.spotted = false
        self.inUse = false
        self.type = type
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
