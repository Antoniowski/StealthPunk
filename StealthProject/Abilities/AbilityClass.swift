//
//  AbilityClass.swift
//  StealthProject
//
//  Created by Antonio Romano on 05/05/22.
//

import Foundation
import SpriteKit

class Ability{
    private var abilityName: String = ""
    private var description: String = ""
    private var sprite: SKSpriteNode = SKSpriteNode()
    
    init(name: String, description: String, sprite: SKSpriteNode){
        self.abilityName = name
        self.description = description
        self.sprite = sprite
    }
    
//    GET FUNCTIONS
    
    func getName()->String{
        return self.abilityName
    }
    
    func getDescription()->String{
        return self.description
    }
}
