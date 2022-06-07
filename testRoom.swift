//
//  testRoom.swift
//  StealthProject
//
//  Created by Gennaro Cirillo on 06/05/22.
//

import Foundation
import SpriteKit
import GameplayKit

let enemyDimensionWidth: Double = 40
let enemyDimensionHeight: Double = 80

let blockDimension: Int = 60


//IN PROVA2 LE GUARDIE TRASLANO

class Piano1: SKScene, PlayableScene, SKPhysicsContactDelegate  {

    let guard1: GuardConoGrande = GuardConoGrande(texture: SKTexture(imageNamed: "ConoGrandeFrontF2"), color: .clear, size: CGSize(width: enemyDimensionWidth, height: enemyDimensionHeight))
    
    var timer = TimeCounter()
    
    
    
    var delta: TimeInterval = 0.0
    var lastUpdate: TimeInterval?
    
    let room = Room(.SIMPLE_4, startingPosition: CGPoint(x: 50, y: 50), floor: .FIRST_FLOOR)
    
    var scenecamera = SKCameraNode()
    
    
    var player: PlayableCharacter = Human(texture: SKTexture(imageNamed: "boyFront"), color: .clear, size: CGSize(width: 35, height: 70), noise: 1, speed: 3, strenght: 1)

    var inputVector: CGVector = CGVector.zero
    var rollVector: CGVector = CGVector.init(dx: 1, dy: 0)
    var velocity: CGVector = CGVector.zero
    
    var ACCELLERATION: Double = 10
    var MAX_SPEED: Double = 50
    var FRICTION: Double = 10
    
    var indicatore = Counter()
    
    var  nemici: [SKNode] = []
    var oggetti: [SKNode] = []
    
    var initGuards = false

    
    override func didMove(to view: SKView) {
        myGameController.setUpGameController()
        
     
        camera = scenecamera
        scenecamera.position = player.position
        
//        createRoom()
        
        
        addChild(room)
        
        player.position = CGPoint(x: 0 + Double(2)*Double(blocco) * 0.5, y: 0 - Double(blocco) * 0.5)
//        player.position = CGPoint(x: player.position.x + CGFloat(9*blocco), y: player.position.y - CGFloat(2*blocco))
        addChild(player)
        player.name = "player"
        player.zPosition = 20
        
        
        guard1.run(.setTexture(SKTexture(imageNamed: "ConoGrandeBackF1")))
        guard1.position = CGPoint(x: guard1.position.x + CGFloat(5*blocco), y: guard1.position.y - CGFloat(5*blocco))
        guard1.zPosition = 20
        guard1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 40, height: 80))
        guard1.physicsBody?.restitution = 0
        guard1.physicsBody?.isDynamic = false
        guard1.physicsBody?.affectedByGravity = false
        guard1.physicsBody?.allowsRotation = false
//        addChild(guard1)
        
        
        
//        let myActions: [SKAction] = [SKAction.customAction(withDuration: 0.01, actionBlock: {
//            node, _ in
//            self.guard1.setGuardActionStateBuffer(actionStateBuffer: .IDLE)
//        }),
//                                     SKAction.rotate(byAngle: 3.14 * 45 / 180, duration: 2)]
//
//        guard1.getCenterBall().run(.repeatForever(.sequence(myActions)), withKey: "guardPath")
        
//        createPath(entity: guard1, arrayOfActions:
//                    [myAction(actionType: ActionType.ROTATE_ACTION, duration: 3, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y: 6), angle: -90),
//                     myAction(actionType: ActionType.PATH_ACTION, duration: 4, startingPoint: CGPoint(x: 3, y: 3), endingPoint: CGPoint(x: 7, y: 3), angle: 0),
//                     myAction(actionType: ActionType.WAIT_ACTION, duration: 3, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y: 6), angle: 90),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 3, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y: 5), angle: 0),
//                     myAction(actionType: ActionType.PATH_ACTION, duration: 2, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y:  5), angle: -135),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y:  5), angle: 45),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y:  0), angle: -45),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 13, y: 5), endingPoint: CGPoint(x: 7, y:  5), angle: -90),
//                     myAction(actionType: ActionType.PATH_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 13, y:  5), angle: -270),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 13, y:  5), angle: 90),
//                     myAction(actionType: ActionType.PATH_ACTION, duration: 1, startingPoint: CGPoint(x: 13, y: 5), endingPoint: CGPoint(x: 7, y:  5), angle: -270),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 13, y:  5), angle: 180),
//                     myAction(actionType: ActionType.PATH_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 7, y:  3), angle: -180),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 7, y:  3), angle: 90),
//                     myAction(actionType: ActionType.PATH_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 3, y:  3), angle: -180)
//        ])
        
//        createPath(entity: guard1, arrayOfActions: <#T##[myAction]#>)

        
//        createPath(entity: guard1, arrayOfActions:
//                    [myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y: 6), angle: -90),
//                     myAction(actionType: ActionType.PATH_ACTION, duration: 2, startingPoint: CGPoint(x: 3, y: 3), endingPoint: CGPoint(x: 7, y: 3), angle: 0),
//                     myAction(actionType: ActionType.WAIT_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y: 6), angle: 90),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y: 5), angle: 90),
//                     myAction(actionType: ActionType.PATH_ACTION, duration: 2, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y:  5), angle: -135),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y:  5), angle: 45),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y:  0), angle: -90),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 13, y: 5), endingPoint: CGPoint(x: 7, y:  5), angle: -45),
//                     myAction(actionType: ActionType.PATH_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 13, y:  5), angle: -270),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 13, y:  5), angle: 180),
//                     myAction(actionType: ActionType.PATH_ACTION, duration: 1, startingPoint: CGPoint(x: 13, y: 5), endingPoint: CGPoint(x: 7, y:  5), angle: -270),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 13, y:  5), angle: 90),
//                     myAction(actionType: ActionType.PATH_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 7, y:  3), angle: -180),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 7, y:  3), angle: -90),
//                     myAction(actionType: ActionType.PATH_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 5), endingPoint: CGPoint(x: 3, y:  3), angle: -180),
//                     myAction(actionType: ActionType.ROTATE_ACTION, duration: 1, startingPoint: CGPoint(x: 7, y: 3), endingPoint: CGPoint(x: 7, y: 6), angle: -90)])

    }
    
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if contact.bodyA.node?.name == "player"{
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }else if contact.bodyB.node?.name == "player"{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "collectible"{
            let item = secondBody.node as? Collectible
            item?.action(player: firstBody.node as? PlayableCharacter ?? PlayableCharacter(), scene: self)
            if item?.getType() == .COIN{
//                indicatore.run(.moveBy(x: 0, y: -90, duration: 0.5), completion: {
//                    self.indicatore.run(.sequence([.wait(forDuration: 1.5), .moveBy(x: 0, y: 90, duration: 0.5)]))
//                })
                indicatore.run(.moveTo(y: UIScreen.main.bounds.height*0.29, duration: 0.5), completion: {
                    self.indicatore.run(.sequence([.wait(forDuration: 1.5), .moveTo(y: UIScreen.main.bounds.height*0.55, duration: 0.5)]))
                })
                item?.action(contatore: indicatore)
            }
            secondBody.node?.removeFromParent()
        }
        if firstBody.node?.name == "player" && secondBody.node?.name == "door"{
            let door = secondBody.node as? Door
            door?.open()
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        calcDelta(currentTime: currentTime)
        indicatore.etichetta.text = "x \(indicatore.number)"
        player.updateActionState(scene: self, oggetti: oggetti)
//        player.updateMovingDirection()
        player.animationTree()
        player.searchObject(scene: self, oggetti: oggetti)
        player.updateFocus(scene: self, enemies: nemici, oggetti: oggetti)
        
        switch player.getActionState(){
        case .MOVE:
            moveState()
            
        case .ATTACK:
            attackState(scene: self, nemici: nemici)
            
        case .INTERACT:
            interactState(scene: self, oggetti: oggetti)
            
        case .ROLL:
            rollState()
            
        case .HIDDEN:
            hiddenState()
            
        case .RUNNING:
            runningState()
        }
        
        playerMovement(player: player as SKSpriteNode, velocity: velocity)

        
        scenecamera.position = player.position
        
        if(!initGuards){
//            print("Inizializzo le guardie con le coordinate della scena")
            initGuards = true
            for guardia in arrayOfGuards{
//                print("GUARDIA POSIZIONE: \(guardia.position)")
                let posizioneDellaScena = guardia.convert(guardia.position, to: self)
//                print("GUARDIA POSIZIONE CONVERTITA: \(posizioneDellaScena)")
                let posizioneDellaScena2 = guardia.roomReference.convert(guardia.position, to: self)
//                print("GUARDIA POSIZIONE CONVERTITA 2: \(posizioneDellaScena2)")
                
//                guardia.removeFromParent()
//                guardia.getCenterBall().removeFromParent()
//                guardia.position = posizioneDellaScena2
//                guardia.getCenterBall().position = posizioneDellaScena2
//                self.addChild(guardia)
//                self.addChild(guardia.getCenterBall())
            }
        }
        
        for guardia in arrayOfGuards{
            visionCone(entity: guardia, scene: self, timer: timer)
            guardia.checkState(point: player.position, deltaTime: delta, scene: self)
        }
    }
}



