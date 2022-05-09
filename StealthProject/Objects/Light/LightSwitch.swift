//
//  LightSwitch.swift
//  StealthProject
//
//  Created by Antonio Romano on 09/05/22.
//

import Foundation
import SpriteKit

class LightSwitch: UsableObject{
    private var referredLight: String = ""
    
    init(texture: SKTexture?, highlighted: SKTexture?, color: UIColor, size: CGSize, referredLightName: String) {
        super.init(texture: texture, highlighted: highlighted, color: color, size: size, type: .USABLE)
        self.referredLight = referredLightName
        self.setUsableCategory(.SWITCH)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func action(light: Light) {
        light.toggle()
    }
    
    func action(_ scene: SKScene) {
//        print("Entro nel action")
        scene.enumerateChildNodes(withName: "staticObject"){ oggetto, _ in
            let staticObj = oggetto as? StaticObject
            switch staticObj?.getCategory(){
            case .LIGHT:
                let light = staticObj as? Light
                light?.toggle()
//                print("LUCE TOCCATA")
            default:
                return
            }
        }
    }
}
