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

enum Focus: Int{
    case OBJECT = 0
    case ENEMY = 1
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
    
    private var interactRange: Double = 50
    private var attackRange: Double = 25
    private var objectHighlighted: Bool = false
    
    private var focus: Focus = .OBJECT
    
    //    STATIC TEXTURES
    var frontTexture: SKTexture = SKTexture()
    var sideLTexture: SKTexture = SKTexture()
    var sideRTexture: SKTexture = SKTexture()
    var backTexture: SKTexture = SKTexture()
    var halfFrontLTexture: SKTexture = SKTexture()
    var halfFrontRTexture: SKTexture = SKTexture()
    var halfBackLTexture: SKTexture = SKTexture()
    var halfBackRTexture: SKTexture = SKTexture()
    
//    IDLE ANIMATION ARRAYS
    var idleAnimationFront: [SKTexture] = []
    var idleAnimationFrontLeft: [SKTexture] = []
    var idleAnimationFrontRight: [SKTexture] = []
    var idleAnimationLeft: [SKTexture] = []
    var idleAnimationRight: [SKTexture] = []
    var idleAnimationBack: [SKTexture] = []
    var idleAnimationBackRight: [SKTexture] = []
    var idleAnimationBackLeft: [SKTexture] = []
    
    
//    WALKING ANIMATION ARRAYS
    var walkingAnimationFront: [SKTexture] = []
    var walkingAnimationFrontRight: [SKTexture] = []
    var walkingAnimationFrontLeft: [SKTexture] = []
    var walkingAnimationLeft: [SKTexture] = []
    var walkingAnimationRight: [SKTexture] = []
    var walkingAnimationBack: [SKTexture] = []
    var walkingAnimationBackRight: [SKTexture] = []
    var walkingAnimationBackLeft: [SKTexture] = []
    
//    RUNNING ANIMATION ARRAYS
    var runningAnimationFront: [SKTexture] = []
    var runningAnimationFrontRight: [SKTexture] = []
    var runningAnimationFrontLeft: [SKTexture] = []
    var runningAnimationRight: [SKTexture] = []
    var runningAnimationLeft: [SKTexture] = []
    var runningAnimationBack: [SKTexture] = []
    var runningAnimationBackRight: [SKTexture] = []
    var runningAnimationBackLeft: [SKTexture] = []
    
//    ROLLING ANIMATION ARRAYS
    var rollingAnimationFront: [SKTexture] = []
    var rollingAnimationFrontLeft: [SKTexture] = []
    var rollingAnimationFrontRight: [SKTexture] = []
    var rollingAnimationRight: [SKTexture] = []
    var rollingAnimationLeft: [SKTexture] = []
    var rollingAnimationBack: [SKTexture] = []
    var rollingAnimationBackRight: [SKTexture] = []
    var rollingAnimationBackLeft: [SKTexture] = []
    
//    SHOOTING ANIMATION ARRAYS
    var shootingAnimationFront: [SKTexture] = []
    var shootingAnimationFrontRight: [SKTexture] = []
    var shootingAnimationFrontLeft: [SKTexture] = []
    var shootingAnimationRight: [SKTexture] = []
    var shootingAnimationLeft: [SKTexture] = []
    var shootingAnimationBack: [SKTexture] = []
    var shootingAnimationBackLeft: [SKTexture] = []
    var shootingAnimationBackRight: [SKTexture] = []
    
//    ATTACK ANIMATION ARRAYS
    var attackAnimationFront: [SKTexture] = []
    var attackAnimationFrontLeft: [SKTexture] = []
    var attackAnimationFrontRight: [SKTexture] = []
    var attackAnimationRight: [SKTexture] = []
    var attackAnimationLeft: [SKTexture] = []
    var attackAnimationBack: [SKTexture] = []
    var attackAnimationBackLeft: [SKTexture] = []
    var attackAnimationBackRight: [SKTexture] = []
    
//    INTERACT ANIMATION ARRAYS
    var interactAnimationFront: [SKTexture] = []
    var interactAnimationFrontLeft: [SKTexture] = []
    var interactAnimationFrontRight: [SKTexture] = []
    var interactAnimationRight: [SKTexture] = []
    var interactAnimationLeft: [SKTexture] = []
    var interactAnimationBack: [SKTexture] = []
    var interactAnimationBackLeft: [SKTexture] = []
    var interactAnimationBackRight: [SKTexture] = []
    
//    HIDE ANIMATION ARRAYS
    var hideAnimationFront: [SKTexture] = []
    var hideAnimationFrontLeft: [SKTexture] = []
    var hideAnimationFrontRight: [SKTexture] = []
    var hideAnimationRight: [SKTexture] = []
    var hideAnimationLeft: [SKTexture] = []
    var hideAnimationBack: [SKTexture] = []
    var hideAnimationBackRight: [SKTexture] = []
    var hideAnimationBackLeft: [SKTexture] = []
    
//    INITIALIZER
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
    
//    GENERIC FUNCTIONS
    func updateActionState(){
        if buttonBIsPressed && self.actionState != .ROLL{
            self.actionState = .ROLL
        } else if buttonBIsPressed == false && self.actionState == .ROLL{
            self.actionState = .MOVE
        }
        if buttonAIsPressed{
            if self.focus == .OBJECT && self.actionState != .INTERACT{
                self.actionState = .INTERACT
            }else if focus == .ENEMY && self.actionState != .ATTACK{
                self.actionState = .ATTACK
            }
        } else if buttonAIsPressed == false{
            if actionState == .ATTACK || actionState == .INTERACT{
                self.actionState = .MOVE
            }
        }
    }
    
    func updateFocus(scene: SKScene){
        var first: Bool = true
        var distanceEnemy: Double = .infinity
        var distanceObject: Double = .infinity
        scene.enumerateChildNodes(withName: "enemy"){ element, _ in
            let distance = getDistanceBetween(point1: self.position, point2: element.position)
            if first{
                distanceEnemy = distance
                first = false
            }
            if distanceEnemy > distance{
                distanceEnemy = distance
            }
        }
        scene.enumerateChildNodes(withName: "interactable"){ element, _ in
            let distance = getDistanceBetween(point1: self.position, point2: element.position)
            if distanceObject >= distance{
                distanceObject = distance
            }
        }
        
        print(distanceEnemy)
        print(distanceObject)
        
        if distanceEnemy > distanceObject{
            if self.focus != .OBJECT{
                self.focus = .OBJECT
            }
        }else{
            if self.focus != .ENEMY{
                self.focus = .ENEMY
            }
        }
    }
    
    func updateMovingDirection(){    //FUNZIONA: Aggiorna una sola volta il moving direction
        if myMovement != .zero{
//            if Double(myAngle) >= pi/4 && Double(myAngle) <= 3*pi/4{
//                if self.movingDirection != .RIGHT{
//                    self.movingDirection = .RIGHT
//                }
//            }else if Double(myAngle) > 3*pi/4 && Double(myAngle) <= pi || Double(myAngle) < -3*pi/4 && Double(myAngle) > -pi{
//                if self.movingDirection != .DOWN{
//                    self.movingDirection = .DOWN
//                }
//            }else if Double(myAngle) <= -pi/4 && Double(myAngle) >= -3*pi/4{
//                if self.movingDirection != .LEFT{
//                    self.movingDirection = .LEFT
//                }
//            }else if Double(myAngle) > -pi/4 && Double(myAngle) < pi/4{
//                if self.movingDirection != .UP{
//                    self.movingDirection = .UP
//                }
//            }
            if Double(myAngle) < pi/8 && Double(myAngle) > -pi/8{
                if self.movingDirection != .UP{
                    self.movingDirection = .UP
                }
            }else if Double(myAngle) >= pi/8 && Double(myAngle) <= 3*pi/8{
                if self.movingDirection != .UP_RIGHT{
                    self.movingDirection = .UP_RIGHT
                }
            }else if Double(myAngle) > 3*pi/8 && Double(myAngle) < 5*pi/8{
                if self.movingDirection != .RIGHT{
                    self.movingDirection = .RIGHT
                }
            }else if Double(myAngle) >= 5*pi/8 && Double(myAngle) <= 7*pi/8{
                if self.movingDirection != .DOWN_RIGHT{
                    self.movingDirection = .DOWN_RIGHT
                }
            }else if (Double(myAngle) > 7*pi/8 && Double(myAngle) <= pi) || (Double(myAngle) < -7*pi/8 && Double(myAngle) >= -pi){
                if self.movingDirection != .DOWN{
                    self.movingDirection = .DOWN
                }
            }else if Double(myAngle) >= -7*pi/8 && Double(myAngle) <= -5*pi/8{
                if self.movingDirection != .DOWN_LEFT{
                    self.movingDirection = .DOWN_LEFT
                }
            }else if Double(myAngle) > -5*pi/8 && Double(myAngle) < -3*pi/8{
                if self.movingDirection != .LEFT{
                    self.movingDirection = .LEFT
                }
            }else if Double(myAngle) >= -3*pi/8 && Double(myAngle) <= -pi/8{
                if self.movingDirection != .UP_LEFT{
                    self.movingDirection = .UP_LEFT
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
                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.idle == false{
                    self.removeAllActions()
                    self.idle = true
                    self.run(.setTexture(backTexture))
                }
            case .UP_RIGHT:
                if myMovement != .zero && (self.idle == true || self.facingDirection != .UP_RIGHT){
                    self.idle = false
                    self.facingDirection = .UP_RIGHT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.idle == false{
                    self.removeAllActions()
                    self.idle = true
                    self.run(.setTexture(halfBackRTexture))
                }
            case .RIGHT:
                if myMovement != .zero && (self.idle == true || self.facingDirection != .RIGHT){
                    self.idle = false
                    self.facingDirection = .RIGHT
                    self.run(.repeatForever(.animate(with: walkingAnimationRight, timePerFrame: 0.18)))
                        
                }else if myMovement == .zero && self.idle == false{
                    self.removeAllActions()
                    self.idle = true
                    self.run(.setTexture(sideRTexture))                }
            case .DOWN_RIGHT:
                if myMovement != .zero && (self.idle == true || self.facingDirection != .DOWN_RIGHT){
                    self.idle = false
                    self.facingDirection = .DOWN_RIGHT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.idle == false{
                    self.removeAllActions()
                    self.idle = true
                    self.run(.setTexture(halfFrontRTexture))                }

            case .DOWN:
                if myMovement != .zero && (self.idle == true || self.facingDirection != .DOWN){
                    self.idle = false
                    self.facingDirection = .DOWN
                    self.run(.repeatForever(.animate(with: walkingAnimationFront, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.idle == false{
                    self.removeAllActions()
                    self.idle = true
                    self.run(.setTexture(frontTexture))                }
            case .DOWN_LEFT:
                if myMovement != .zero && (self.idle == true || self.facingDirection != .DOWN_LEFT){
                    self.idle = false
                    self.facingDirection = .DOWN_LEFT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.idle == false{
                    self.removeAllActions()
                    self.idle = true
                    self.run(.setTexture(halfFrontLTexture))                }
            case .LEFT:
                if myMovement != .zero && (self.idle == true || self.facingDirection != .LEFT){
                    self.idle = false
                    self.facingDirection = .LEFT
                    self.run(.repeatForever(.animate(with: walkingAnimationLeft, timePerFrame: 0.18)))
                        
                }else if myMovement == .zero && self.idle == false{
                    self.removeAllActions()
                    self.idle = true
                    self.run(.setTexture(sideLTexture))
                }
            case .UP_LEFT:
                if myMovement != .zero && (self.idle == true || self.facingDirection != .UP_LEFT){
                    self.idle = false
                    self.facingDirection = .UP_LEFT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.idle == false{
                    self.removeAllActions()
                    self.idle = true
                    self.run(.setTexture(halfBackLTexture))
                    
                }
            }
        }
    }
    
    func searchObject(scene: SKScene){
        scene.enumerateChildNodes(withName: "interactable"){ object, _ in
            if getDistanceBetween(point1: self.position, point2: object.position) <= self.interactRange{
                if self.objectHighlighted != true{
                    self.objectHighlighted = true
                    object.run(.colorize(with: .green, colorBlendFactor: 0.2, duration: 0.1))
                }
            }else{
                if self.objectHighlighted != false{
                    self.objectHighlighted = false
                    object.run(.colorize(withColorBlendFactor: 0, duration: 0.1))
                }
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
    
    func getFocusState()->Focus{
        return self.focus
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


