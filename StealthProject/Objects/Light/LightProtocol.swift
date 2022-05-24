//
//  LightProtocol.swift
//  StealthProject
//
//  Created by Antonio Romano on 09/05/22.
//

import Foundation
import SpriteKit

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}

protocol Light{
    var light: SKLightNode {get set}
}

extension Light{
    var isOn: Bool{
        get{
            return light.isEnabled
        }
        set{
            light.isEnabled = newValue
        }
    }
    
    func toggle(){
        if isOn == true{
            light.isEnabled = false
        }else{
            light.isEnabled = true
        }
    }
    
    func getLightAlpha()->Double{
        return light.lightColor.rgba.alpha
    }
}
