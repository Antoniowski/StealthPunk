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
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(isOpen: Bool){
        if isOpen == false{
            super.init(texture: closedTexture, color: .clear, size: CGSize(width: blocco, height: blocco))
            self.isOpen = false
        }else{
            super.init(texture: openTexure, color: .clear, size: CGSize(width: blocco, height: blocco))
            self.isOpen = true
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
