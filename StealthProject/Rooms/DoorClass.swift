//
//  DoorClass.swift
//  StealthProject
//
//  Created by Antonio Romano on 13/05/22.
//

import Foundation
import SpriteKit

class Door: SKSpriteNode{
    
    private var isOpen: Bool = false
    
    private var closedTexture: SKTexture = SKTexture()
    private var openTexure: SKTexture = SKTexture()
    private var doorPlacement: DoorPlacement = .UP
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(_ placement: DoorPlacement, isOpen: Bool){
        if isOpen == false{
            super.init(texture: closedTexture, color: .clear, size: CGSize(width: blocco, height: blocco))
            self.doorPlacement = placement
            setTexture(placement)
            self.isOpen = false
            self.run(.setTexture(closedTexture))
        }else{
            super.init(texture: openTexure, color: .clear, size: CGSize(width: blocco, height: blocco))
            self.doorPlacement = placement
            setTexture(placement)
            self.isOpen = true
            self.run(.setTexture(openTexure))
        }
    }
    
    private func setTexture(_ placement: DoorPlacement){
        switch placement {
        case .UP, .DOWN:
            closedTexture = SKTexture(imageNamed: "doorClosed")
            openTexure = SKTexture(imageNamed: "") //AGGIUNGERE TEXTURE PORTA APERTA
        case .LEFT:
            closedTexture = SKTexture(imageNamed: "doorLeft")
            openTexure = SKTexture(imageNamed: "") //AGGIUNGERE TEXTURE PORTA APERTA
        case .RIGHT:
            closedTexture = SKTexture(imageNamed: "doorRight")
            openTexure = SKTexture(imageNamed: "") //AGGIUNGERE TEXTURE PORTA APERTA
        }
    }
    
                 
    func getOpenStaus()->Bool{
        return self.isOpen
    }
    
    func open(){
        self.isOpen = true
        self.run(.setTexture(openTexure))
    }
}
