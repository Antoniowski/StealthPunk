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
    override init(texture: SKTexture?, color: UIColor, size: CGSize, objectName: String, objectCategory: StaticObjectCategory) {
        super.init(texture: texture, color: color, size: size, objectName: objectName, objectCategory: .LIGHT)
        self.addChild(light)
    }
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, objectName: String, lightBitmask: Int) {
        super.init(texture: texture, color: color, size: size,objectName: objectName, objectCategory: .LIGHT)
        light.categoryBitMask = UInt32(lightBitmask)
        self.lightingBitMask = UInt32(lightBitmask)
        self.addChild(light)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //GET FUNCTIONS
    
    func getStatus()->Bool{
        return self.isOn
    }
}


