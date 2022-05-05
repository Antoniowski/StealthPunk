//
//  HumanClass.swift
//  StealthProject
//
//  Created by Antonio Romano on 05/05/22.
//

import Foundation
import SpriteKit

class Human: PlayableCharacter{
    private var characterName: String = ""
    private var type: CharacterType = .HUMAN
//    private var ability: Ability
    
    private var idleAnimation: [SKTexture] = []
    private var walkingAnimation: [SKTexture] = []
    private var runningAnimation: [SKTexture] = []
    private var shootingAnimation: [SKTexture] = []
    private var attackAnimation: [SKTexture] = []
    private var interactAnimation: [SKTexture] = []
    private var hideAnimation: [SKTexture] = []
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize, noise: Int, speed: Int, strenght: Int) {
        super.init(texture: texture, color: color, size: size, noise: noise, speed: speed, strenght: strenght)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.characterName = "Human" //INSERIRE NOME PERSONAGGIO APPENA DISPONIBILE
        self.type = .HUMAN
    }
    
//    GET FUNCTIONS
    
    func getType()->CharacterType{
        return self.type
    }
    
    func getCharacterName()->String{
        return self.characterName
    }
    
    
//    SET FUNCTIONS
    
    func setType(_ newType: CharacterType){
        self.type = newType
    }
    
    func setCharacterName(_ newName: String){
        self.characterName = newName
    }
}

class HumanGirl: PlayableCharacter{
    private var characterName: String = ""
    private var type: CharacterType = .HUMANGIRL
//    private var ability: Ability
    
    
    private var idleAnimation: [SKTexture] = []
    private var walkingAnimation: [SKTexture] = []
    private var runningAnimation: [SKTexture] = []
    private var shootingAnimation: [SKTexture] = []
    private var attackAnimation: [SKTexture] = []
    private var interactAnimation: [SKTexture] = []
    private var hideAnimation: [SKTexture] = []
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize, noise: Int, speed: Int, strenght: Int) {
        super.init(texture: texture, color: color, size: size, noise: noise, speed: speed, strenght: strenght)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.characterName = "HumanGirl" //INSERIRE NOME PERSONAGGIO APPENA DISPONIBILE
        self.type = .HUMANGIRL
    }
    
    
    //    GET FUNCTIONS
        
        func getType()->CharacterType{
            return self.type
        }
        
        func getCharacterName()->String{
            return self.characterName
        }
        
        
    //    SET FUNCTIONS
        
        func setType(_ newType: CharacterType){
            self.type = newType
        }
        
        func setCharacterName(_ newName: String){
            self.characterName = newName
        }
}

class Big: PlayableCharacter{
    private var characterName: String = ""
    private var type: CharacterType = .BIGGUS
//    private var ability: Ability
    
    
    private var idleAnimation: [SKTexture] = []
    private var walkingAnimation: [SKTexture] = []
    private var runningAnimation: [SKTexture] = []
    private var shootingAnimation: [SKTexture] = []
    private var attackAnimation: [SKTexture] = []
    private var interactAnimation: [SKTexture] = []
    private var hideAnimation: [SKTexture] = []
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize, noise: Int, speed: Int, strenght: Int) {
        super.init(texture: texture, color: color, size: size, noise: noise, speed: speed, strenght: strenght)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.characterName = "Big" //INSERIRE NOME PERSONAGGIO APPENA DISPONIBILE
        self.type = .BIGGUS
    }
    
    //    GET FUNCTIONS
        
        func getType()->CharacterType{
            return self.type
        }
        
        func getCharacterName()->String{
            return self.characterName
        }
        
        
    //    SET FUNCTIONS
        
        func setType(_ newType: CharacterType){
            self.type = newType
        }
        
        func setCharacterName(_ newName: String){
            self.characterName = newName
        }
    
}

class Robot: PlayableCharacter{
    private var characterName: String = ""
    private var type: CharacterType = .COSOCONLARUOTA
//    private var ability: Ability
    
    
    private var idleAnimation: [SKTexture] = []
    private var walkingAnimation: [SKTexture] = []
    private var runningAnimation: [SKTexture] = []
    private var shootingAnimation: [SKTexture] = []
    private var attackAnimation: [SKTexture] = []
    private var interactAnimation: [SKTexture] = []
    private var hideAnimation: [SKTexture] = []
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize, noise: Int, speed: Int, strenght: Int) {
        super.init(texture: texture, color: color, size: size, noise: noise, speed: speed, strenght: strenght)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.characterName = "Coso" //INSERIRE NOME PERSONAGGIO APPENA DISPONIBILE
        self.type = .COSOCONLARUOTA
    }
    
    //    GET FUNCTIONS
        
        func getType()->CharacterType{
            return self.type
        }
        
        func getCharacterName()->String{
            return self.characterName
        }
        
        
    //    SET FUNCTIONS
        
        func setType(_ newType: CharacterType){
            self.type = newType
        }
        
        func setCharacterName(_ newName: String){
            self.characterName = newName
        }
    
}
