//
//  TavernaDoor.swift
//  StealthProject
//
//  Created by Antonio Romano on 22/05/22.
//

import SpriteKit

class TavernaDoor: UsableObject{
    
    private var closedNormalTexture: SKTexture = SKTexture(imageNamed: "porta chiusa normal map")
    private var openNormalTexture: SKTexture = SKTexture(imageNamed: "porta aperta normal map")
    
    init(){
        super.init(texture: SKTexture(imageNamed: "porta chiusa"), highlighted: SKTexture(imageNamed: "porta aperta"), color: .clear, size: bloccoSize, type: .USABLE)
        self.setName("TavernaDoor")
        self.normalTexture = SKTexture(imageNamed: "porta chiusa normal map")
        self.setUsableCategory(.TAVERNA_DOOR)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateNormalTexture(){
        self.normalTexture = closedNormalTexture
        if getSpottedStatus() == true{
            self.normalTexture = openNormalTexture
        }
    }
    
    override func action() {
        print("START GAME")
    }
    
    func action(_ view: SKView){
        view.presentScene(newMuseum.firstFloor, transition: .fade(withDuration: 3))
    }
}
