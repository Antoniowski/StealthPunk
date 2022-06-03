//
//  Lampione.swift
//  StealthProject
//
//  Created by Antonio Romano on 09/05/22.
//

import Foundation
import SpriteKit

class Lampione: StaticObject, Light{
    
    var light: SKLightNode = SKLightNode()
    private var isOn: Bool {
        get{
            return light.isEnabled
        }
        set{
            light.isEnabled = newValue
        }
    }
    init(lightBitmask: Int){
        super.init(texture: SKTexture(imageNamed: "lampione"), color: .clear, size: .init(width: 70, height: 140), objectName: "lampione", objectCategory: .LIGHT)
        light.categoryBitMask = UInt32(lightBitmask)
        light.isEnabled = false
        self.lightingBitMask = UInt32(lightBitmask)
        light.lightColor = .init(red: 239/255, green: 192/255, blue: 112/255, alpha: 0.5)
        light.position.y += 20
        light.falloff = 1
        light.ambientColor = .clear
        self.addChild(light)
        self.normalTexture = SKTexture(imageNamed: "lampione normal map")
        self.physicsBody = SKPhysicsBody(rectangleOf: .init(width: 30, height: 70), center: .init(x: 0, y: 30))
        self.physicsBody?.isDynamic = false
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
    }
//    override init(texture: SKTexture?, color: UIColor, size: CGSize, objectName: String, objectCategory: StaticObjectCategory) {
//        super.init(texture: texture, color: color, size: size, objectName: objectName, objectCategory: .LIGHT)
//        self.addChild(light)
//    }
//
//    init(texture: SKTexture?, color: UIColor, size: CGSize, objectName: String, lightBitmask: Int) {
//        super.init(texture: texture, color: color, size: size,objectName: objectName, objectCategory: .LIGHT)
//        light.categoryBitMask = UInt32(lightBitmask)
//        self.lightingBitMask = UInt32(lightBitmask)
//        self.addChild(light)
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //GET FUNCTIONS
    
    func getStatus()->Bool{
        return self.isOn
    }
}


