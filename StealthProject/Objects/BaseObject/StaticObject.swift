//
//  StaticObject.swift
//  StealthProject
//
//  Created by Antonio Romano on 09/05/22.
//

import Foundation
import SpriteKit

enum StaticObjectCategory: Int{
    case LIGHT = 0
    case MOBILIO = 1
}

class StaticObject: SKSpriteNode{
    private var objectName: String = ""
    private var objectCategory: StaticObjectCategory = .LIGHT
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.name = "staticObject"
        setPhysicBody()
    }
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, objectName: String, objectCategory: StaticObjectCategory) {
        super.init(texture: texture, color: color, size: size)
        self.objectName = objectName
        self.name = "staticObject"
        self.objectCategory = objectCategory
        setPhysicBody()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setPhysicBody(){
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: size.width, height: size.height/2), center: CGPoint(x: 0, y: size.height/4))
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
        self.physicsBody?.allowsRotation = false
    }
    
    //GET FUNCTIONS
    
    func getName()->String{
        return self.objectName
    }
    
    func getCategory()->StaticObjectCategory{
        return self.objectCategory
    }
    
    
    //SETFUNCTIONS
    
    func setName(_ newName: String){
        self.objectName = newName
    }
    
    func setCategory(_ newCategory: StaticObjectCategory){
        self.objectCategory = newCategory
    }
}
