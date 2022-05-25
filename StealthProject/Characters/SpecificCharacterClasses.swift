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
        self.name = "player"
        self.physicsBody = SKPhysicsBody(rectangleOf: .init(width: 30, height: 60))
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = ColliderType.PLAYER.rawValue
        self.physicsBody?.collisionBitMask = ColliderType.COLLECTIBLE.rawValue
        self.physicsBody?.contactTestBitMask = ColliderType.COLLECTIBLE.rawValue
        self.physicsBody?.collisionBitMask = ColliderType.DOOR.rawValue
        self.physicsBody?.contactTestBitMask = ColliderType.DOOR.rawValue
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
        super.init(texture: SKTexture(imageNamed: "boyFront"), color: .clear, size: .init(width: 35, height: 70), noise: 3, speed: 3, strenght: 2)
        self.characterName = "Human" //INSERIRE NOME PERSONAGGIO APPENA DISPONIBILE
        self.name = "player"
        self.type = .HUMAN
        self.physicsBody = SKPhysicsBody(rectangleOf: .init(width: 30, height: 60))
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = ColliderType.PLAYER.rawValue
        self.physicsBody?.collisionBitMask = ColliderType.COLLECTIBLE.rawValue
        self.physicsBody?.contactTestBitMask = ColliderType.COLLECTIBLE.rawValue
        self.physicsBody?.collisionBitMask = ColliderType.DOOR.rawValue
        self.physicsBody?.contactTestBitMask = ColliderType.DOOR.rawValue

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
        self.walkingAnimationFrontRight = [SKTexture(imageNamed: "boyWalkDiagonalRight1"),SKTexture(imageNamed: "boyWalkDiagonalRight2"),SKTexture(imageNamed: "boyWalkDiagonalRight3"),SKTexture(imageNamed: "boyWalkDiagonalRight4")]
        self.walkingAnimationBackRight = [SKTexture(imageNamed: "boyWalkOof1"),SKTexture(imageNamed: "boyWalkOof2"),SKTexture(imageNamed: "boyWalkOof3"),SKTexture(imageNamed: "boyWalkOof4")]
        self.walkingAnimationFront = [SKTexture(imageNamed: "boyFrontWalk1"), SKTexture(imageNamed: "boyFrontWalk2"), SKTexture(imageNamed: "boyFrontWalk3"), SKTexture(imageNamed: "boyFrontWalk4")]
        self.walkingAnimationLeft = [SKTexture(imageNamed: "boyWalkLeft1"), SKTexture(imageNamed:"boyWalkLeft2"), SKTexture(imageNamed:"boyWalkLeft3"), SKTexture(imageNamed:"boyWalkLeft4"), SKTexture(imageNamed:"boyWalkLeft5"), SKTexture(imageNamed:"boyWalkLeft6"), SKTexture(imageNamed:"boyWalkLeft7"), SKTexture(imageNamed:"boyWalkLeft8")]
        self.walkingAnimationFrontLeft = [SKTexture(imageNamed: "BoyWalkDiagonal1"),SKTexture(imageNamed: "BoyWalkDiagonal2"),SKTexture(imageNamed: "BoyWalkDiagonal3"),SKTexture(imageNamed: "BoyWalkDiagonal4")]
        self.walkingAnimationBackLeft = [SKTexture(imageNamed: "boyWalkOofLeft1"),SKTexture(imageNamed: "boyWalkOofLeft2"),SKTexture(imageNamed: "boyWalkOofLeft3"),SKTexture(imageNamed: "boyWalkOofLeft4")]
        self.walkingAnimationBack = [SKTexture(imageNamed: "boyBackWalk1"), SKTexture(imageNamed: "boyBackWalk2"), SKTexture(imageNamed: "boyBackWalk3"), SKTexture(imageNamed: "boyBackWalk4")]
        
        self.rollingAnimationRight = [SKTexture(imageNamed: "boyRollRight2"), SKTexture(imageNamed: "boyRollRight3"), SKTexture(imageNamed: "boyRollRight4"), SKTexture(imageNamed: "boyRollRight5"), SKTexture(imageNamed: "boyRollRight6")]
        self.rollingAnimationLeft = [SKTexture(imageNamed: "boyRollLeft2"), SKTexture(imageNamed: "boyRollLeft3"), SKTexture(imageNamed: "boyRollLeft4"), SKTexture(imageNamed: "boyRollLeft5"), SKTexture(imageNamed: "boyRollLeft6")]
        self.rollingAnimationBack = [SKTexture(imageNamed: "boyRollBack2"), SKTexture(imageNamed: "boyRollBack3"), SKTexture(imageNamed: "boyRollBack4"), SKTexture(imageNamed: "boyRollBack5"), SKTexture(imageNamed: "boyRollBack6")]
        self.rollingAnimationFront = [SKTexture(imageNamed: "boyRollForward2"), SKTexture(imageNamed: "boyRollForward3"), SKTexture(imageNamed: "boyRollForward4"), SKTexture(imageNamed: "boyRollForward5"),SKTexture(imageNamed: "boyRollForward6")]
        
        
        self.runningAnimationFront = [SKTexture(imageNamed: "boyRunFront1"), SKTexture(imageNamed: "boyRunFront2"), SKTexture(imageNamed: "boyRunFront3"), SKTexture(imageNamed: "boyRunFront4")]
        self.runningAnimationLeft = [SKTexture(imageNamed: "boyRunLeft1"), SKTexture(imageNamed: "boyRunLeft1m"),SKTexture(imageNamed: "boyRunLeft2"), SKTexture(imageNamed: "boyRunLeft2m"), SKTexture(imageNamed: "boyRunLeft3"), SKTexture(imageNamed: "boyRunLeft3m"), SKTexture(imageNamed: "boyRunLeft4"), SKTexture(imageNamed: "boyRunLeft4m")]
        self.runningAnimationRight = [SKTexture(imageNamed: "boyRunRight1"), SKTexture(imageNamed: "boyRunRight1m"), SKTexture(imageNamed: "boyRunRight2"), SKTexture(imageNamed: "boyRunRight2m"), SKTexture(imageNamed: "boyRunRight3"), SKTexture(imageNamed: "boyRunRight3m"), SKTexture(imageNamed: "boyRunRight4"), SKTexture(imageNamed: "boyRunRight4m")]
        self.runningAnimationBack = [SKTexture(imageNamed: "boyRunBack1"), SKTexture(imageNamed: "boyRunBack2"), SKTexture(imageNamed: "boyRunBack3"), SKTexture(imageNamed: "boyRunBack4")]
        
        self.interactAnimationLeft = [SKTexture(imageNamed: "boyInteraction1"),SKTexture(imageNamed: "boyInteraction2"),SKTexture(imageNamed: "boyInteraction3"),SKTexture(imageNamed: "boyInteraction4")]
        self.interactAnimationRight = [SKTexture(imageNamed: "boyInteractionRight1"),SKTexture(imageNamed: "boyInteractionRight2"),SKTexture(imageNamed: "boyInteractionRight3"),SKTexture(imageNamed: "boyInteractionRight4")]
        self.interactAnimationBack = [SKTexture(imageNamed: "boyInteractionBack1"), SKTexture(imageNamed: "boyInteractionBack2"), SKTexture(imageNamed: "boyInteractionBack3"), SKTexture(imageNamed: "boyInteractionBack4")]
        self.interactAnimationFront = [SKTexture(imageNamed: "boyInteractionFront1"), SKTexture(imageNamed: "boyInteractionFront2"), SKTexture(imageNamed: "boyInteractionFront3"),SKTexture(imageNamed: "boyInteractionFront4")]
        
        self.attackAnimationRight = [SKTexture(imageNamed: "boyAttack1"),SKTexture(imageNamed: "boyAttack1"),SKTexture(imageNamed: "boyAttack2"),SKTexture(imageNamed: "boyAttack2"),SKTexture(imageNamed: "boyAttack3"),SKTexture(imageNamed: "boyAttack3m"),SKTexture(imageNamed: "boyAttack4"),SKTexture(imageNamed: "boyAttack4")]
        self.attackAnimationLeft = [SKTexture(imageNamed: "boyAttackLeft1"),SKTexture(imageNamed: "boyAttackLeft1"),SKTexture(imageNamed: "boyAttackLeft2"),SKTexture(imageNamed: "boyAttackLeft2"),SKTexture(imageNamed: "boyAttackLeft3"),SKTexture(imageNamed: "boyAttackLeft3m"),SKTexture(imageNamed: "boyAttackLeft4"),SKTexture(imageNamed: "boyAttackLeft4")]
        self.attackAnimationBack = [SKTexture(imageNamed: "boyAttackBack1"),SKTexture(imageNamed: "boyAttackBack1"),SKTexture(imageNamed: "boyAttackBack2"),SKTexture(imageNamed: "boyAttackBack2"),SKTexture(imageNamed: "boyAttackBack3"),SKTexture(imageNamed: "boyAttackBack3m"),SKTexture(imageNamed: "boyAttackBack4"),SKTexture(imageNamed: "boyAttackBack4"),]
        self.attackAnimationFront = [SKTexture(imageNamed: "boyAttackFront1"),SKTexture(imageNamed: "boyAttackFront1"),SKTexture(imageNamed: "boyAttackFront2"),SKTexture(imageNamed: "boyAttackFront2"),SKTexture(imageNamed: "boyAttackFront3"),SKTexture(imageNamed: "boyAttackFront3m"),SKTexture(imageNamed: "boyAttackFront4"),SKTexture(imageNamed: "boyAttackFront4"),]
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
