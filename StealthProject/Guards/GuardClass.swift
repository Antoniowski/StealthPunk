//
//  GuardClass.swift
//  StealthProject
//
//  Created by Antonio Romano on 04/05/22.
//

import Foundation
import SpriteKit

struct GuardState{
    var isDead: Bool = false
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
}

enum ActionType: Int{
    case PATH_ACTION = 0
    case ROTATE_ACTION = 1
    case WAIT_ACTION = 2
    case IDLE_STATE_ACTION = 3
    case MOVE_STATE_ACTION = 4
}

struct myAction{
    var actionType: ActionType
    var duration: Double
    var startingPoint: CGPoint
    var endingPoint: CGPoint
    var angle: Double
}

class Guard: SKSpriteNode{
    
    private var strength: Int = 0
    private var guardSpeed: Int = 0
    
    private var status: GuardState = GuardState()
    private var actionState: GuardActionState = .IDLE
    private var actionStateBuffer: GuardActionState = .IDLE
    private var movingDirection: Direction = .UP
    private var movingDirectionBuffer: Direction = .UP
    private var facingDirection: Direction = .UP
    
    private var currentIdleDirectionTexture: SKTexture = SKTexture(imageNamed: "ConoGrandeBackF1")
    
    private var visionConeRadius: Double = 200
    private var visionConeAngle: Double = 60
    
    private var arrayOfVisionPoints: [CGPoint] = []
    
    private var invisibleBall: SKShapeNode = SKShapeNode(rectOf: CGSize(width: 1, height: 1))
    private var initBall: Bool = false
    
    private var playerFound: Bool = false
    
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
    
    func getCenterBall()->SKShapeNode{
        return self.invisibleBall
    }
    
    func getInitBall()->Bool{
        return self.initBall
    }
    
    func getGuardActionState()->GuardActionState{
        return self.actionState
    }
    
    func getGuardMovingDirection()->Direction{
        return self.movingDirection
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
    
    func setPlayerFoundFlase(){
        self.playerFound = false
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
    
    func setGuardActionStateBuffer(actionStateBuffer: GuardActionState){
        self.actionStateBuffer = actionStateBuffer
    }
    
    func setGuardMovementDirection(movementDirection: Direction){
        self.movingDirection = movementDirection
    }
    
    
    
    func checkState(){
        
        if(self.actionStateBuffer == GuardActionState.IDLE){            
            self.removeAction(forKey: "guardMovement")
            self.run(.setTexture(self.currentIdleDirectionTexture))
            
            if(actionStateBuffer != GuardActionState.IDLE){
                
                actionState = actionStateBuffer
            }
        }
        
        
        if -360 == Int(180 * self.invisibleBall.zRotation / 3.14){
            print("Resetting")
            self.invisibleBall.zRotation = 0
        }
        
        if 360 == Int(180 * self.invisibleBall.zRotation / 3.14){
            print("Resetting")
            self.invisibleBall.zRotation = 0
        }

    
        
        var spriteAngle = self.invisibleBall.zRotation
        if spriteAngle < -pi {
            spriteAngle += 2*pi
        } else if spriteAngle > pi {
            spriteAngle -= 2*pi
        }
        
        
        if Double(spriteAngle) < pi/8 && Double(spriteAngle) > -pi/8{
            if self.facingDirection != .UP{
                self.facingDirection = .UP
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrandeBackF1")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrandeBackF1")))
            }
        }else if Double(spriteAngle) >= pi/8 && Double(spriteAngle) <= 3*pi/8{
            if self.facingDirection != .UP_LEFT{
                self.facingDirection = .UP_LEFT
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrande3:4BackMirrorF1")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrande3:4BackMirrorF1")))
            }
        }else if Double(spriteAngle) > 3*pi/8 && Double(spriteAngle) < 5*pi/8{
            if self.facingDirection != .LEFT{
                self.facingDirection = .LEFT
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrandeSideF2")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrandeSideF2")))
            }
        }else if Double(spriteAngle) >= 5*pi/8 && Double(spriteAngle) <= 7*pi/8{
            if self.facingDirection != .DOWN_LEFT{
                self.facingDirection = .DOWN_LEFT
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrande3:4FrontF1")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrande3:4FrontF1")))
            }
        }else if (Double(spriteAngle) > 7*pi/8 && Double(spriteAngle) <= pi) || (Double(spriteAngle) < -7*pi/8 && Double(spriteAngle) >= -pi){
            if self.facingDirection != .DOWN{
                self.facingDirection = .DOWN
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrandeFrontF2")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrandeFrontF2")))
            }
        }else if Double(spriteAngle) >= -7*pi/8 && Double(spriteAngle) <= -5*pi/8{
            if self.facingDirection != .DOWN_RIGHT{
                self.facingDirection = .DOWN_RIGHT
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrande3:4FrontMirrorF1")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrande3:4FrontMirrorF1")))
            }
        }else if Double(spriteAngle) > -5*pi/8 && Double(spriteAngle) < -3*pi/8{
            if self.facingDirection != .RIGHT{
                self.facingDirection = .RIGHT
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrandeSideMirrorF2")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrandeSideMirrorF2")))
            }
        }else if Double(spriteAngle) >= -3*pi/8 && Double(spriteAngle) <= -pi/8{
            if self.facingDirection != .UP_RIGHT{
                self.facingDirection = .UP_RIGHT
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrande3:4BackF1")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrande3:4BackF1")))
            }
        }

        if(self.actionStateBuffer == GuardActionState.MOVE){
            if(self.movingDirectionBuffer != self.movingDirection){
                self.removeAction(forKey: "guardMovement")
                switch movingDirection {
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
                }
                self.movingDirectionBuffer = self.movingDirection
                self.actionState = self.actionStateBuffer
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
            
            var space: Double = 0
            
            let path = CGMutablePath()
            path.move(to: CGPoint(x: 0, y: 0))
            if(action.startingPoint.x != action.endingPoint.x){
                space = (action.endingPoint.x - action.startingPoint.x)*CGFloat(blockDimension)
                
                path.addLine(to: CGPoint(x: (action.endingPoint.x - action.startingPoint.x)*CGFloat(blockDimension), y: 0))
                if(action.endingPoint.x - action.startingPoint.x > 0){
                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
                        node, _ in
                        
                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
                        entity.setGuardMovementDirection(movementDirection: Direction.RIGHT)
                    })
                    
                    sequenceArray.append(updateStateActionToMoveAndDirection)
                } else {
                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
                        node, _ in
                        
                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
                        entity.setGuardMovementDirection(movementDirection: Direction.LEFT)
                    })
                    
                    sequenceArray.append(updateStateActionToMoveAndDirection)
                }
            } else {
                space = (action.endingPoint.y - action.startingPoint.y)*CGFloat(blockDimension)
                
                path.addLine(to: CGPoint(x: 0, y: (action.endingPoint.y - action.startingPoint.y)*CGFloat(blockDimension)))
                if(action.endingPoint.y - action.startingPoint.y > 0){
                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
                        node, _ in
                        
                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
                        entity.setGuardMovementDirection(movementDirection: Direction.UP)
                    })
                    
                    sequenceArray.append(updateStateActionToMoveAndDirection)
                } else {
                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
                        node, _ in
                        
                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
                        entity.setGuardMovementDirection(movementDirection: Direction.DOWN)
                    })
                    
                    sequenceArray.append(updateStateActionToMoveAndDirection)
                }
            }

            let followLine = SKAction.follow(path, asOffset: true, orientToPath: false, duration: abs(space)/Double(entity.getSpeed()))

            sequenceArray.append(followLine)
            
        case .ROTATE_ACTION:
            let updateStateActionToIdle = SKAction.customAction(withDuration: 0.01, actionBlock: {
                node, _ in
                
                entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.IDLE)
                
            })
            
            sequenceArray.append(updateStateActionToIdle)
            
            let rotateAction = SKAction.rotate(toAngle: 3.14 * action.angle / 180, duration: action.duration)

            sequenceArray.append(rotateAction)
            
        case .WAIT_ACTION:
            let updateStateActionToIdle = SKAction.customAction(withDuration: 0.01, actionBlock: {
                node, _ in
                
                entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.IDLE)
                
            })
            
            sequenceArray.append(updateStateActionToIdle)
            
            let waitAction = SKAction.wait(forDuration: action.duration)
            
            sequenceArray.append(waitAction)
        case .IDLE_STATE_ACTION:
            print("Updating the idle action buffer")
            //Caso probabilmente da togliere in seguito
            
        case .MOVE_STATE_ACTION:
            print("Updating the moving action and direction buffer")
            //Caso probabilmente da togliere in seguito
            
        default:
            return
        }
    }
    
    entity.getCenterBall().run(.repeatForever(SKAction.sequence(sequenceArray)), withKey: "guardPath")
}


