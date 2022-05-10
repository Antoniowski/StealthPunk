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
        setAnimationArrays()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        self.characterName = "Human" //INSERIRE NOME PERSONAGGIO APPENA DISPONIBILE
        self.type = .HUMAN
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        setAnimationArrays()
    }
    
    init(){
        super.init(texture: SKTexture(imageNamed: "boyFront"), color: .clear, size: CGSize(width: 35, height: 75))
        self.characterName = "Human" //INSERIRE NOME PERSONAGGIO APPENA DISPONIBILE
        self.type = .HUMAN
        self.physicsBody = SKPhysicsBody(rectangleOf: size)
        setAnimationArrays()
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
    
    private func setAnimationArrays(){
        self.frontTexture = SKTexture(imageNamed: "boyFront")
        self.backTexture = SKTexture(imageNamed: "boyBack")
        self.sideLTexture = SKTexture(imageNamed: "boySideL")
        self.sideRTexture = SKTexture(imageNamed: "boySideR")
        self.halfBackLTexture = SKTexture(imageNamed: "boyHalfBackL")
        self.halfBackRTexture = SKTexture(imageNamed: "boyHalfBackR")
        self.halfFrontRTexture = SKTexture(imageNamed: "boyHalfFrontR")
        self.halfFrontLTexture = SKTexture(imageNamed: "boyHalfFrontL")
        
        self.walkingAnimationRight = [SKTexture(imageNamed: "boyWalk1"), SKTexture(imageNamed:"boyWalk2"), SKTexture(imageNamed:"boyWalk3"), SKTexture(imageNamed:"boyWalk4"), SKTexture(imageNamed:"boyWalk5"), SKTexture(imageNamed:"boyWalk6"), SKTexture(imageNamed:"boyWalk7"), SKTexture(imageNamed:"boyWalk8")]
        self.walkingAnimationFront = [SKTexture(imageNamed: "boyFrontWalk1"), SKTexture(imageNamed: "boyFrontWalk2"), SKTexture(imageNamed: "boyFrontWalk3"), SKTexture(imageNamed: "boyFrontWalk4")]
        self.walkingAnimationLeft = [SKTexture(imageNamed: "boyWalkLeft1"), SKTexture(imageNamed:"boyWalkLeft2"), SKTexture(imageNamed:"boyWalkLeft3"), SKTexture(imageNamed:"boyWalkLeft4"), SKTexture(imageNamed:"boyWalkLeft5"), SKTexture(imageNamed:"boyWalkLeft6"), SKTexture(imageNamed:"boyWalkLeft7"), SKTexture(imageNamed:"boyWalkLeft8")]
        self.walkingAnimationBack = [SKTexture(imageNamed: "boyBackWalk1"), SKTexture(imageNamed: "boyBackWalk2"), SKTexture(imageNamed: "boyBackWalk3"), SKTexture(imageNamed: "boyBackWalk4")]
        
        self.rollingAnimationRight = [SKTexture(imageNamed: "boyRollRight2"), SKTexture(imageNamed: "boyRollRight3"), SKTexture(imageNamed: "boyRollRight4"), SKTexture(imageNamed: "boyRollRight5"), SKTexture(imageNamed: "boyRollRight6")]
        self.rollingAnimationLeft = [SKTexture(imageNamed: "boyRollLeft2"), SKTexture(imageNamed: "boyRollLeft3"), SKTexture(imageNamed: "boyRollLeft4"), SKTexture(imageNamed: "boyRollLeft5"), SKTexture(imageNamed: "boyRollLeft6")]
        self.rollingAnimationBack = [SKTexture(imageNamed: "boyRollBack2"), SKTexture(imageNamed: "boyRollBack3"), SKTexture(imageNamed: "boyRollBack4"), SKTexture(imageNamed: "boyRollBack5"), SKTexture(imageNamed: "boyRollBack6")]
        self.rollingAnimationFront = [SKTexture(imageNamed: "boyRollForward2"), SKTexture(imageNamed: "boyRollForward3"), SKTexture(imageNamed: "boyRollForward4"), SKTexture(imageNamed: "boyRollForward5"),SKTexture(imageNamed: "boyRollForward6")]
        
        
        self.runningAnimationFront = [SKTexture(imageNamed: "boyRunFront1"), SKTexture(imageNamed: "boyRunFront2"), SKTexture(imageNamed: "boyRunFront3"), SKTexture(imageNamed: "boyRunFront4")]
        self.runningAnimationLeft = [SKTexture(imageNamed: "boyRunLeft1"), SKTexture(imageNamed: "boyRunLeft2"), SKTexture(imageNamed: "boyRunLeft3"),SKTexture(imageNamed: "boyRunLeft4")]
        self.runningAnimationRight = [SKTexture(imageNamed: "boyRunRight1"), SKTexture(imageNamed: "boyRunRight2"), SKTexture(imageNamed: "boyRunRight3"), SKTexture(imageNamed: "boyRunRight4")]
        //TEMPORANEO PER TEST
        self.attackAnimationFront = [SKTexture(imageNamed: "boyFront"), SKTexture(imageNamed: "boyHalfFrontL"), SKTexture(imageNamed: "boySideL"), SKTexture(imageNamed: "boyHalfBackL"), SKTexture(imageNamed: "boyBack"), SKTexture(imageNamed: "boyHalfBackR"), SKTexture(imageNamed: "boySideR"), SKTexture(imageNamed: "boyHalfFrontR")]
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
