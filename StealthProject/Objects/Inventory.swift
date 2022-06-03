//
//  Inventory.swift
//  StealthProject
//
//  Created by Martina Ottaviano on 31/05/22.
//

import Foundation
import SpriteKit


class Inventory: UsableObject {
    var statoInventario: Bool = false
    var openTexture: SKTexture = SKTexture(imageNamed: "forziereAperto")
    init(){
        super.init(texture: SKTexture(imageNamed: "forziere"), highlighted: SKTexture(imageNamed: "blur forziere"), color: .clear, size: bloccoSize, type: .USABLE)
        self.setUsableCategory(.TAVERNA_SCRIGNO)
        
    }
    
    func action(scene: SKScene) {
       
        if(statoInventario){
            scene.camera!.childNode(withName: "cornice")?.removeFromParent()
            statoInventario = false
        }
        else{
            let sfondo = InventoryPage()
            sfondo.name = "cornice"
            scene.camera!.addChild(sfondo)
            statoInventario = true
        }
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
