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

class PlayableCharacter: SKSpriteNode{

    
    private var noise: Int = 0
    private var strenght: Int = 0
    private var characterSpeed: Int = 0
    
    private var status: CharacterState = CharacterState()
    private var actionState: ActionState = .MOVE
    private var movingDirection: Direction = .DOWN
    private var facingDirection: Direction = .DOWN
    private var idle: Bool = true
    
    private var noiseDitance: Double = 0
    
    private var interactRange: Double = 25
    private var attackRange: Double = 25
    
    
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
    
    func updateActionState(){
        if buttonAIsPressed && self.actionState != .ROLL{
            self.actionState = .ROLL
        }
        if buttonAIsPressed == false && self.actionState == .ROLL{
            self.actionState = .MOVE
        }
    }
    
    func updateMovingDirection(){    //FUNZIONA: Aggiorna una sola volta il moving direction
        if myMovement != .zero{
            if Double(myAngle) >= pi/4 && Double(myAngle) <= 3*pi/4{
                if self.movingDirection != .RIGHT{
                    self.movingDirection = .RIGHT
                }
            }else if Double(myAngle) > 3*pi/4 && Double(myAngle) <= pi || Double(myAngle) < -3*pi/4 && Double(myAngle) > -pi{
                if self.movingDirection != .DOWN{
                    self.movingDirection = .DOWN
                }
            }else if Double(myAngle) <= -pi/4 && Double(myAngle) >= -3*pi/4{
                if self.movingDirection != .LEFT{
                    self.movingDirection = .LEFT
                }
            }else if Double(myAngle) > -pi/4 && Double(myAngle) < pi/4{
                if self.movingDirection != .UP{
                    self.movingDirection = .UP
                }
            }
        }
    }
    
    func animationWalking(){
        updateMovingDirection()
        if actionState == .MOVE{
            switch movingDirection {
            case .UP:
                if myMovement != .zero && (self.idle == true || self.facingDirection != .UP){
                    self.idle = false
                    self.facingDirection = .UP
                    self.run(.repeatForever(.animate(with: test4, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.idle == false{
                    self.removeAllActions()
                    self.idle = true
                    self.run(.setTexture(SKTexture(imageNamed: "boyBack")))
                }
            case .UP_RIGHT:
                print("TODO")
            case .RIGHT:
                if myMovement != .zero && (self.idle == true || self.facingDirection != .RIGHT){
                    self.idle = false
                    self.facingDirection = .RIGHT
                    self.run(.repeatForever(.animate(with: test, timePerFrame: 0.18)))
                        
                }else if myMovement == .zero && self.idle == false{
                    self.removeAllActions()
                    self.idle = true
                    self.run(.setTexture(SKTexture(imageNamed: "boySideR")))
                }
            case .DOWN_RIGHT:
                print("TODO")

            case .DOWN:
                if myMovement != .zero && (self.idle == true || self.facingDirection != .DOWN){
                    self.idle = false
                    self.facingDirection = .DOWN
                    self.run(.repeatForever(.animate(with: test2, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.idle == false{
                    self.removeAllActions()
                    self.idle = true
                    self.run(.setTexture(SKTexture(imageNamed: "boyFront")))
                }
            case .DOWN_LEFT:
                print("TODO")

            case .LEFT:
                if myMovement != .zero && (self.idle == true || self.facingDirection != .LEFT){
                    self.idle = false
                    self.facingDirection = .LEFT
                    self.run(.repeatForever(.animate(with: test3, timePerFrame: 0.18)))
                        
                }else if myMovement == .zero && self.idle == false{
                    self.removeAllActions()
                    self.idle = true
                    self.run(.setTexture(SKTexture(imageNamed: "boySideL")))
                }
            case .UP_LEFT:
                print("TODO")

            }
        }
    }
    
    
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
    
    func getNoiseDistance()->Double{
        return self.noiseDitance
    }
    
    
    func getStatus()->CharacterState{
        return self.status
    }
    
    func getActionState()->ActionState{
        return self.actionState
    }
    
    func getAttackRange()->Double{
        return self.attackRange
    }
    
    func getInteractRange()->Double{
        return self.interactRange
    }
    
    func getFacingDirection()->Direction{
        return self.facingDirection
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
    
    func setNoiceDistance(_ newDistance: Double){
        self.noiseDitance = newDistance
    }
    
    func setAttackRange(_ newRange: Double){
        self.attackRange = newRange
    }
    
    func setInteractRange(_ newRange: Double){
        self.interactRange = newRange
    }
    
    func setFacingDirection(_ newDir: Direction){
        self.facingDirection = newDir
    }
    
}
