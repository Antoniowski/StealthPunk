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
    var idle: Bool = true
    var isRolling: Bool = false
    var isAttacking: Bool = false
    var isInteractiong: Bool = false
}
class PlayableCharacter: SKSpriteNode{

    //STATS
    private var noise: Int = 0
    private var strenght: Int = 0
    private var characterSpeed: Int = 0
    private var noiseDistance: Double = 0
    private var interactRange: Double = 50
    private var attackRange: Double = 25
    
    
    private var status: CharacterState = CharacterState()
    private var actionState: ActionState = .MOVE
    private var movingDirection: Direction = .DOWN
    private var facingDirection: Direction = .DOWN
    
//    private var objectHighlighted: Bool = false
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
        if buttonBIsPressed && self.actionState == .MOVE && myMovement != .zero {
            self.actionState = .ROLL
        }
        if buttonAIsPressed{
            if self.actionState == .MOVE && self.getStatus().isInteractiong == false{
                if self.focus == .OBJECT && self.actionState != .INTERACT{
//                    print("INTERACT AVVIATO")
                    self.actionState = .INTERACT
                }else if focus == .ENEMY && self.actionState != .ATTACK{
                    self.actionState = .ATTACK
                }
            }
        }
        
    }
     //TODO: DA AGGIUSTARE CON ELEMENTI DI UNA SOLA STANZA
    
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
        scene.enumerateChildNodes(withName: "dynamicObject"){ element, _ in
            let distance = getDistanceBetween(point1: self.position, point2: element.position)
            if distanceObject >= distance{
                distanceObject = distance
            }
        }
        
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
    
    func animationTree(){
        updateMovingDirection()
        if actionState == .MOVE{
            switch movingDirection {
            case .UP:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .UP){
                    self.status.idle = false
                    self.facingDirection = .UP
                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(backTexture))
                }
            case .UP_RIGHT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .UP_RIGHT){
                    self.status.idle = false
                    self.facingDirection = .UP_RIGHT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(halfBackRTexture))
                }
            case .RIGHT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .RIGHT){
                    self.status.idle = false
                    self.facingDirection = .RIGHT
                    self.run(.repeatForever(.animate(with: walkingAnimationRight, timePerFrame: 0.18)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(sideRTexture))                }
            case .DOWN_RIGHT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .DOWN_RIGHT){
                    self.status.idle = false
                    self.facingDirection = .DOWN_RIGHT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(halfFrontRTexture))                }

            case .DOWN:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .DOWN){
                    self.status.idle = false
                    self.facingDirection = .DOWN
                    self.run(.repeatForever(.animate(with: walkingAnimationFront, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(frontTexture))                }
            case .DOWN_LEFT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .DOWN_LEFT){
                    self.status.idle = false
                    self.facingDirection = .DOWN_LEFT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(halfFrontLTexture))                }
            case .LEFT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .LEFT){
                    self.status.idle = false
                    self.facingDirection = .LEFT
                    self.run(.repeatForever(.animate(with: walkingAnimationLeft, timePerFrame: 0.18)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(sideLTexture))
                }
            case .UP_LEFT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .UP_LEFT){
                    self.status.idle = false
                    self.facingDirection = .UP_LEFT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(halfBackLTexture))
                    
                }
            }
        }else if actionState == .ROLL{
            if status.isRolling == false{
                status.isRolling = true
                switch facingDirection {
                case .UP:
                    self.run(.animate(with: rollingAnimationBack, timePerFrame: 0.1), completion: {
                        self.actionState = .MOVE
                        self.status.isRolling = false
                    })
                case .UP_RIGHT:
                    print("UPRIGHT")
                case .RIGHT:
                    self.xScale = 2
                    self.run(.animate(with: rollingAnimationRight, timePerFrame: 0.1), completion: {
                        self.actionState = .MOVE
                        self.xScale = 1
                        self.status.isRolling = false
                    })
                case .DOWN_RIGHT:
                    print("")
                case .DOWN:
                    print("")
                case .DOWN_LEFT:
                    print("")
                case .LEFT:
                    self.xScale = 2
                    self.run(.animate(with: rollingAnimationLeft, timePerFrame: 0.1), completion: {
                        self.actionState = .MOVE
                        self.xScale = 1
                        self.status.isRolling = false
                    })
                case .UP_LEFT:
                    print("")
                }
            }
        }else if actionState == .ATTACK{
            if self.status.isAttacking == false{
                self.status.isAttacking = true
                self.run(.animate(with: self.attackAnimationFront, timePerFrame: 0.18), completion: {
                    self.actionState = .MOVE
                    self.status.isAttacking = false
                    self.status.idle = false
                })
            }
        }
    }
    
    func searchObject(scene: SKScene){
        scene.enumerateChildNodes(withName: "dynamicObject"){ object, _ in
            if getDistanceBetween(point1: self.position, point2: object.position) <= self.interactRange{
                let sprite = object as? InteractableObject
                if sprite?.getSpottedStatus() == false{
                    sprite?.setSpottedStatus(true)
//                    object.run(.colorize(with: .green, colorBlendFactor: 0.2, duration: 0.1))
                    sprite?.run(.setTexture(sprite?.highlightedTexture ?? SKTexture()))
                    sprite?.shapeHighlighted.strokeColor = .init(white: 1, alpha: 0.5)
                    sprite?.shapeHighlighted.glowWidth = 3
                    sprite?.addChild(sprite?.shapeHighlighted ?? SKShapeNode())
                }
            }else{
                let sprite = object as? InteractableObject
                if sprite?.getSpottedStatus() != false{
                    sprite?.setSpottedStatus(false)
//                    object.run(.colorize(withColorBlendFactor: 0, duration: 0.1))
                    sprite?.run(.setTexture(sprite?.baseTexture ?? SKTexture()))
                    sprite?.shapeHighlighted.removeFromParent()
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
        return self.noiseDistance
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
    
    func setInteractingStatus(_ newStatus: Bool){
        self.status.isInteractiong = newStatus
    }
    
    func setActionState(_ newActionState: ActionState){
        self.actionState = newActionState
    }
    
    func setNoiseDistance(_ newDistance: Double){
        self.noiseDistance = newDistance
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


