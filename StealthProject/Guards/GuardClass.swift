//
//  GuardClass.swift
//  StealthProject
//
//  Created by Salvatore Manna on 04/05/22.
//

import Foundation
import GameplayKit
import SpriteKit

var currentScene = SKScene()

var arrayOfGuards: [Guard] = []
var guardNameIndex: Int = 0

let guardPhyscisBodyWidth = 45
let guardPhyscisBodyHeight = 85

struct GuardState{
    var isDead: Bool = false
    var isHit: Bool = false
    var isStunned: Bool = false
    var isAlerted: Bool = false
    var isSerching: Bool = false
    var playerDetected: Bool = false
}

enum GuardActionState: Int{
    case IDLE = 0
    case MOVE = 1
    case SHOOT = 2
    case LOCKED = 3
    case CHASING = 4
    case SEARCHING = 5
    case ROTATING = 6
    case RETURNING = 7
    case ROTATING_ACTION = 10
    case CHASING_PATHFIND = 11
    case SEARCHING_PATHFIND = 12
}

enum ActionType: Int{
    case PATH_ACTION = 0
    case ROTATE_ACTION = 1
    case WAIT_ACTION = 2
}

struct myAction{
    var actionType: ActionType
    var duration: Double
    var startingPoint: CGPoint
    var endingPoint: CGPoint
    var angle: Double
}

class Guard: SKSpriteNode{
    
    var playerInVisualCone: Bool = false
    
    private var strength: Int = 0
    private var guardSpeed: Int = 0
    
    private var status: GuardState = GuardState()
    private var actionState: GuardActionState = .IDLE
    private var actionStateBuffer: GuardActionState = .IDLE
    private var movingDirection: Direction = .UP
    private var movingDirectionBuffer: Direction = .UP
    var lastMoVingDirection: Direction = .NONE
    private var facingDirection: Direction = .UP
    
    var lastMovingDirectionBuffer: Direction = .NONE
    var lastActionState: GuardActionState = .IDLE
    
    private var visionConeRadius: Double = 200
    private var visionConeAngle: Double = 60
    
    private var arrayOfVisionPoints: [CGPoint] = []
    
    private var invisibleBall: SKShapeNode = SKShapeNode(rectOf: CGSize(width: 20, height: 20))
    private var initBall: Bool = false
    
    private var playerFound: Bool = false
    private var playerFoundTransitioning: Bool = false
    var rayCastingPlayerFound: Bool = false
    
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
    
    //    IDLE TXTURE
    var currentIdleDirectionTexture: SKTexture = SKTexture()
    
    //    STUNNED ANIMATION
    var stunnedAnimation: [SKTexture] = []
    
    // DIMENSIONI COLLIDER
    var selfColliderDimensionWidth: Double = 0
    var selfColliderDimnesionHeight: Double = 0
        
    var roomReference = SKNode()
    
    var floorMatrixCopy: Matrix = [[]]
    var floorMatrixForPathfinding: Matrix = [[]]
    
    var lastAnimation: SKAction = SKAction()
    var lastAnimationBool: Bool = false
    var setContinousSetDeadTexture: Bool = false
    var setContinousRecoveryTexture: Bool = false
    
    var setContinousDEADTexture: Bool = false
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, strength: Int, speed: Int, visionConeRadius: Double, visionConeAngle: Double) {
        super.init(texture: texture, color: color, size: size)
        self.name = "enemy"
        self.strength = strength
        self.guardSpeed = speed
        self.visionConeRadius = visionConeRadius
        self.visionConeAngle = visionConeAngle
        
        invisibleBall.strokeColor = .clear
        invisibleBall.fillColor = .clear
    }
    
    
    
//    GET FUNCTIONS
    func getStrenght()->Int{
        return self.strength
    }
    
    func getSpeed()->Int{
        return self.guardSpeed
    }
    
    func getArrayOfVisionPoints()->[CGPoint]{
        return self.arrayOfVisionPoints
    }
    
    func getVisionConeRadius()->Double{
        return self.visionConeRadius
    }
    
    func getVisionConeAngle()->Double{
        return self.visionConeAngle
    }
    
    func getPlayerFound()->Bool{
        return self.playerFound
    }
    
    func getPlayerFoundTransitioning()->Bool{
        return self.playerFoundTransitioning
    }
    
    func getCenterBall()->SKShapeNode{
        return self.invisibleBall
    }
    
    func getInitBall()->Bool{
        return self.initBall
    }
    
    func getGuardActionState()->GuardActionState{
        return self.actionState
    }
    
    func getStatus()->GuardState{
        return self.status
    }
    
    func getGuardMovingDirection()->Direction{
        return self.movingDirection
    }
    
    func getStunnedTime(player: PlayableCharacter)->TimeInterval{
        let difference = player.getStrenght() - self.strength
        if difference < 0{
            return 0
        }else{
            switch difference{
            case 0:
                return 3
            case 1:
                return 5
            case 2:
                return 7
            case 3, 4:
                return 8
            default:
                return 10
            }
        }
    }
    
//    SET FUNCTIONS
//    Are these usefull for guards??
    
    func setStenght(_ newStrength: Int){
        self.strength = newStrength
    }
    
    func setSpeed(_ newSpeed: Int){
        self.guardSpeed = newSpeed
    }
    
    func appendToArrayOfPoints(point: CGPoint){
        arrayOfVisionPoints.append(point)
    }
    
    func resetArrayOfPoints(){
        arrayOfVisionPoints.removeAll()
    }
    
    func setVisionConeRadius(_ newVisionConeRadius: Double){
        self.visionConeRadius = newVisionConeRadius
    }
    
    func setVisionConeAngle(_ newAngleRadius: Double){
        self.visionConeAngle = newAngleRadius
    }
    
    func setPlayerFoundTrue(){
        self.playerFound = true
    }
    
    func setPlayerFoundFalse(){
        self.playerFound = false
    }
 
    func setPlayerFoundTransitioningTrue(){
        self.playerFoundTransitioning = true
    }
    
    func setPlayerFoundTransitioningFalse(){
        self.playerFoundTransitioning = false
    }
    
    func centerBall(){
        self.invisibleBall.position = self.position
    }
    
    func setInitBall() {
        self.initBall = true
    }
    
    func setGuardActionState(actionState: GuardActionState){
        self.actionState = actionState
    }
    
    func setStunned(_ bool: Bool){
        self.status.isStunned = bool
    }
    
    func setHit(_ bool: Bool){
        self.status.isHit = bool
    }
    
    func setDead(_ bool: Bool){
        self.status.isDead = bool
    }
    
    func setGuardActionStateBuffer(actionStateBuffer: GuardActionState){
        self.actionStateBuffer = actionStateBuffer
    }
    
    func setGuardMovementDirection(movementDirection: Direction){
        self.movingDirection = movementDirection
    }
    
    func checkAngleInPath(){
        var spriteAngle = self.invisibleBall.zRotation
        if spriteAngle < -pi {
            spriteAngle += 2*pi
        } else if spriteAngle > pi {
            spriteAngle -= 2*pi
        }
                
        
        if Double(spriteAngle) < pi/8 && Double(spriteAngle) > -pi/8{
            if self.facingDirection != .UP{
                movingDirectionBuffer = .NONE
                self.facingDirection = .UP
                self.currentIdleDirectionTexture = self.backTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }else if Double(spriteAngle) >= pi/8 && Double(spriteAngle) <= 3*pi/8{
            if self.facingDirection != .UP_LEFT{
                movingDirectionBuffer = .NONE
                self.facingDirection = .UP_LEFT
                self.currentIdleDirectionTexture = self.halfBackLTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }else if Double(spriteAngle) > 3*pi/8 && Double(spriteAngle) < 5*pi/8{
            if self.facingDirection != .LEFT{
                movingDirectionBuffer = .NONE
                self.facingDirection = .LEFT
                self.currentIdleDirectionTexture = self.sideLTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }else if Double(spriteAngle) >= 5*pi/8 && Double(spriteAngle) <= 7*pi/8{
            if self.facingDirection != .DOWN_LEFT{
                movingDirectionBuffer = .NONE
                self.facingDirection = .DOWN_LEFT
                self.currentIdleDirectionTexture = self.halfFrontLTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }else if (Double(spriteAngle) > 7*pi/8 && Double(spriteAngle) <= pi) || (Double(spriteAngle) < -7*pi/8 && Double(spriteAngle) >= -pi){
            if self.facingDirection != .DOWN{
                movingDirectionBuffer = .NONE
                self.facingDirection = .DOWN
                self.currentIdleDirectionTexture = self.frontTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }else if Double(spriteAngle) >= -7*pi/8 && Double(spriteAngle) <= -5*pi/8{
            if self.facingDirection != .DOWN_RIGHT{
                movingDirectionBuffer = .NONE
                self.facingDirection = .DOWN_RIGHT
                self.currentIdleDirectionTexture = self.halfFrontRTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }else if Double(spriteAngle) > -5*pi/8 && Double(spriteAngle) < -3*pi/8{
            if self.facingDirection != .RIGHT{
                movingDirectionBuffer = .NONE
                self.facingDirection = .RIGHT
                self.currentIdleDirectionTexture = self.sideRTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }else if Double(spriteAngle) >= -3*pi/8 && Double(spriteAngle) <= -pi/8{
            if self.facingDirection != .UP_RIGHT{
                movingDirectionBuffer = .NONE
                self.facingDirection = .UP_RIGHT
                self.currentIdleDirectionTexture = self.halfBackRTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }
    }
    
    
    func checkAngle(){
        var spriteAngle = self.invisibleBall.zRotation
        
        if Double(spriteAngle) < pi/8 && Double(spriteAngle) > -pi/8{
            if self.facingDirection != .UP{
                self.facingDirection = .UP
                self.currentIdleDirectionTexture = self.backTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }else if Double(spriteAngle) >= pi/8 && Double(spriteAngle) <= 3*pi/8{
            if self.facingDirection != .UP_LEFT{
                self.facingDirection = .UP_LEFT
                self.currentIdleDirectionTexture = self.halfBackLTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }else if Double(spriteAngle) > 3*pi/8 && Double(spriteAngle) < 5*pi/8{
            if self.facingDirection != .LEFT{
                self.facingDirection = .LEFT
                self.currentIdleDirectionTexture = self.sideLTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }else if Double(spriteAngle) >= 5*pi/8 && Double(spriteAngle) <= 7*pi/8{
            if self.facingDirection != .DOWN_LEFT{
                self.facingDirection = .DOWN_LEFT
                self.currentIdleDirectionTexture = self.halfFrontLTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }else if (Double(spriteAngle) > 7*pi/8 && Double(spriteAngle) <= pi) || (Double(spriteAngle) < -7*pi/8 && Double(spriteAngle) >= -pi){
            if self.facingDirection != .DOWN{
                self.facingDirection = .DOWN
                self.currentIdleDirectionTexture = self.frontTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }else if Double(spriteAngle) >= -7*pi/8 && Double(spriteAngle) <= -5*pi/8{
            if self.facingDirection != .DOWN_RIGHT{
                self.facingDirection = .DOWN_RIGHT
                self.currentIdleDirectionTexture = self.halfFrontRTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }else if Double(spriteAngle) > -5*pi/8 && Double(spriteAngle) < -3*pi/8{
            if self.facingDirection != .RIGHT{
                self.facingDirection = .RIGHT
                self.currentIdleDirectionTexture = self.sideRTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }else if Double(spriteAngle) >= -3*pi/8 && Double(spriteAngle) <= -pi/8{
            if self.facingDirection != .UP_RIGHT{
                self.facingDirection = .UP_RIGHT
                self.currentIdleDirectionTexture = self.halfBackRTexture
                self.run(.setTexture(currentIdleDirectionTexture))
            }
        }
    }
    
    func checkRotationReset(){
        if -360 == Int(180 * self.invisibleBall.zRotation / 3.14){
//            print("Resetting")
            self.invisibleBall.zRotation = 0
        }
        
        if 360 == Int(180 * self.invisibleBall.zRotation / 3.14){
//            print("Resetting")
            self.invisibleBall.zRotation = 0
        }
    }
    
    
    func checkState(point: CGPoint, deltaTime: TimeInterval, scene: SKScene){
        
//        print(self.actionStateBuffer)
        if(status.isDead == true){
            self.removeAction(forKey: "guardMovement")
            self.invisibleBall.removeAction(forKey: "guardPath")
            
            if(!setContinousDEADTexture){
                setContinousDEADTexture = true
                self.physicsBody = SKPhysicsBody()
                self.physicsBody?.restitution = 0
                self.physicsBody?.affectedByGravity = false
                self.physicsBody?.isDynamic = false
                self.run(.sequence([.animate(with: stunnedAnimation, timePerFrame: 0.15),
                                    .setTexture(stunnedAnimation[2])
                ]))
            }
        } else if (status.isDead == false){
            if status.isHit == false{
                if(actionStateBuffer == GuardActionState.IDLE || actionStateBuffer == GuardActionState.MOVE || actionStateBuffer == GuardActionState.ROTATING_ACTION){
                    checkRotationReset()
                    checkAngleInPath()
                }
                
                
                if(self.actionStateBuffer == GuardActionState.IDLE || self.actionStateBuffer == GuardActionState.ROTATING_ACTION){
                    self.removeAction(forKey: "guardMovement")
                    self.run(.setTexture(self.currentIdleDirectionTexture))
                    if(actionStateBuffer != actionState){
                        actionState = actionStateBuffer
                    }
                }
                
                if(self.actionStateBuffer == GuardActionState.MOVE){
                    if(self.movingDirectionBuffer != self.facingDirection){
                        self.removeAction(forKey: "guardMovement")
                        switch facingDirection {
                        case .UP:
                            self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.125)), withKey: "guardMovement")
                        case .UP_RIGHT:
                            return
                        case .RIGHT:
                            self.run(.repeatForever(.animate(with: walkingAnimationRight, timePerFrame: 0.125)), withKey: "guardMovement")
                        case .DOWN_RIGHT:
                            return
                        case .DOWN:
                            self.run(.repeatForever(.animate(with: walkingAnimationFront, timePerFrame: 0.125)), withKey: "guardMovement")
                        case .DOWN_LEFT:
                            return
                        case .LEFT:
                            self.run(.repeatForever(.animate(with: walkingAnimationLeft, timePerFrame: 0.125)), withKey: "guardMovement")
                        case .UP_LEFT:
                            return
                        case .NONE:
                            return
                        }
                        self.movingDirectionBuffer = self.facingDirection
                        self.actionState = self.actionStateBuffer
                    }
                    
                }
                
            }else{
                if(setContinousSetDeadTexture){
                    self.run(.setTexture(stunnedAnimation[stunnedAnimation.count-1]))
                } else if(setContinousRecoveryTexture){
                    self.run(.setTexture(frontTexture))
                }
                
                if status.isStunned == false{
                    
                    self.physicsBody = SKPhysicsBody()
                    self.physicsBody?.restitution = 0
                    self.physicsBody?.affectedByGravity = false
                    self.physicsBody?.isDynamic = false
                    
                    lastAnimationBool = false
                    status.isStunned = true
                    if let action = self.invisibleBall.action(forKey: "guardPath"){
                        action.speed = 0
                    }
                    if let action = self.action(forKey: "guardMovement"){
                        lastAnimation = action
                        lastAnimationBool = true
                        self.removeAction(forKey: "guardMovement")
                    } else {
                        lastAnimationBool = false
                    }
                    self.run(.sequence([.animate(with: stunnedAnimation, timePerFrame: 0.15),
                                        .setTexture(stunnedAnimation[2]),
                                        .wait(forDuration: self.getStunnedTime(player: (scene as? PlayableScene)?.player ?? PlayableCharacter())),
                                        .animate(with: stunnedAnimation.reversed(), timePerFrame: 0.15),
                                        .setTexture(self.frontTexture),
                                        .wait(forDuration: 0.5),
                                        .run {
                                            if let action = self.invisibleBall.action(forKey: "guardPath"){
                                                action.speed = 1
                                            }
                                            if (self.lastAnimationBool) {
                                                self.run(.repeatForever(self.lastAnimation), withKey: "guardMovement")
                                                if let action = self.action(forKey: "guardMovement"){
                                                }
                                                self.lastAnimationBool = false
                                            }
                                            self.setStunned(false)
                                            self.setHit(false)
                                            
                                            self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.selfColliderDimensionWidth, height: self.selfColliderDimnesionHeight))
                                            self.physicsBody?.isDynamic = false
                                            self.physicsBody?.restitution = 0
                                            self.physicsBody?.affectedByGravity = false
                                            self.physicsBody?.categoryBitMask = ColliderType.ENEMY.rawValue
                                            self.physicsBody?.contactTestBitMask = ColliderType.PLAYER.rawValue
                                        }

                    ]))
                }
            }
        }
        
        
        
        
    }
    
}



//TO DO: Sostituire blockDimension con "blocco"
//Funzione globale per generare i percorsi per le guardie, assegnarli e iniziarli
func createPath(entity: Guard, arrayOfActions: [myAction]){
    var sequenceArray: [SKAction] = []
    
    
    for action in arrayOfActions{
        switch action.actionType{
        case .PATH_ACTION:
            
            let currentRoom = entity.parent!
                        
            var space: Double = 0
            
            let path = CGMutablePath()
            
            print("Punto iniziale: \(action.startingPoint) + Punto finale: \(action.endingPoint)")
            
            path.move(to: CGPoint(x: 0, y: 0))
            if(action.startingPoint.x != action.endingPoint.x){
                space = (action.endingPoint.x - action.startingPoint.x)*CGFloat(blocco)
                
                path.addLine(to: CGPoint(x: (action.endingPoint.x - action.startingPoint.x)*CGFloat(blocco), y: 0))
                if(action.endingPoint.x - action.startingPoint.x > 0){
//                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
//                        node, _ in
//
//                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
//                    })
                    let updateStateActionToMoveAndDirection = SKAction.run {
                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
                        
                    }
                    
                    sequenceArray.append(updateStateActionToMoveAndDirection)
                } else {
//                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
//                        node, _ in
//
//                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
//                    })
                    let updateStateActionToMoveAndDirection = SKAction.run {
                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
                        
                    }
                    
                    sequenceArray.append(updateStateActionToMoveAndDirection)
                }
            } else {
                space = (action.startingPoint.y - action.endingPoint.y)*CGFloat(blocco)
                
                path.addLine(to: CGPoint(x: 0, y: (action.startingPoint.y - action.endingPoint.y)*CGFloat(blocco)))
                if(action.endingPoint.y - action.startingPoint.y > 0){
//                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
//                        node, _ in
//
//                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
//                    })
                    let updateStateActionToMoveAndDirection = SKAction.run {
                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
                        
                    }
                    
                    sequenceArray.append(updateStateActionToMoveAndDirection)
                } else {
//                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
//                        node, _ in
//
//                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
//                    })
                    let updateStateActionToMoveAndDirection = SKAction.run {
                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
                        
                    }
                    
                    sequenceArray.append(updateStateActionToMoveAndDirection)
                }
            }

            let followLine = SKAction.follow(path, asOffset: true, orientToPath: false, duration: abs(space)/Double(entity.getSpeed()))

            sequenceArray.append(followLine)
            
        case .ROTATE_ACTION:
            let updateStateActionToIdle = SKAction.customAction(withDuration: 0.01, actionBlock: {
                node, _ in
                
                entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.ROTATING_ACTION)
                
            })
            
            sequenceArray.append(updateStateActionToIdle)
            
            let rotateAction = SKAction.rotate(byAngle: 3.14 * action.angle / 180, duration: action.duration)

            sequenceArray.append(rotateAction)
            
        case .WAIT_ACTION:
            let updateStateActionToIdle = SKAction.customAction(withDuration: 0.01, actionBlock: {
                node, _ in
                
                entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.IDLE)
                
            })
            
            sequenceArray.append(updateStateActionToIdle)
            
            let waitAction = SKAction.wait(forDuration: action.duration)
            
            sequenceArray.append(waitAction)
        default:
            return
        }
    }
    entity.getCenterBall().run(.repeatForever(SKAction.sequence(sequenceArray)), withKey: "guardPath")
}



