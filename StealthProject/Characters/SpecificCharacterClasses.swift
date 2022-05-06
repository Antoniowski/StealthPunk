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
    

    
    override init(texture: SKTexture?, color: UIColor, size: CGSize, noise: Int, speed: Int, strenght: Int) {
        super.init(texture: texture, color: color, size: size, noise: noise, speed: speed, strenght: strenght)
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.walkingAnimationRight = [SKTexture(imageNamed: "boyWalk1"), SKTexture(imageNamed:"boyWalk2"), SKTexture(imageNamed:"boyWalk3"), SKTexture(imageNamed:"boyWalk4"), SKTexture(imageNamed:"boyWalk5"), SKTexture(imageNamed:"boyWalk6"), SKTexture(imageNamed:"boyWalk7"), SKTexture(imageNamed:"boyWalk8")]
        self.walkingAnimationFront = [SKTexture(imageNamed: "boyFrontWalk1"), SKTexture(imageNamed: "boyFrontWalk2"), SKTexture(imageNamed: "boyFrontWalk3"), SKTexture(imageNamed: "boyFrontWalk4")]
        self.walkingAnimationLeft = [SKTexture(imageNamed: "boyWalkLeft1"), SKTexture(imageNamed:"boyWalkLeft2"), SKTexture(imageNamed:"boyWalkLeft3"), SKTexture(imageNamed:"boyWalkLeft4"), SKTexture(imageNamed:"boyWalkLeft5"), SKTexture(imageNamed:"boyWalkLeft6"), SKTexture(imageNamed:"boyWalkLeft7"), SKTexture(imageNamed:"boyWalkLeft8")]
        self.walkingAnimationBack = [SKTexture(imageNamed: "boyBackWalk1"), SKTexture(imageNamed: "boyBackWalk2"), SKTexture(imageNamed: "boyBackWalk3"), SKTexture(imageNamed: "boyBackWalk4")]
        
        self.rollingAnimationRight = [SKTexture(imageNamed: "boyRoll1"), SKTexture(imageNamed: "boyRoll2"), SKTexture(imageNamed: "boyRoll3"), SKTexture(imageNamed: "boyRoll4"), SKTexture(imageNamed: "boyRoll5"), SKTexture(imageNamed: "boyRoll6"), SKTexture(imageNamed: "boyRoll7"), SKTexture(imageNamed: "boyRoll8"), SKTexture(imageNamed: "boyRoll9"), SKTexture(imageNamed: "boyRoll10"), SKTexture(imageNamed: "boyRoll11")]

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.characterName = "Human" //INSERIRE NOME PERSONAGGIO APPENA DISPONIBILE
        self.type = .HUMAN
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        self.walkingAnimationRight = [SKTexture(imageNamed: "boyWalk1"), SKTexture(imageNamed:"boyWalk2"), SKTexture(imageNamed:"boyWalk3"), SKTexture(imageNamed:"boyWalk4"), SKTexture(imageNamed:"boyWalk5"), SKTexture(imageNamed:"boyWalk6"), SKTexture(imageNamed:"boyWalk7"), SKTexture(imageNamed:"boyWalk8")]
        self.walkingAnimationFront = [SKTexture(imageNamed: "boyFrontWalk1"), SKTexture(imageNamed: "boyFrontWalk2"), SKTexture(imageNamed: "boyFrontWalk3"), SKTexture(imageNamed: "boyFrontWalk4")]
        self.walkingAnimationLeft = [SKTexture(imageNamed: "boyWalkLeft1"), SKTexture(imageNamed:"boyWalkLeft2"), SKTexture(imageNamed:"boyWalkLeft3"), SKTexture(imageNamed:"boyWalkLeft4"), SKTexture(imageNamed:"boyWalkLeft5"), SKTexture(imageNamed:"boyWalkLeft6"), SKTexture(imageNamed:"boyWalkLeft7"), SKTexture(imageNamed:"boyWalkLeft8")]
        self.walkingAnimationBack = [SKTexture(imageNamed: "boyBackWalk1"), SKTexture(imageNamed: "boyBackWalk2"), SKTexture(imageNamed: "boyBackWalk3"), SKTexture(imageNamed: "boyBackWalk4")]
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
