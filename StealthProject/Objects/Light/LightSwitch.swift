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
    var ONTexture: SKTexture = SKTexture()
    private var isOn: Bool = false
    
    init(referredLightName: String){
        super.init(texture: SKTexture(imageNamed: "interruttoreOFF"), highlighted: SKTexture(imageNamed: "interruttoreBlur"), color: .clear, size: CGSize(width: 50, height: 50), type: .USABLE)
        self.referredLight = referredLightName
        self.setUsableCategory(.SWITCH)
        self.ONTexture = SKTexture(imageNamed: "interruttoreON")
    }
    
    init(texture: SKTexture?, highlighted: SKTexture?, color: UIColor, size: CGSize, referredLightName: String) {
        super.init(texture: texture, highlighted: highlighted, color: color, size: size, type: .USABLE)
        self.referredLight = referredLightName
        self.setUsableCategory(.SWITCH)
        self.highlightedTexture = SKTexture(imageNamed: "interruttoreBlur")
        self.ONTexture = SKTexture(imageNamed: "interruttoreON")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func action(light: Light) {
        light.toggle()
    }
    
    func action(_ scene: SKScene) {
//        print("Entro nel action")
        if isOn{
            isOn = false
            self.run(.setTexture(baseTexture))
        }else{
            isOn = true
            self.run(.setTexture(ONTexture))
        }
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
    
    func getOnOffStatus()->Bool{
        return self.isOn
    }
}
