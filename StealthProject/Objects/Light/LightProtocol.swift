//
//  LightProtocol.swift
//  StealthProject
//
//  Created by Antonio Romano on 09/05/22.
//

import Foundation
import SpriteKit

protocol Light{
    var light: SKLightNode {get}
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
}
