//
//  StaticObject.swift
//  StealthProject
//
//  Created by Antonio Romano on 09/05/22.
//

import Foundation
import SpriteKit

class StaticObject: SKSpriteNode{
    private var objectName: String = ""
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.name = "staticObject"
        setPhysicBody()
    }
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, name: String) {
        super.init(texture: texture, color: color, size: size)
        self.objectName = name
        self.name = "staticObject"
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
    
    
    //SETFUNCTIONS
    
    func setName(_ newName: String){
        self.objectName = newName
    }
}
