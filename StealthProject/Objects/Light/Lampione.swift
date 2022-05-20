//
//  Lampione.swift
//  StealthProject
//
//  Created by Antonio Romano on 09/05/22.
//

import Foundation
import SpriteKit

class Lampione: StaticObject, Light{
    
    internal let light: SKLightNode = SKLightNode()
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
        self.lightingBitMask = UInt32(lightBitmask)
        light.position.y += 20
        self.addChild(light)
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


