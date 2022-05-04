//
//  PlayerClass.swift
//  StealthProject
//
//  Created by Antonio Romano on 03/05/22.
//

import Foundation
import SpriteKit

enum ActionState: Int{
    case MOVE = 0
    case ATTACK = 1
    case ROLL = 3
    case INTERACT = 4
}

enum CharacterType: Int{
    case HUMAN = 0
    case HUMANGIRL = 1
    case BIGGUS = 2
    case COSOCONLARUOTA = 3
}

struct CharacterState{
    var isHidden: Bool = false
    var isInvicible: Bool = false
}

class PlayableCharacterClass: SKSpriteNode{

    
    private var noise: Int = 0
    private var strenght: Int = 0
    private var characterSpeed: Int = 0
    
    private var status: CharacterState = CharacterState()
    private var actionState: ActionState = .MOVE
    
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    init(texture: SKTexture?, color: UIColor, size: CGSize, noise: Int, speed: Int, strenght: Int) {
        super.init(texture: texture, color: color, size: size)
        self.noise = noise
        self.characterSpeed = speed
        self.strenght = strenght
    }
    
//    init(texture: SKTexture?, color: UIColor, size: CGSize, characterType: CharacterType) {
//        super.init(texture: texture, color: color, size: size)
//        self.type = characterType
//        switch characterType {
//        case .HUMAN:
//            self.noise = 2
//            self.strenght = 1
//            self.characterSpeed = 4
//        case .HUMANGIRL:
//            self.noise = 0
//            self.strenght = 2
//            self.characterSpeed = 3
//        case .BIGGUS:
//            self.noise = 5
//            self.strenght = 4
//            self.characterSpeed = 1
//        case .COSOCONLARUOTA:
//            self.noise = 2
//            self.strenght = 5
//            self.characterSpeed = 5
//        }
//    }
    
    
//    GET FUNCTIONS
    
    func getNoise()->Int{
        return self.noise
    }
    
    func getStrenght()->Int{
        return self.strenght
    }
    
    func getSpeed()->Int{
        return self.characterSpeed
    }
    
//    func getType()->CharacterType{
//        return self.type
//    }
    
    func getStatus()->CharacterState{
        return self.status
    }
    
    func getActionState()->ActionState{
        return self.actionState
    }
    
    
    
//    SET FUNCTIONS
    
    func setNoise(newNoise: Int){
        self.noise = newNoise
    }
    
    func setStrenght(newStrenght: Int){
        self.strenght = newStrenght
    }
    
    func setSpeed(newSpeed: Int){
        self.characterSpeed = newSpeed
    }
    
    func setHiddenStatus(_ newStatus: Bool){
        self.status.isHidden = newStatus
    }
    
    func toggleHiddenStatus(){
        self.status.isHidden.toggle()
    }
    
    func setInvicibleStatus(_ newStatus: Bool){
        self.status.isInvicible = newStatus
    }
    
    func toggleInvincibleStatus(){
        self.status.isInvicible.toggle()
    }
    
    func setActionState(_ newActionState: ActionState){
        self.actionState = newActionState
    }
    
}

