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
    case HIDDEN = 5
    case RUNNING = 6
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
//    var isHidden: Bool = false
    var isInvicible: Bool = false
    var idle: Bool = true
    var isRolling: Bool = false
    var isAttacking: Bool = false
    var isInteracting: Bool = false
    var isEntering: Bool = false
    var isExiting: Bool = false
    var isHidden: Bool = false
    var isWalking: Bool = false
    var isRunning: Bool = false
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
    func updateActionState(scene: SKScene){
        if buttonBIsPressed && (self.actionState == .MOVE || self.actionState == .RUNNING) && myMovement != .zero {
            self.actionState = .ROLL
        }
        if buttonAIsPressed{
            print(status.isInteracting)
            if self.actionState == .MOVE && self.status.isExiting == false{
                if self.focus == .OBJECT && self.status.isInteracting == false{
//                    print("INTERACT AVVIATO")
                    self.actionState = .INTERACT
                }else if focus == .ENEMY && self.status.isAttacking == false{
                    self.actionState = .ATTACK
                }
            }else if self.actionState == .HIDDEN && self.status.isEntering == false && self.status.isExiting == false {
                if self.status.isExiting == false{
                    self.status.isExiting = true
                    //SOSTITUIRE DISPATCH CON ANIMAZIONE
                    //ENTRA PIU' VOLTE NELLO STATO HIDDEN E QUINDI NON RIAPPARE TODO: RISOLVERE LIMINTANDO L'INGRESSO ALLA FUNZIONE
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                        self.status.isExiting = false
                        self.setActionState(.MOVE)
                        self.status.isHidden = false
                        self.alpha = 1
                        scene.enumerateChildNodes(withName: "dynamicObject"){ object, _ in
                            if getDistanceBetween(point1: self.position, point2: object.position) <= self.getInteractRange(){
                                let interact = object as? InteractableObject
                                if interact?.getType() == .HIDEOUT {
                                    let interazione = interact as? Hideout
                                    switch interazione?.getHideoutCategory(){
                                    case .CLOSET:
                                        let armadio = interazione as? Closet
                                        armadio?.action()
                                    default :
                                        print ("")
                                    }
                                }
                            }
                            
                        }
                        
                    })
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
    
    
    func updateMovingDirection(){//FUNZIONA: Aggiorna una sola volta il moving direction e lo stato di running
        if myMovement.getMagnitude() > 0.5 && self.actionState == .MOVE && self.status.isEntering == false{
            self.actionState = .RUNNING
        }else if myMovement.getMagnitude() <= 0.5 && self.actionState == .RUNNING && self.status.isEntering == false{
            self.actionState = .MOVE
            self.xScale = 1
        }
        
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
        switch actionState {
            
//            WALKING ANIMATION E IDLE
            
        case .MOVE:
            status.isWalking = true
            switch movingDirection {
            case .UP:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .UP || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .UP
                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(backTexture))
                }
            case .UP_RIGHT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .UP_RIGHT || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .UP_RIGHT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(halfBackRTexture))
                }
            case .RIGHT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .RIGHT || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .RIGHT
                    self.run(.repeatForever(.animate(with: walkingAnimationRight, timePerFrame: 0.18)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(sideRTexture))                }
            case .DOWN_RIGHT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .DOWN_RIGHT || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .DOWN_RIGHT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(halfFrontRTexture))                }

            case .DOWN:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .DOWN || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .DOWN
                    self.run(.repeatForever(.animate(with: walkingAnimationFront, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(frontTexture))                }
            case .DOWN_LEFT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .DOWN_LEFT || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .DOWN_LEFT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(halfFrontLTexture))                }
            case .LEFT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .LEFT || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .LEFT
                    self.run(.repeatForever(.animate(with: walkingAnimationLeft, timePerFrame: 0.18)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(sideLTexture))
                }
            case .UP_LEFT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .UP_LEFT || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .UP_LEFT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(halfBackLTexture))
                    
                }
            }
            
//            ATTACK ANIMATION
            
        case .ATTACK:
            if self.status.isAttacking == false{
                self.status.isAttacking = true
                self.run(.animate(with: self.attackAnimationFront, timePerFrame: 0.18), completion: {
                    self.actionState = .MOVE
                    self.status.isAttacking = false
                    self.status.idle = false
                })
            }
            //ROLL ANIMATION
        case .ROLL:
            if status.isRolling == false{
                status.isRolling = true
                switch facingDirection {
                case .UP:
                    self.run(.animate(with: rollingAnimationBack, timePerFrame: 0.1), completion: {
                        if self.status.isRunning {
                            self.actionState = .RUNNING
                        }else{
                            self.actionState = .MOVE
                        }
                        self.status.isRolling = false
                    })
                case .UP_RIGHT:
                    print("UPRIGHT")
                case .RIGHT:
                    self.xScale = 2
                    self.run(.animate(with: rollingAnimationRight, timePerFrame: 0.1), completion: {
                        if self.status.isRunning {
                            self.actionState = .RUNNING
                        }else{
                            self.actionState = .MOVE
                            self.xScale = 1
                        }
                        self.status.isRolling = false
                    })
                case .DOWN_RIGHT:
                    print("")
                case .DOWN:
                    self.run(.animate(with: rollingAnimationFront, timePerFrame: 0.1), completion: {
                        if self.status.isRunning {
                            self.actionState = .RUNNING
                        }else{
                            self.actionState = .MOVE
                        }
                        self.status.isRolling = false
                    })
                case .DOWN_LEFT:
                    print("")
                case .LEFT:
                    self.xScale = 2
                    self.run(.animate(with: rollingAnimationLeft, timePerFrame: 0.1), completion: {
                        if self.status.isRunning {
                            self.actionState = .RUNNING
                        }else{
                            self.actionState = .MOVE
                            self.xScale = 1
                        }
                        self.status.isRolling = false
                    })
                case .UP_LEFT:
                    print("")
                }
            }
             //INTERACT ANIMATION
        case .INTERACT:
            switch movingDirection {
            case .UP:
                if(status.isInteracting == false) {
                    self.run(.animate(with: interactAnimationBack, timePerFrame: 0.15), completion: {
                        if self.status.isEntering == false{
                            self.actionState = .MOVE
                        }
                        self.status.isInteracting = false
                        self.status.idle = false
                    })
                }

            case .UP_RIGHT:
                print ("")
            case .RIGHT:
                if(status.isInteracting == false) {
                    self.run(.animate(with: interactAnimationRight, timePerFrame: 0.15), completion: {
                        if self.status.isEntering == false{
                            self.actionState = .MOVE
                        }
                        self.status.isInteracting = false
                        self.status.idle = false
                    })
                }
                
            case .DOWN_RIGHT:
                print ("")
            case .DOWN:
                if(status.isInteracting == false) {
                    self.run(.animate(with: interactAnimationFront, timePerFrame: 0.15), completion: {
                        if self.status.isEntering == false{
                            self.actionState = .MOVE
                        }
                        self.status.isInteracting = false
                        self.status.idle = false
                    })
                }
            case .DOWN_LEFT:
                print ("")
            case .LEFT:
                if(status.isInteracting == false) {
                    self.run(.animate(with: interactAnimationLeft, timePerFrame: 0.15), completion: {
                        if self.status.isEntering == false{
                            self.actionState = .MOVE
                        }
                        self.status.isInteracting = false
                        self.status.idle = false
                    })
                    
                }
                
                
            case .UP_LEFT:
                print ("")
            }
        case .HIDDEN:
            print("")
            
            
//            RUNNING ANIMATION

            
        case .RUNNING:
            status.isRunning = true
            switch movingDirection {
            case .UP:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .UP){
                    self.xScale = 1
                    self.status.isWalking = false
                    self.facingDirection = .UP
                    self.run(.repeatForever(.animate(with: runningAnimationBack, timePerFrame: 0.18)))
                }
            case .UP_RIGHT:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .UP_RIGHT){
                    self.status.isWalking = false
                    self.facingDirection = .UP_RIGHT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }
            case .RIGHT:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .RIGHT){
                    self.xScale = 2
                    self.status.isWalking = false
                    self.facingDirection = .RIGHT
                    self.run(.repeatForever(.animate(with: runningAnimationRight, timePerFrame: 0.125)))
                        
                }
            case .DOWN_RIGHT:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .DOWN_RIGHT){
                    self.status.isWalking = false
                    self.facingDirection = .DOWN_RIGHT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }

            case .DOWN:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .DOWN){
                    self.xScale = 1
                    self.status.isWalking = false
                    self.facingDirection = .DOWN
                    self.run(.repeatForever(.animate(with: runningAnimationFront, timePerFrame: 0.18)))
                        
                }
            case .DOWN_LEFT:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .DOWN_LEFT){
                    self.status.isWalking = false
                    self.facingDirection = .DOWN_LEFT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }
            case .LEFT:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .LEFT){
                    self.xScale = 2
                    self.status.isWalking = false
                    self.facingDirection = .LEFT
                    self.run(.repeatForever(.animate(with: runningAnimationLeft, timePerFrame: 0.125)))
                        
                }
            case .UP_LEFT:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .UP_LEFT){
                    self.status.isWalking = false
                    self.facingDirection = .UP_LEFT
//                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.25)))
                        
                }
            }
        }
    }
    
    
    
    
    
    func searchObject(scene: SKScene){
        scene.enumerateChildNodes(withName: "dynamicObject"){ object, _ in
            if getDistanceBetween(point1: self.position, point2: object.position) <= self.interactRange{
                let sprite = object as? InteractableObject
                if sprite?.getSpottedStatus() == false{
                    sprite?.setSpottedStatus(true)
                    sprite?.run(.setTexture(sprite?.highlightedTexture ?? SKTexture()))
                    sprite?.shapeHighlighted.strokeColor = .init(white: 1, alpha: 0.5)
                    sprite?.shapeHighlighted.glowWidth = 3
//                    sprite?.addChild(sprite?.shapeHighlighted ?? SKShapeNode())
                }
            }else{
                let sprite = object as? InteractableObject
                if sprite?.getSpottedStatus() != false{
                    sprite?.setSpottedStatus(false)
                    sprite?.run(.setTexture(sprite?.baseTexture ?? SKTexture()))
                    if sprite?.getType() == .USABLE{
                        let usable = object as? UsableObject
                        if usable?.getUsableCategory() == .CHEST{
                            let chest = usable as? Chest
                            if chest?.getOpenStatus() == true{
                                chest?.run(.setTexture(chest?.openTexture ?? SKTexture()))
                            }
                        }
                    }
//                    sprite?.shapeHighlighted.removeFromParent()
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
        self.status.isInteracting = newStatus
    }
    
    func setEnteringStatus(_ newStatus: Bool){
        self.status.isEntering = newStatus
    }
    
    func setExitiingStatus(_ newStatus: Bool){
        self.status.isExiting = newStatus
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


