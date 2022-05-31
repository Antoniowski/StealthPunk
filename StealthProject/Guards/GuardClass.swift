//
//  GuardClass.swift
//  StealthProject
//
//  Created by Antonio Romano on 04/05/22.
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
    
    
    var pathToChasing: Bool = false
    var chasingToSearching: Bool = false
    var searchingToRotating: Bool = false
    var rotatingToRotating: Bool = false
    var rotatingToReturn: Bool = false
    
    var readyToReturn: Bool = false
    
    var rotating: Bool = false
    
    var lastMovingDirectionBuffer: Direction = .NONE
    var lastActionState: GuardActionState = .IDLE
    var lastAngle: CGFloat = 0
    var lastPosition: CGPoint = CGPoint(x: 0, y: 0)
    
    
    var returning: Bool = false
    var chasing: Bool = false
    var searching: Bool = false
    var rotateToSearch: Bool = false
    
    var lastAngleSeen: Float = 0
    
    var reachedLocation: Bool = false
    
    var transitionToSeen:Bool = true
    var transitionToUnseen: Bool = false
    var transitionToSearch: Bool = false
    
    var lastPlayerPosition: CGPoint = CGPoint(x: 0, y: 0)
    
    var correctingTrajectory: Bool = false
    var angleCorrection: Float = 0
    var playerPositionForDistance: CGPoint = CGPoint(x: 0, y: 0)
    var startingPosition: CGPoint = CGPoint(x: 0, y: 0)
    
    private var currentIdleDirectionTexture: SKTexture = SKTexture(imageNamed: "ConoGrandeBackF1")
    
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
    
    
    
    
    var searched: Bool = false
    
    
    var firstIteration: Bool = false
    var angleForPathfinding: CGFloat = 0
    
    var startingPosition1: CGPoint = CGPoint(x: 0, y: 0)
    var startingPosition2: CGPoint = CGPoint(x: 0, y: 0)
    
    var obstructedPath: Bool = false
    var targetPosition = CGPoint(x: 0, y: 0)
    
    var roomReference = SKNode()
    
    var floorMatrixCopy: Matrix = [[]]
    var floorMatrixForPathfinding: Matrix = [[]]
    
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
    }
    
    func rayCastingForObstacles(scene: SKScene, point: CGPoint){
        
        if(actionState == .CHASING){
            
            for i in 1...15{
                var sprite = scene.physicsWorld.body(alongRayStart: invisibleBall.position, end: CGPoint(x: point.x + cos(CGFloat((i*2))*3.14/180), y: point.y))
            if (sprite?.node?.name != "player"){
               ostacolo = true
            }
                while(ostacolo){
                print(atan2(point.x - invisibleBall.position.x , point.y - invisibleBall.position.y))
                    
                if(atan2(point.x - invisibleBall.position.x , point.y - invisibleBall.position.y) >= (0) && atan2(point.x - invisibleBall.position.x , point.y - invisibleBall.position.y) <= (-3.14/4)){
                    
                    invisibleBall.position.x += 20
                    invisibleBall.position.y += 40
                    
                    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                    ostacolo = false
                }
                
                if(atan2(point.x - invisibleBall.position.x , point.y - invisibleBall.position.y) >= (0) && atan2(point.x - invisibleBall.position.x , point.y - invisibleBall.position.y) <= (-3.14/4)){
                
                    invisibleBall.position.x -= 20
                    invisibleBall.position.y += 40
                    
                    print("bbbbbbbbbbbbbbbbbbbbbbbbnbbnbnbbbnbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb")
                    ostacolo = false
                }
                
                if(atan2(point.x - invisibleBall.position.x , point.y - invisibleBall.position.y) >= (-3.14/3) && atan2(point.x - invisibleBall.position.x , point.y - invisibleBall.position.y) <= (-3.14/2)){
                    
                    invisibleBall.position.x += 20
                    invisibleBall.position.y -= 40
                    
                    print("cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc")
                    ostacolo = false
                }
                
                if(atan2(point.x - invisibleBall.position.x , point.y - invisibleBall.position.y) >= (-3.14/2) && atan2(point.x - invisibleBall.position.x , point.y - invisibleBall.position.y) <= (-3.14*2/3)){
                    
                    invisibleBall.position.x += 20
                    invisibleBall.position.y += 40
                    
                    print("dddddddddddddddddddddddddddddddddddddddddddddddddddddddddeddfddfddddddddddddcddddddd")
                    ostacolo = false
                }
                
                if(atan2(point.x - invisibleBall.position.x , point.y - invisibleBall.position.y) >= (3.14/3) && atan2(point.x - invisibleBall.position.x , point.y - invisibleBall.position.y) <= (3.14/2)){
                    
                    invisibleBall.position.x += 20
                    invisibleBall.position.y -= 40
                    
                    print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
                    ostacolo = false
                }
                
                if(atan2(point.x - invisibleBall.position.x , point.y - invisibleBall.position.y) >= (3.14/2) && atan2(point.x - invisibleBall.position.x , point.y - invisibleBall.position.y) <= (2*3.14/2)){
                    
                    invisibleBall.position.x += 20
                    invisibleBall.position.y += 40
                    
                    print("fffffffrfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff")
                    ostacolo = false
                }
                }
        }
        
        }
    }
//
////        let rayCasted = scene.physicsWorld.body(alongRayStart: invisibleBall.position ,end: CGPoint(x: point.x, y: point.y))
////
////        if(rayCasted?.node?.name == "staticObject" || rayCasted?.node?.name == "dynamicObject"){
////
////            let distanza = getDistanceBetween(point1: invisibleBall.position, point2: point)
////            let teta = acos(Double(point.x)) / acos(Double(distanza))
////
////            print(teta)
////
////        }
//
//        switch facingDirection {
//        case .UP:
//            return
//        case .UP_RIGHT:
//            if(!firstIteration){
//                scene.enumerateChildNodes(withName: "square"){
//                    node, _ in
//                    node.removeFromParent()
//                }
//
//                startingPosition = invisibleBall.position
//                startingPosition1 = startingPosition
//                startingPosition1.x = startingPosition.x - Double(guardPhyscisBodyWidth)*0.5
//                startingPosition1.y = startingPosition.y + Double(guardPhyscisBodyHeight)*0.5
//                startingPosition2 = startingPosition
//                startingPosition2.x = startingPosition.x + Double(guardPhyscisBodyWidth)*0.5
//                startingPosition2.y = startingPosition.y - Double(guardPhyscisBodyHeight)*0.5
//                playerPositionForDistance = point
//                angleForPathfinding = invisibleBall.zRotation
//
//
//                let upperCasting = scene.physicsWorld.body(alongRayStart: startingPosition1 ,end: CGPoint(x: point.x - Double(guardPhyscisBodyWidth)*0.5, y: point.y + Double(guardPhyscisBodyHeight)*0.5))
//                let lowerCasting = scene.physicsWorld.body(alongRayStart: startingPosition2 ,end: CGPoint(x: point.x + Double(guardPhyscisBodyWidth)*0.5, y: point.y - Double(guardPhyscisBodyHeight)*0.5))
//                if (upperCasting?.node?.name == "staticObject" || upperCasting?.node?.name == "dyanimcObject"){
//                    self.obstructedPath = true
//                    print("OSTACOLO")
//                    firstIteration = true
//                    self.actionStateBuffer = .CHASING_PATHFIND
//                }
//
//
//                if (lowerCasting?.node?.name == "staticObject" || lowerCasting?.node?.name == "dyanimcObject"){
//                    self.obstructedPath = true
//                    print("OSTACOLO")
//                    firstIteration = true
//                    self.actionStateBuffer = .CHASING_PATHFIND
//                    print(self.actionStateBuffer)
//                }
//
//                let square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
//                square.strokeColor = .cyan
//                square.fillColor = .cyan
//                square.position = startingPosition1
//                square.zPosition = 100
//                scene.addChild(square)
//                square.name = "square"
//
//                let square2 = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
//                square2.strokeColor = .green
//                square2.fillColor = .green
//                square2.position = startingPosition2
//                square2.zPosition = 100
//                scene.addChild(square2)
//                square2.name = "square"
//
//
//            } else if (obstructedPath == true){
//                print("Searching a path")
//
//                angleCorrection += 2
//
//                invisibleBall.zRotation -= 2 * 3.14 / 180
//
//                let newStartingPositionUp = CGPoint(x: startingPosition1.x, y: startingPosition2.y)
//                let newStartiPositiongBottom = CGPoint(x: startingPosition2.x, y: startingPosition2.y)
//                let distance = getDistanceBetween(point1: startingPosition, point2: playerPositionForDistance)
//                let newAngle = angleForPathfinding + CGFloat(angleCorrection * 3.14 / 180)
////                print("\(angleForPathfinding * 180 / 3.14) + \(newAngle * 180 / 3.14)")
//                let newX = cos(Double(newAngle)) * distance
//                let newY = sin(Double(newAngle)) * distance
//
//                let square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
//                square.strokeColor = .cyan
//                square.fillColor = .cyan
//                square.position = CGPoint(x: newX + startingPosition1.x, y: -(newY - startingPosition.y) + Double(guardPhyscisBodyHeight)*0.5)
////                square.position = CGPoint(x: newX + startingPosition.x , y: -(newY - startingPosition.y))
//                square.zPosition = 100
//                scene.addChild(square)
//                square.name = "square"
//
//                let square2 = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
//                square2.strokeColor = .green
//                square2.fillColor = .green
//                square2.position = CGPoint(x: newX + startingPosition2.x, y: -(newY - startingPosition.y) - Double(guardPhyscisBodyHeight)*0.5)
////                square.position = CGPoint(x: newX + startingPosition.x , y: -(newY - startingPosition.y))
//                square2.zPosition = 100
//                scene.addChild(square2)
//                square2.name = "square"
//
//                let upperCasting = scene.physicsWorld.body(alongRayStart: invisibleBall.position ,end: CGPoint(x: point.x, y: point.y))
//                let lowerCasting = scene.physicsWorld.body(alongRayStart: invisibleBall.position ,end: CGPoint(x: point.x, y: point.y))
////                if (upperCasting?.node?.name == "staticObject" || upperCasting?.node?.name == "dyanimcObject"){
////                    print("OSTACOLO")
////                    obstructedPath = true
////                } else {
////                    obstructedPath = false
////                }
////                if (lowerCasting?.node?.name == "staticObject" || lowerCasting?.node?.name == "dyanimcObject"){
////                    print("OSTACOLO")
////                    obstructedPath = true
////                } else {
////                    obstructedPath = false
////                }
//
//                if( upperCasting?.node?.name == "staticObject" || upperCasting?.node?.name == "dyanimcObject" &&
//                    lowerCasting?.node?.name == "staticObject" || lowerCasting?.node?.name == "dyanimcObject"){
//                    print("OSTACOLO")
//                    obstructedPath = true
//                } else {
//                    obstructedPath = false
//                }
//            }
//        case .RIGHT:
//            if(!firstIteration){
//                scene.enumerateChildNodes(withName: "square"){
//                    node, _ in
//                    node.removeFromParent()
//                }
//
//                startingPosition = invisibleBall.position
//                startingPosition1 = startingPosition
//                startingPosition1.x = startingPosition.x - Double(guardPhyscisBodyWidth)*0.5
//                startingPosition1.y = startingPosition.y + Double(guardPhyscisBodyHeight)*0.5
//                startingPosition2 = startingPosition
//                startingPosition2.x = startingPosition.x + Double(guardPhyscisBodyWidth)*0.5
//                startingPosition2.y = startingPosition.y - Double(guardPhyscisBodyHeight)*0.5
//                playerPositionForDistance = point
//                angleForPathfinding = invisibleBall.zRotation
//
//
//                let upperCasting = scene.physicsWorld.body(alongRayStart: startingPosition1 ,end: CGPoint(x: point.x - Double(guardPhyscisBodyWidth)*0.5, y: point.y + Double(guardPhyscisBodyHeight)*0.5))
//                let lowerCasting = scene.physicsWorld.body(alongRayStart: startingPosition2 ,end: CGPoint(x: point.x + Double(guardPhyscisBodyWidth)*0.5, y: point.y - Double(guardPhyscisBodyHeight)*0.5))
//                if (upperCasting?.node?.name == "staticObject" || upperCasting?.node?.name == "dyanimcObject"){
//                    self.obstructedPath = true
//                    print("OSTACOLO")
//                    firstIteration = true
//                    self.actionStateBuffer = .CHASING_PATHFIND
//                }
//
//
//                if (lowerCasting?.node?.name == "staticObject" || lowerCasting?.node?.name == "dyanimcObject"){
//                    self.obstructedPath = true
//                    print("OSTACOLO")
//                    firstIteration = true
//                    self.actionStateBuffer = .CHASING_PATHFIND
//                    print(self.actionStateBuffer)
//                }
//
//                let square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
//                square.strokeColor = .cyan
//                square.fillColor = .cyan
//                square.position = startingPosition1
//                square.zPosition = 100
//                scene.addChild(square)
//                square.name = "square"
//
//                let square2 = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
//                square2.strokeColor = .green
//                square2.fillColor = .green
//                square2.position = startingPosition2
//                square2.zPosition = 100
//                scene.addChild(square2)
//                square2.name = "square"
//
//
//            } else if (obstructedPath == true){
//                print("Searching a path")
//
//                angleCorrection += 2
//
//                invisibleBall.zRotation -= 2 * 3.14 / 180
//
//                let newStartingPositionUp = CGPoint(x: startingPosition1.x, y: startingPosition2.y)
//                let newStartiPositiongBottom = CGPoint(x: startingPosition2.x, y: startingPosition2.y)
//                let distance = getDistanceBetween(point1: startingPosition, point2: playerPositionForDistance)
//                let newAngle = angleForPathfinding + CGFloat(angleCorrection * 3.14 / 180)
////                print("\(angleForPathfinding * 180 / 3.14) + \(newAngle * 180 / 3.14)")
//                let newX = cos(Double(newAngle)) * distance
//                let newY = sin(Double(newAngle)) * distance
//
//                let square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
//                square.strokeColor = .cyan
//                square.fillColor = .cyan
//                square.position = CGPoint(x: newX + startingPosition1.x, y: -(newY - startingPosition.y) + Double(guardPhyscisBodyHeight)*0.5)
////                square.position = CGPoint(x: newX + startingPosition.x , y: -(newY - startingPosition.y))
//                square.zPosition = 100
//                scene.addChild(square)
//                square.name = "square"
//
//                let square2 = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
//                square2.strokeColor = .green
//                square2.fillColor = .green
//                square2.position = CGPoint(x: newX + startingPosition2.x, y: -(newY - startingPosition.y) - Double(guardPhyscisBodyHeight)*0.5)
////                square.position = CGPoint(x: newX + startingPosition.x , y: -(newY - startingPosition.y))
//                square2.zPosition = 100
//                scene.addChild(square2)
//                square2.name = "square"
//
//                let upperCasting = scene.physicsWorld.body(alongRayStart: invisibleBall.position ,end: CGPoint(x: point.x, y: point.y))
//                let lowerCasting = scene.physicsWorld.body(alongRayStart: invisibleBall.position ,end: CGPoint(x: point.x, y: point.y))
////                if (upperCasting?.node?.name == "staticObject" || upperCasting?.node?.name == "dyanimcObject"){
////                    print("OSTACOLO")
////                    obstructedPath = true
////                } else {
////                    obstructedPath = false
////                }
////                if (lowerCasting?.node?.name == "staticObject" || lowerCasting?.node?.name == "dyanimcObject"){
////                    print("OSTACOLO")
////                    obstructedPath = true
////                } else {
////                    obstructedPath = false
////                }
//
//                if( upperCasting?.node?.name == "staticObject" || upperCasting?.node?.name == "dyanimcObject" &&
//                    lowerCasting?.node?.name == "staticObject" || lowerCasting?.node?.name == "dyanimcObject"){
//                    print("OSTACOLO")
//                    obstructedPath = true
//                } else {
//                    obstructedPath = false
//                }
//            }
//
//        case .DOWN_RIGHT:
//            return
//        case .DOWN:
//            return
//        case .DOWN_LEFT:
//            return
//        case .LEFT:
//            return
//        case .UP_LEFT:
////            if(!firstIteration){
////                scene.enumerateChildNodes(withName: "square"){
////                    node, _ in
////                    node.removeFromParent()
////                }
////
////                startingPosition = invisibleBall.position
////                startingPosition1 = startingPosition
////                startingPosition1.x = startingPosition.x - Double(guardPhyscisBodyWidth)*0.5
////                startingPosition1.y = startingPosition.y + Double(guardPhyscisBodyHeight)*0.5
////                startingPosition2 = startingPosition
////                startingPosition2.x = startingPosition.x + Double(guardPhyscisBodyWidth)*0.5
////                startingPosition2.y = startingPosition.y - Double(guardPhyscisBodyHeight)*0.5
////                playerPositionForDistance = point
////                angleForPathfinding = invisibleBall.zRotation
////
////                let square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
////                square.strokeColor = .cyan
////                square.fillColor = .cyan
////                square.position = startingPosition1
////                square.zPosition = 100
////                scene.addChild(square)
////                square.name = "square"
////
////                let square2 = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
////                square2.strokeColor = .green
////                square2.fillColor = .green
////                square2.position = startingPosition2
////                square2.zPosition = 100
////                scene.addChild(square2)
////                square2.name = "square"
////
////                firstIteration = true
////            } else {
////                let newStartingPositionUp = CGPoint(x: startingPosition1.x, y: startingPosition2.y)
////                let newStartiPositiongBottom = CGPoint(x: startingPosition2.x, y: startingPosition2.y)
////                let distance = getDistanceBetween(point1: startingPosition, point2: playerPositionForDistance)
////                let newAngle = angleForPathfinding + CGFloat(angleCorrection * 3.14 / 180)
////                print("\(angleForPathfinding * 180 / 3.14) + \(newAngle * 180 / 3.14)")
////                let newX = cos(Double(newAngle)) * distance
////                let newY = sin(Double(newAngle)) * distance
////
////                let square = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
////                square.strokeColor = .cyan
////                square.fillColor = .cyan
////                square.position = CGPoint(x: newX + startingPosition1.x, y: -(newY - startingPosition.y) + Double(guardPhyscisBodyHeight)*0.5)
////                square.zPosition = 100
////                scene.addChild(square)
////                square.name = "square"
////
////                let square2 = SKShapeNode(rectOf: CGSize(width: 5, height: 5))
////                square2.strokeColor = .green
////                square2.fillColor = .green
////                square2.position = CGPoint(x: newX + startingPosition2.x, y: -(newY - startingPosition.y) - Double(guardPhyscisBodyHeight)*0.5)
////                square2.zPosition = 100
////                scene.addChild(square2)
////                square2.name = "square"
////
////                let upperCasting = scene.physicsWorld.body(alongRayStart: invisibleBall.position ,end: CGPoint(x: point.x, y: point.y))
////                let lowerCasting = scene.physicsWorld.body(alongRayStart: invisibleBall.position ,end: CGPoint(x: point.x, y: point.y))
////                if (upperCasting?.node?.name == "staticObject" || upperCasting?.node?.name == "dyanimcObject"){
////
////                }
////                angleCorrection += 2
////            }
//            return
//        case .NONE:
//            return
//        }
//
//
//    }

    
    func checkAngle(){
        var spriteAngle = self.invisibleBall.zRotation
        
        if Double(spriteAngle) < pi/8 && Double(spriteAngle) > -pi/8{
            if self.facingDirection != .UP{
                self.angleCorrection = 0
                self.firstIteration = false
                self.facingDirection = .UP
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrandeBackF1")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrandeBackF1")))
            }
        }else if Double(spriteAngle) >= pi/8 && Double(spriteAngle) <= 3*pi/8{
            if self.facingDirection != .UP_LEFT{
                self.angleCorrection = 0
                self.firstIteration = false
                self.facingDirection = .UP_LEFT
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrande3:4BackMirrorF1")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrande3:4BackMirrorF1")))
            }
        }else if Double(spriteAngle) > 3*pi/8 && Double(spriteAngle) < 5*pi/8{
            if self.facingDirection != .LEFT{
                self.angleCorrection = 0
                self.firstIteration = false
                self.facingDirection = .LEFT
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrandeSideF2")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrandeSideF2")))
            }
        }else if Double(spriteAngle) >= 5*pi/8 && Double(spriteAngle) <= 7*pi/8{
            if self.facingDirection != .DOWN_LEFT{
                self.angleCorrection = 0
                self.firstIteration = false
                self.facingDirection = .DOWN_LEFT
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrande3:4FrontF1")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrande3:4FrontF1")))
            }
        }else if (Double(spriteAngle) > 7*pi/8 && Double(spriteAngle) <= pi) || (Double(spriteAngle) < -7*pi/8 && Double(spriteAngle) >= -pi){
            if self.facingDirection != .DOWN{
                self.angleCorrection = 0
                self.firstIteration = false
                self.facingDirection = .DOWN
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrandeFrontF2")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrandeFrontF2")))
            }
        }else if Double(spriteAngle) >= -7*pi/8 && Double(spriteAngle) <= -5*pi/8{
            if self.facingDirection != .DOWN_RIGHT{
                self.angleCorrection = 0
                self.firstIteration = false
                self.facingDirection = .DOWN_RIGHT
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrande3:4FrontMirrorF1")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrande3:4FrontMirrorF1")))
            }
        }else if Double(spriteAngle) > -5*pi/8 && Double(spriteAngle) < -3*pi/8{
            if self.facingDirection != .RIGHT{
                self.angleCorrection = 0
                self.firstIteration = false
                self.facingDirection = .RIGHT
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrandeSideMirrorF2")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrandeSideMirrorF2")))
            }
        }else if Double(spriteAngle) >= -3*pi/8 && Double(spriteAngle) <= -pi/8{
            if self.facingDirection != .UP_RIGHT{
                self.angleCorrection = 0
                self.firstIteration = false
                self.facingDirection = .UP_RIGHT
                self.currentIdleDirectionTexture = SKTexture(imageNamed: "ConoGrande3:4BackF1")
                self.run(.setTexture(SKTexture(imageNamed: "ConoGrande3:4BackF1")))
            }
        }
    }
    
    func checkRotationReset(){
        if -360 == Int(180 * self.invisibleBall.zRotation / 3.14){
            print("Resetting")
            self.invisibleBall.zRotation = 0
        }
        
        if 360 == Int(180 * self.invisibleBall.zRotation / 3.14){
            print("Resetting")
            self.invisibleBall.zRotation = 0
        }
    }
    
    
    func checkState(point: CGPoint, deltaTime: TimeInterval, scene: SKScene){
        
        print(self.actionStateBuffer)
        
        if(pathToChasing == true){
            pathToChasing = false
            
            if(actionState == .IDLE || actionState == .MOVE || actionState == .ROTATING_ACTION){
                lastActionState = actionState
                lastAngle = invisibleBall.zRotation
                lastPosition = invisibleBall.position
                lastMovingDirectionBuffer = movingDirectionBuffer
                if let action = self.invisibleBall.action(forKey: "guardPath"){
                    action.speed = 0
                }
            }
            
            actionStateBuffer = .CHASING
            
        } else if (chasingToSearching) {
            chasingToSearching = false
            lastPlayerPosition = point
            lastAngleSeen = myAngle
            print(lastAngleSeen)
            
            actionStateBuffer = .SEARCHING
        } else if (searchingToRotating) {
            searchingToRotating = false
            
            rotatingToRotating = true
            
            actionStateBuffer = .ROTATING
        } else if (rotatingToReturn){
            rotatingToReturn = false
            
            actionStateBuffer = .RETURNING
        }
        
        
        
        if (actionStateBuffer == .CHASING) {
            let directionVector = getDirectionVectorBetween(start: self.position, end: point)
            invisibleBall.position.x += directionVector.dx * 75 * deltaTime
            invisibleBall.position.y += directionVector.dy * 75 * deltaTime
            invisibleBall.zRotation = -atan2(directionVector.dx, directionVector.dy)
            checkAngle()
            if(actionStateBuffer != actionState){
                actionState = actionStateBuffer
            }
            rayCastingForObstacles(scene: scene, point: point)
            
         } else if (actionStateBuffer == .SEARCHING) {
            
            let directionVector = getDirectionVectorBetween(start: self.position, end: lastPlayerPosition)
            invisibleBall.position.x += directionVector.dx * 75 * deltaTime
            invisibleBall.position.y += directionVector.dy * 75 * deltaTime
            invisibleBall.zRotation = -atan2(directionVector.dx, directionVector.dy)
            
            if(actionStateBuffer != actionState){
                actionState = actionStateBuffer
            }
            
            let searchingRectangleDestination = SKShapeNode(rectOf: CGSize(width: 20, height: 20))
            searchingRectangleDestination.position = lastPlayerPosition
            
            if(searchingRectangleDestination.contains(invisibleBall.position)){
                invisibleBall.position = lastPlayerPosition
                searchingToRotating = true
            }
            
            checkAngle()
            
            if(actionStateBuffer != actionState){
                actionState = actionStateBuffer
            }
            
        } else if (actionStateBuffer == .ROTATING) {
            if(rotatingToRotating){
                self.removeAction(forKey: "guardMovement")
                invisibleBall.zRotation = -CGFloat(lastAngleSeen)
                rotatingToRotating = false
                let sequence: [SKAction] = [SKAction.wait(forDuration: 2),
                                            SKAction.rotate(toAngle: -Double(lastAngleSeen) + 3.14 * 45 / 180, duration: 1),
                                            SKAction.rotate(toAngle: -Double(lastAngleSeen), duration: 1),
                                            SKAction.wait(forDuration: 2),
                                            SKAction.rotate(toAngle: -Double(lastAngleSeen) -  3.14 * 45 / 180, duration: 1),
                                            SKAction.customAction(withDuration: 0.01, actionBlock: {
                                            node, _ in
                                                self.readyToReturn = true
                                            })
                                            ]
                invisibleBall.run(.sequence(sequence), withKey: "rotating")
            }
            checkAngle()
            if(actionStateBuffer != actionState){
                actionState = actionStateBuffer
            }
            
        } else if (actionStateBuffer == .RETURNING){
            let directionVector = getDirectionVectorBetween(start: self.position, end: lastPosition)
            invisibleBall.position.x += directionVector.dx * 75 * deltaTime
            invisibleBall.position.y += directionVector.dy * 75 * deltaTime
            invisibleBall.zRotation = -atan2(directionVector.dx, directionVector.dy)
            
            if(actionStateBuffer != actionState){
                actionState = actionStateBuffer
            }
            
            let returningRectangleDestination = SKShapeNode(rectOf: CGSize(width: 20, height: 20))
            returningRectangleDestination.position = lastPosition
            
            if(actionStateBuffer != actionState){
                actionState = actionStateBuffer
            }
            if(returningRectangleDestination.contains(invisibleBall.position)){
                invisibleBall.position = lastPosition
                actionStateBuffer = lastActionState
                movingDirectionBuffer = lastMovingDirectionBuffer
                invisibleBall.zRotation = lastAngle
                if let action = self.invisibleBall.action(forKey: "guardPath"){
                    action.speed = 1
                }
            }
            checkAngle()
        } else if (actionStateBuffer == .CHASING_PATHFIND){
            print("CHASING PATHFIND")
            rayCastingForObstacles(scene: scene, point: point)
            checkAngle()
            
            if(actionStateBuffer != actionState){
                actionState = actionStateBuffer
            }
        }
        
        
        
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
        
        
        if(self.actionStateBuffer == GuardActionState.CHASING || self.actionStateBuffer == GuardActionState.RETURNING){
            if(self.movingDirectionBuffer != self.facingDirection){
                self.removeAction(forKey: "guardMovement")
                switch facingDirection {
                case .UP:
                    self.run(.repeatForever(.animate(with: walkingAnimationBack, timePerFrame: 0.125)), withKey: "guardMovement")
                case .UP_RIGHT:
                    self.run(.repeatForever(.animate(with: walkingAnimationBackRight, timePerFrame: 0.125)), withKey: "guardMovement")
                case .RIGHT:
                    self.run(.repeatForever(.animate(with: walkingAnimationRight, timePerFrame: 0.125)), withKey: "guardMovement")
                case .DOWN_RIGHT:
                    self.run(.repeatForever(.animate(with: walkingAnimationFrontRight, timePerFrame: 0.125)), withKey: "guardMovement")
                case .DOWN:
                    self.run(.repeatForever(.animate(with: walkingAnimationFront, timePerFrame: 0.125)), withKey: "guardMovement")
                case .DOWN_LEFT:
                    self.run(.repeatForever(.animate(with: walkingAnimationFrontLeft, timePerFrame: 0.125)), withKey: "guardMovement")
                case .LEFT:
                    self.run(.repeatForever(.animate(with: walkingAnimationLeft, timePerFrame: 0.125)), withKey: "guardMovement")
                case .UP_LEFT:
                    self.run(.repeatForever(.animate(with: walkingAnimationBackLeft, timePerFrame: 0.125)), withKey: "guardMovement")
                case .NONE:
                    return
                }
                self.movingDirectionBuffer = self.facingDirection
                self.actionState = self.actionStateBuffer
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
            
//            print("Scena corrente per la guardia: \(currentScene)")
            
//            let currentFloor = currentRoom.parent!
            
//            print("SCENA DI \(entity.name) : \(currentRoom)")
            
            var space: Double = 0
            
            let path = CGMutablePath()
            
            print("Punto iniziale: \(action.startingPoint) + Punto finale: \(action.endingPoint)")
            
            path.move(to: CGPoint(x: 0, y: 0))
//            path.move(to: currentRoom.convert(CGPoint(x: 0, y: 0), to: entity.parent!))
            if(action.startingPoint.x != action.endingPoint.x){
                space = (action.endingPoint.x - action.startingPoint.x)*CGFloat(blocco)
                
                
//                path.addLine(to: currentRoom.convert(CGPoint(x: (action.endingPoint.x - action.startingPoint.x)*CGFloat(blockDimension), y: 0), to: entity.parent!))
                path.addLine(to: CGPoint(x: (action.endingPoint.x - action.startingPoint.x)*CGFloat(blocco), y: 0))
                if(action.endingPoint.x - action.startingPoint.x > 0){
                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
                        node, _ in
                        
                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
                    })
                    
                    sequenceArray.append(updateStateActionToMoveAndDirection)
                } else {
                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
                        node, _ in
                        
                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
                    })
                    
                    sequenceArray.append(updateStateActionToMoveAndDirection)
                }
            } else {
//                space = (action.endingPoint.y - action.startingPoint.y)*CGFloat(blocco)
                space = (action.startingPoint.y - action.endingPoint.y)*CGFloat(blocco)
                
                path.addLine(to: CGPoint(x: 0, y: (action.startingPoint.y - action.endingPoint.y)*CGFloat(blocco)))
                if(action.endingPoint.y - action.startingPoint.y > 0){
                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
                        node, _ in
                        
                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
                    })
                    
                    sequenceArray.append(updateStateActionToMoveAndDirection)
                } else {
                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
                        node, _ in
                        
                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
//                        entity.setGuardMovementDirection(movementDirection: Direction.DOWN)
                    })
                    
                    sequenceArray.append(updateStateActionToMoveAndDirection)
                }
            }

            let followLine = SKAction.follow(path, asOffset: true, orientToPath: false, duration: abs(space)/Double(entity.getSpeed()))

//            if(action.startingPoint.x != action.endingPoint.x){
//                space = (action.endingPoint.x - action.startingPoint.x)*CGFloat(blockDimension)
//
//                path.addLine(to: CGPoint(x: (action.endingPoint.x - action.startingPoint.x)*CGFloat(blockDimension), y: 0))
//                if(action.endingPoint.x - action.startingPoint.x > 0){
//                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
//                        node, _ in
//
//                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
//                    })
//
//                    sequenceArray.append(updateStateActionToMoveAndDirection)
//                } else {
//                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
//                        node, _ in
//
//                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
//                    })
//
//                    sequenceArray.append(updateStateActionToMoveAndDirection)
//                }
//            } else {
//                space = (action.endingPoint.y - action.startingPoint.y)*CGFloat(blockDimension)
//
//                path.addLine(to: CGPoint(x: 0, y: (action.endingPoint.y - action.startingPoint.y)*CGFloat(blockDimension)))
//                if(action.endingPoint.y - action.startingPoint.y > 0){
//                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
//                        node, _ in
//
//                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
//                    })
//
//                    sequenceArray.append(updateStateActionToMoveAndDirection)
//                } else {
//                    let updateStateActionToMoveAndDirection = SKAction.customAction(withDuration: 0.01, actionBlock: {
//                        node, _ in
//
//                        entity.setGuardActionStateBuffer(actionStateBuffer: GuardActionState.MOVE)
////                        entity.setGuardMovementDirection(movementDirection: Direction.DOWN)
//                    })
//
//                    sequenceArray.append(updateStateActionToMoveAndDirection)
//                }
//            }
//
//            let followLine = SKAction.follow(path, asOffset: true, orientToPath: false, duration: abs(space)/Double(entity.getSpeed()))

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
    
//    print(sequenceArray)
    
    entity.getCenterBall().run(.repeatForever(SKAction.sequence(sequenceArray)), withKey: "guardPath")
}



