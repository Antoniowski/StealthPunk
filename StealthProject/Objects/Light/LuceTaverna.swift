//
//  LuceTaverna.swift
//  StealthProject
//
//  Created by Antonio Romano on 22/05/22.
//

import SpriteKit

class LuceTaverna: StaticObject, Light{
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
        super.init(texture: SKTexture(imageNamed: "parete lanterna"), color: .clear, size: bloccoSize, objectName: "wallLight", objectCategory: .LIGHT)
        light.categoryBitMask = UInt32(lightBitmask)
        self.lightingBitMask = UInt32(lightBitmask)
        light.lightColor = .init(red: 239/255, green: 192/255, blue: 112/255, alpha: 0.5)
        light.position.y -= 20
        light.falloff = 0.5
        self.normalTexture = SKTexture(imageNamed: "parete laterna normal texture")
        self.addChild(light)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
