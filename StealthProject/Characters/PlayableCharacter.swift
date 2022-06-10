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
    var nearBush: Bool = false
}
class PlayableCharacter: SKSpriteNode{

    //STATS
    private var noise: Int = 0
    private var strenght: Int = 0
    private var characterSpeed: Int = 0
    private var noiseDistance: Double = 0
    private var interactRange: Double = 60
    private var attackRange: Double = 60
    
    
    private var status: CharacterState = CharacterState()
    private var actionState: ActionState = .MOVE
    private var movingDirection: Direction = .DOWN
    private var facingDirection: Direction = .DOWN
    
//    private var objectHighlighted: Bool = false
    private var focus: Focus = .OBJECT
    
    private var lucciola: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "lucciolaSxFrame1"), size: .init(width: 50, height: 50))
    var animazioneLucciola: [SKTexture] = []
    private var animazioneLucciolaDx: [SKTexture] = [SKTexture(imageNamed: "lucciolaDxFrame1"), SKTexture(imageNamed: "lucciolaDxFrame2")]
    private var animazioneLucciolaSx: [SKTexture] = [SKTexture(imageNamed: "lucciolaSxFrame1"), SKTexture(imageNamed: "lucciolaSxFrame2")]
    private var light: SKLightNode = SKLightNode()
    
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
        self.light.categoryBitMask = 2
        self.light.falloff = 2
        self.light.lightColor = .init(red: 239/255, green: 192/255, blue: 112/255, alpha: 0.75)
        self.lucciola.position.x += 25
        self.lucciola.position.y += 15
        self.lucciola.run(.repeatForever(.sequence([.moveBy(x: 0, y: 10, duration: 1), .moveBy(x: 0, y: -10, duration: 1)])))
        self.animazioneLucciola = animazioneLucciolaSx
        self.lucciola.run(.repeatForever(.animate(with: animazioneLucciola, timePerFrame: 0.1)))
        self.light.position.y += 15
        lucciola.addChild(light)
        addChild(lucciola)
        self.lightingBitMask = 2
    }
    
//    GENERIC FUNCTIONS
    func updateActionState(scene: SKScene, oggetti: [SKNode]){
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
                        self.physicsBody = SKPhysicsBody(rectangleOf: .init(width: 15, height: 60))
                        self.physicsBody?.isDynamic = true
                        self.physicsBody?.affectedByGravity = false
                        self.physicsBody?.allowsRotation = false
                        self.physicsBody?.categoryBitMask = ColliderType.PLAYER.rawValue
                        self.physicsBody?.collisionBitMask = ColliderType.COLLECTIBLE.rawValue
                        self.physicsBody?.contactTestBitMask = ColliderType.COLLECTIBLE.rawValue
                        self.physicsBody?.collisionBitMask = ColliderType.DOOR.rawValue
                        self.physicsBody?.contactTestBitMask = ColliderType.DOOR.rawValue
                        self.physicsBody?.collisionBitMask = ColliderType.CHAR.rawValue
                        self.physicsBody?.contactTestBitMask = ColliderType.CHAR.rawValue
                        
//                        scene.enumerateChildNodes(withName: "ROOM/dynamicObject"){ object, _ in
                        for object in oggetti{
                            if getDistanceBetween(point1: self.position, point2: scene.convert(object.position, from: object.parent ?? SKNode())) <= self.getInteractRange(){
                                let interact = object as? InteractableObject
                                if interact?.getType() == .HIDEOUT {
                                    let interazione = interact as? Hideout
                                    switch interazione?.getHideoutCategory(){
                                    case .CLOSET:
                                        let armadio = interazione as? Closet
                                        armadio?.action()
                                    case .PANCA:
                                        let panca = interazione as? Cassapanca
                                        panca?.action()
                                    case .VETRINA:
                                        let vetrina = interazione as? Vetrina
                                        vetrina?.action()
                                    case .BUSH:
                                        let bush = interazione as? Bush
                                        bush?.action()
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
    
    func updateFocus(scene: SKScene, enemies: [SKNode], oggetti: [SKNode]){
        var first: Bool = true
        var distanceEnemy: Double = .infinity
        var distanceObject: Double = .infinity
//        scene.enumerateChildNodes(withName: "enemy"){ element, _ in
        for element in enemies{
            let distance = getDistanceBetween(point1: self.position, point2: scene.convert(element.position, from: element.parent!))
            if first{
                distanceEnemy = distance
                first = false
            }
            if distanceEnemy > distance{
                distanceEnemy = distance
            }
        }
//        scene.enumerateChildNodes(withName: "ROOM/dynamicObject"){ element, _ in
        for element in oggetti{
            let distance = getDistanceBetween(point1: self.position, point2: scene.convert(element.position, from: element.parent ?? SKNode()))
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
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))

                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(backTexture))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))

                }
            case .UP_RIGHT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .UP_RIGHT || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .UP_RIGHT
                    self.run(.repeatForever(.animate(with: walkingAnimationBackRight, timePerFrame: 0.25)))
                    self.lucciola.run(.repeatForever(.animate(with: animazioneLucciolaDx, timePerFrame: 0.1)))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))

                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(halfBackRTexture))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))

                }
            case .RIGHT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .RIGHT || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .RIGHT
                    self.run(.repeatForever(.animate(with: walkingAnimationRight, timePerFrame: 0.18)))
                    self.lucciola.run(.repeatForever(.animate(with: animazioneLucciolaDx, timePerFrame: 0.1)))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))

                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(sideRTexture))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))

                }
            case .DOWN_RIGHT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .DOWN_RIGHT || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .DOWN_RIGHT
                    self.run(.repeatForever(.animate(with: walkingAnimationFrontRight, timePerFrame: 0.25)))
                    self.lucciola.run(.repeatForever(.animate(with: animazioneLucciolaDx, timePerFrame: 0.1)))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))

                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(halfFrontRTexture))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))

                }

            case .DOWN:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .DOWN || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .DOWN
                    self.run(.repeatForever(.animate(with: walkingAnimationFront, timePerFrame: 0.25)))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))
                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(frontTexture))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))

                    
                }
            case .DOWN_LEFT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .DOWN_LEFT || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .DOWN_LEFT
                    self.run(.repeatForever(.animate(with: walkingAnimationFrontLeft, timePerFrame: 0.25)))
                    self.lucciola.run(.repeatForever(.animate(with: animazioneLucciolaSx, timePerFrame: 0.1)))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))

                        
                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(halfFrontLTexture))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))

                }
            case .LEFT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .LEFT || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .LEFT
                    self.run(.repeatForever(.animate(with: walkingAnimationLeft, timePerFrame: 0.18)))
                    self.lucciola.run(.repeatForever(.animate(with: animazioneLucciolaSx, timePerFrame: 0.1)))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))

                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(sideLTexture))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))

                }
            case .UP_LEFT:
                if myMovement != .zero && (self.status.idle == true || self.facingDirection != .UP_LEFT || self.status.isRunning == true){
                    self.status.isRunning = false
                    self.status.idle = false
                    self.facingDirection = .UP_LEFT
                    self.run(.repeatForever(.animate(with: walkingAnimationBackLeft, timePerFrame: 0.25)))
                    self.lucciola.run(.repeatForever(.animate(with: animazioneLucciolaSx, timePerFrame: 0.1)))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))

                }else if myMovement == .zero && self.status.idle == false{
                    self.removeAllActions()
                    self.status.idle = true
                    self.run(.setTexture(halfBackLTexture))
                    self.lucciola.xScale = 1
                    self.lucciola.run(.moveTo(y: 15, duration: 1))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))
                    
                }
            case .NONE:
                return
            }
            
//            ATTACK ANIMATION
            
        case .ATTACK:
            switch facingDirection {
            case .UP:
                if self.status.isAttacking == false{
                    self.status.isAttacking = true
                    self.run(.sequence([.wait(forDuration: 0.3), .run {
                        music.starsSound(filenamed: music.whoosh)
                    }]))
//                    self.xScale = 2
                    self.run(.animate(with: self.attackAnimationBack, timePerFrame: 0.1), completion: {
//                        self.xScale = 1
                        self.actionState = .MOVE
                        self.status.isAttacking = false
                        self.status.idle = false
                    })
                }
            case .UP_RIGHT:
                if self.status.isAttacking == false{
                    self.status.isAttacking = true
                    self.run(.sequence([.wait(forDuration: 0.3), .run {
                        music.starsSound(filenamed: music.whoosh)
                    }]))
//                    self.xScale = 2
                    self.run(.animate(with: self.attackAnimationBack, timePerFrame: 0.1), completion: {
//                        self.xScale = 1
                        self.actionState = .MOVE
                        self.status.isAttacking = false
                        self.status.idle = false
                    })
                }
            case .RIGHT:
                if self.status.isAttacking == false{
                    self.status.isAttacking = true
                    self.run(.sequence([.wait(forDuration: 0.3), .run {
                        music.starsSound(filenamed: music.whoosh)
                    }]))
                    self.xScale = 2
                    self.lucciola.xScale = 0.5
                    self.run(.animate(with: self.attackAnimationRight, timePerFrame: 0.1), completion: {
                        self.xScale = 1
                        self.lucciola.xScale = 1
                        self.actionState = .MOVE
                        self.status.isAttacking = false
                        self.status.idle = false
                    })
                }
            case .DOWN_RIGHT:
                if self.status.isAttacking == false{
                    self.status.isAttacking = true
                    self.run(.sequence([.wait(forDuration: 0.3), .run {
                        music.starsSound(filenamed: music.whoosh)
                    }]))
//                    self.xScale = 2
                    self.run(.animate(with: self.attackAnimationFront, timePerFrame: 0.1), completion: {
//                        self.xScale = 1
                        self.actionState = .MOVE
                        self.status.isAttacking = false
                        self.status.idle = false
                    })
                }
            case .DOWN:
                if self.status.isAttacking == false{
                    self.status.isAttacking = true
                    self.run(.sequence([.wait(forDuration: 0.3), .run {
                        music.starsSound(filenamed: music.whoosh)
                    }]))
//                    self.xScale = 2
                    self.run(.animate(with: self.attackAnimationFront, timePerFrame: 0.1), completion: {
//                        self.xScale = 1
                        self.actionState = .MOVE
                        self.status.isAttacking = false
                        self.status.idle = false
                    })
                }
            case .DOWN_LEFT:
                if self.status.isAttacking == false{
                    self.status.isAttacking = true
                    self.run(.sequence([.wait(forDuration: 0.3), .run {
                        music.starsSound(filenamed: music.whoosh)
                    }]))
//                    self.xScale = 2
                    self.run(.animate(with: self.attackAnimationFront, timePerFrame: 0.1), completion: {
//                        self.xScale = 1
                        self.actionState = .MOVE
                        self.status.isAttacking = false
                        self.status.idle = false
                    })
                }
            case .LEFT:
                if self.status.isAttacking == false{
                    self.status.isAttacking = true
                    self.run(.sequence([.wait(forDuration: 0.3), .run {
                        music.starsSound(filenamed: music.whoosh)
                    }]))
                    self.xScale = 2
                    self.lucciola.xScale = 0.5
                    self.run(.animate(with: self.attackAnimationLeft, timePerFrame: 0.1), completion: {
                        self.xScale = 1
                        self.lucciola.xScale = 1
                        self.actionState = .MOVE
                        self.status.isAttacking = false
                        self.status.idle = false
                    })
                }
            case .UP_LEFT:
                if self.status.isAttacking == false{
                    self.status.isAttacking = true
                    self.run(.sequence([.wait(forDuration: 0.3), .run {
                        music.starsSound(filenamed: music.whoosh)
                    }]))
//                    self.xScale = 2
                    self.run(.animate(with: self.attackAnimationBack, timePerFrame: 0.1), completion: {
//                        self.xScale = 1
                        self.actionState = .MOVE
                        self.status.isAttacking = false
                        self.status.idle = false
                    })
                }
            case .NONE:
                return
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
                    self.xScale = 1
                    self.lucciola.xScale = 1
                    self.run(.animate(with: rollingAnimationBack, timePerFrame: 0.1), completion: {
                        if self.status.isRunning {
                            self.actionState = .RUNNING
                            self.xScale = 2
                            self.lucciola.xScale = 0.5
                        }else{
                            self.actionState = .MOVE
                        }
                        self.status.isRolling = false
                    })
                case .RIGHT:
                    self.xScale = 2
                    self.lucciola.xScale = 0.5
                    self.run(.animate(with: rollingAnimationRight, timePerFrame: 0.1), completion: {
                        if self.status.isRunning {
                            self.actionState = .RUNNING
                        }else{
                            self.actionState = .MOVE
                            self.xScale = 1
                            self.lucciola.xScale = 1
                        }
                        self.status.isRolling = false
                    })
                case .DOWN_RIGHT:
                    self.xScale = 1
                    self.lucciola.xScale = 1
                    self.run(.animate(with: rollingAnimationFront, timePerFrame: 0.1), completion: {
                        if self.status.isRunning {
                            self.actionState = .RUNNING
                            self.xScale = 2
                            self.lucciola.xScale = 0.5
                        }else{
                            self.actionState = .MOVE
                        }
                        self.status.isRolling = false
                    })
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
                    self.xScale = 1
                    self.lucciola.xScale = 1
                    self.run(.animate(with: rollingAnimationFront, timePerFrame: 0.1), completion: {
                        if self.status.isRunning {
                            self.actionState = .RUNNING
                            self.xScale = 2
                            self.lucciola.xScale = 0.5
                        }else{
                            self.actionState = .MOVE
                        }
                        self.status.isRolling = false
                    })
                case .LEFT:
                    self.xScale = 2
                    self.lucciola.xScale = 0.5
                    self.run(.animate(with: rollingAnimationLeft, timePerFrame: 0.1), completion: {
                        if self.status.isRunning {
                            self.actionState = .RUNNING
                        }else{
                            self.actionState = .MOVE
                            self.xScale = 1
                            self.lucciola.xScale = 1
                        }
                        self.status.isRolling = false
                    })
                case .UP_LEFT:
                    self.xScale = 1
                    self.lucciola.xScale = 1
                    self.run(.animate(with: rollingAnimationBack, timePerFrame: 0.1), completion: {
                        if self.status.isRunning {
                            self.actionState = .RUNNING
                            self.xScale = 2
                            self.lucciola.xScale = 0.5
                        }else{
                            self.actionState = .MOVE
                        }
                        self.status.isRolling = false
                    })
                case .NONE:
                    return
                }
            }
             //INTERACT ANIMATION
        case .INTERACT:
            switch movingDirection {
            case .UP:
                if(status.isInteracting == false) {
                    if status.nearBush == true {
                        self.run (.animate(with: [SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack3")], timePerFrame: 0.2),completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                            
                        })
                            
                    }
                    else{
                        self.run(.animate(with: interactAnimationBack, timePerFrame: 0.15), completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                        })

                    }
                                    
                }

            case .UP_RIGHT:
                if(status.isInteracting == false) {
                    if status.nearBush == true {
                        self.run (.animate(with: [SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack3")], timePerFrame: 0.2),completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                            
                        })
                            
                    }
                    else{
                        self.run(.animate(with: interactAnimationBack, timePerFrame: 0.15), completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                        })

                    }
                                    
                }
            case .RIGHT:
                if(status.isInteracting == false) {
                    if status.nearBush == true {
                        self.run (.animate(with: [SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack3")], timePerFrame: 0.2),completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                            
                        })
                            
                    }
                    else{
                        self.run(.animate(with: interactAnimationRight, timePerFrame: 0.15), completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                        })

                    }
                                    
                }
                
            case .DOWN_RIGHT:
                if(status.isInteracting == false) {
                    if status.nearBush == true {
                        self.run (.animate(with: [SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack3")], timePerFrame: 0.2),completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                            
                        })
                            
                    }
                    else{
                        self.run(.animate(with: interactAnimationFront, timePerFrame: 0.15), completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                        })

                    }
                                    
                }
            case .DOWN:
                if(status.isInteracting == false) {
                    if status.nearBush == true {
                        self.run (.animate(with: [SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack3")], timePerFrame: 0.2),completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                            
                        })
                            
                    }
                    else{
                        self.run(.animate(with: interactAnimationFront, timePerFrame: 0.15), completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                        })

                    }
                                    
                }
            case .DOWN_LEFT:
                if(status.isInteracting == false) {
                    if status.nearBush == true {
                        self.run (.animate(with: [SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack3")], timePerFrame: 0.2),completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                            
                        })
                            
                    }
                    else{
                        self.run(.animate(with: interactAnimationFront, timePerFrame: 0.15), completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                        })

                    }
                                    
                }
            case .LEFT:
                if(status.isInteracting == false) {
                    if status.nearBush == true {
                        self.run (.animate(with: [SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack3")], timePerFrame: 0.2),completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                            
                        })
                            
                    }
                    else{
                        self.run(.animate(with: interactAnimationLeft, timePerFrame: 0.15), completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                        })

                    }
                                    
                }
                
                
            case .UP_LEFT:
                if(status.isInteracting == false) {
                    if status.nearBush == true {
                        self.run (.animate(with: [SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack2"),SKTexture(imageNamed: "boyRollBack3")], timePerFrame: 0.2),completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                            
                        })
                            
                    }
                    else{
                        self.run(.animate(with: interactAnimationBack, timePerFrame: 0.15), completion: {
                            if self.status.isEntering == false{
                                self.actionState = .MOVE
                            }
                            self.status.isInteracting = false
                            self.status.idle = false
                        })

                    }
                                    
                }
            case .NONE:
                return
            }
            
        case .HIDDEN:
            break
            
            
//            RUNNING ANIMATION

            
        case .RUNNING:
            status.isRunning = true
            switch movingDirection {
            case .UP:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .UP){
                    self.xScale = 1
                    self.lucciola.xScale = 1
                    self.status.isWalking = false
                    self.facingDirection = .UP
                    self.run(.repeatForever(.animate(with: runningAnimationBack, timePerFrame: 0.18)))
                    self.lucciola.run(.moveTo(y: -45, duration: 1))
                }
            case .UP_RIGHT:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .UP_RIGHT){
                    self.xScale = 2
                    self.lucciola.xScale = 0.5
                    self.status.isWalking = false
                    self.facingDirection = .UP_RIGHT
                    self.run(.repeatForever(.animate(with: runningAnimationBackRight, timePerFrame: 0.18)))
                    self.lucciola.run(.repeatForever(.animate(with: animazioneLucciolaDx, timePerFrame: 0.1)))
                    self.lucciola.run(.moveTo(y: -45, duration: 1))
                }
            case .RIGHT:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .RIGHT){
                    self.xScale = 2
                    self.lucciola.xScale = 0.5
                    self.status.isWalking = false
                    self.facingDirection = .RIGHT
                    self.run(.repeatForever(.animate(with: runningAnimationRight, timePerFrame: 0.125)))
                    self.lucciola.run(.repeatForever(.animate(with: animazioneLucciolaDx, timePerFrame: 0.1)))
                    self.lucciola.run(.moveTo(x: -25, duration: 1))
                    self.lucciola.run(.moveTo(y: 15, duration: 1))

                        
                }
            case .DOWN_RIGHT:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .DOWN_RIGHT){
                    self.xScale = 2
                    self.lucciola.xScale = 0.5
                    self.status.isWalking = false
                    self.facingDirection = .DOWN_RIGHT
                    self.run(.repeatForever(.animate(with: runningAnimationFrontRight, timePerFrame: 0.18)))
                    self.lucciola.run(.repeatForever(.animate(with: animazioneLucciolaDx, timePerFrame: 0.1)))
                    self.lucciola.run(.moveTo(y: 45, duration: 1))

                }

            case .DOWN:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .DOWN){
                    self.xScale = 1
                    self.lucciola.xScale = 1
                    self.status.isWalking = false
                    self.facingDirection = .DOWN
                    self.run(.repeatForever(.animate(with: runningAnimationFront, timePerFrame: 0.18)))
                    self.lucciola.run(.moveTo(y: 45, duration: 1))
                        
                }
            case .DOWN_LEFT:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .DOWN_LEFT){
                    self.xScale = 2
                    self.lucciola.xScale = 0.5
                    self.status.isWalking = false
                    self.facingDirection = .DOWN_LEFT
                    self.run(.repeatForever(.animate(with: runningAnimationFrontLeft, timePerFrame: 0.18)))
                    self.lucciola.run(.repeatForever(.animate(with: animazioneLucciolaSx, timePerFrame: 0.1)))
                    self.lucciola.run(.moveTo(y: 45, duration: 1))

                }
            case .LEFT:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .LEFT){
                    self.xScale = 2
                    self.lucciola.xScale = 0.5
                    self.status.isWalking = false
                    self.facingDirection = .LEFT
                    self.run(.repeatForever(.animate(with: runningAnimationLeft, timePerFrame: 0.125)))
                    self.lucciola.run(.repeatForever(.animate(with: animazioneLucciolaSx, timePerFrame: 0.1)))
                    self.lucciola.run(.moveTo(x: 25, duration: 1))
                    self.lucciola.run(.moveTo(y: 15, duration: 1))

                        
                }
            case .UP_LEFT:
                if myMovement != .zero && (self.status.isWalking == true || self.facingDirection != .UP_LEFT){
                    self.xScale = 2
                    self.lucciola.xScale = 0.5
                    self.status.isWalking = false
                    self.facingDirection = .UP_LEFT
                    self.run(.repeatForever(.animate(with: runningAnimationBackLeft, timePerFrame: 0.18)))
                    self.lucciola.run(.repeatForever(.animate(with: animazioneLucciolaSx, timePerFrame: 0.1)))
                    self.lucciola.run(.moveTo(y: -45, duration: 1))

                }
            case .NONE:
                return
            }
        }
    }
    
    
    
    
    
    func searchObject(scene: SKScene, oggetti: [SKNode]){
//        scene.enumerateChildNodes(withName: "ROOM/dynamicObject"){ object, _ in
        for object in oggetti{
            if getDistanceBetween(point1: self.position, point2: scene.convert(object.position, from: object.parent ?? SKNode())) <= self.interactRange{
                    let sprite = object as? InteractableObject
                    if sprite?.getType() == .HIDEOUT {
                        let x = sprite as? Hideout
                        if x?.getHideoutCategory() == .BUSH {
                            self.status.nearBush = true
                        }
                    }
                    if sprite?.getSpottedStatus() == false{
                        sprite?.setSpottedStatus(true)
                        let bordo = SKSpriteNode(texture: sprite?.highlightedTexture ?? SKTexture(), size: sprite?.size ?? .zero)
                        bordo.position = scene.convert(sprite!.position, from: sprite!.parent!)
                        bordo.zPosition = 6
                        bordo.name = "bordo"
                        if sprite?.getType() == .USABLE {
                            let x = sprite as? UsableObject
                            if x?.getUsableCategory() == .TAVERNA_DOOR {
                                bordo.normalTexture = SKTexture(imageNamed: "porta aperta normal map")
                                bordo.zPosition = 3
                                bordo.lightingBitMask = 1 | 2
                            }
                        }
                        scene.addChild(bordo)
//                        sprite?.run(.setTexture(sprite?.highlightedTexture ?? SKTexture()))
                        //                    sprite?.shapeHighlighted.strokeColor = .init(white: 1, alpha: 0.5)
                        //                    sprite?.shapeHighlighted.glowWidth = 3
                        //                    sprite?.addChild(sprite?.shapeHighlighted ?? SKShapeNode())
                    }
                }else{
                    let sprite = object as? InteractableObject
                    if sprite?.getSpottedStatus() != false{
                        sprite?.setSpottedStatus(false)
                        self.status.nearBush = false
//                        sprite?.run(.setTexture(sprite?.baseTexture ?? SKTexture()))
                        scene.childNode(withName: "bordo")?.removeFromParent()
                        if sprite?.getType() == .USABLE{
                            let usable = object as? UsableObject
                            if usable?.getUsableCategory() == .CHEST{
                                let chest = usable as? Chest
                                if chest?.getOpenStatus() == true{
                                    chest?.run(.setTexture(chest?.openTexture ?? SKTexture()))
                                }
                            }
                            if usable?.getUsableCategory() == .SWITCH{
                                let lswitch = usable as? LightSwitch
                                if lswitch?.getOnOffStatus() == true{
                                    lswitch?.run(.setTexture(lswitch?.ONTexture ?? SKTexture()))
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


