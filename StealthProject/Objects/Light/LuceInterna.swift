//
//  File.swift
//  StealthProject
//
//  Created by Antonio Romano on 24/05/22.
//

import Foundation
import SpriteKit

class LuceInterna: StaticObject, Light{
    var light: SKLightNode = SKLightNode()
    private var isOn: Bool {
        get{
            return light.isEnabled
        }
        set{
            light.isEnabled = newValue
        }
    }
    var animationBool: Bool = false
    
    init(lightBitmask: Int){
        super.init(texture: SKTexture(imageNamed: "light2"), color: .clear, size: .init(width: 30, height: 45), objectName: "wallLight", objectCategory: .LIGHT)
        light.categoryBitMask = UInt32(lightBitmask)
        self.lightingBitMask = UInt32(lightBitmask)
        light.lightColor = .init(red: 239/255, green: 192/255, blue: 112/255, alpha: 0.5)
        light.falloff = 0.5
        light.position.y -= 15
        self.normalTexture = SKTexture(imageNamed: "light2NormalMap")
        self.addChild(light)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
