//
//  TestScene2.swift
//  StealthProject
//
//  Created by Salvatore Manna on 04/05/22.
//

import UIKit
import GameplayKit


var test: [SKTexture] = [SKTexture(imageNamed: "boyWalk1"), SKTexture(imageNamed:"boyWalk2"), SKTexture(imageNamed:"boyWalk3"), SKTexture(imageNamed:"boyWalk4"), SKTexture(imageNamed:"boyWalk5"), SKTexture(imageNamed:"boyWalk6"), SKTexture(imageNamed:"boyWalk7"), SKTexture(imageNamed:"boyWalk8")]
var test2: [SKTexture] = [SKTexture(imageNamed: "boyFrontWalk1"), SKTexture(imageNamed: "boyFrontWalk2"), SKTexture(imageNamed: "boyFrontWalk3"), SKTexture(imageNamed: "boyFrontWalk4")]
var test3: [SKTexture] = [SKTexture(imageNamed: "boyWalkLeft1"), SKTexture(imageNamed:"boyWalkLeft2"), SKTexture(imageNamed:"boyWalkLeft3"), SKTexture(imageNamed:"boyWalkLeft4"), SKTexture(imageNamed:"boyWalkLeft5"), SKTexture(imageNamed:"boyWalkLeft6"), SKTexture(imageNamed:"boyWalkLeft7"), SKTexture(imageNamed:"boyWalkLeft8")]
var test4: [SKTexture] = [SKTexture(imageNamed: "boyBackWalk1"), SKTexture(imageNamed: "boyBackWalk2"), SKTexture(imageNamed: "boyBackWalk3"), SKTexture(imageNamed: "boyBackWalk4")]

var rolltest: [SKTexture] = [SKTexture(imageNamed: "boyRoll1"), SKTexture(imageNamed: "boyRoll2"), SKTexture(imageNamed: "boyRoll3"), SKTexture(imageNamed: "boyRoll4"), SKTexture(imageNamed: "boyRoll5"), SKTexture(imageNamed: "boyRoll6"), SKTexture(imageNamed: "boyRoll7"), SKTexture(imageNamed: "boyRoll8")]




class TestScene2: SKScene, PlayableScene, SKPhysicsContactDelegate {
//    var roomWalls2 = [[2,1,1,1,1,1,1,3],
//                      [4,6,6,6,6,6,6,5],
//                      [4,6,6,6,6,6,6,5],
//                      [4,6,6,6,6,6,6,5],
//                      [4,6,6,6,6,6,6,5],
//                      [4,6,6,6,6,6,6,5],
//                      [4,6,6,6,6,6,6,5],
//                      [1,1,1,1,1,1,1,1]
//]
    
    var roomWalls2 =     [[2, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 3],
                          [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
                          [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
                          [7, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 7],
                          [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
                          [1, 1, 1, 4, 6, 6, 6, 6, 5, 1, 1, 1],
                          [0, 0, 0, 4, 6, 6, 6, 6, 5, 0, 0, 0],
                          [0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0]
                         ]
    
    var floor = SKSpriteNode(texture: SKTexture(imageNamed: "pavimento3"), size: CGSize(width: blocco, height: blocco))
    
    var delta: TimeInterval = 0.0
    var lastUpdate: TimeInterval?
    
    var player: PlayableCharacter = Human(texture: SKTexture(imageNamed: "boyFront"), color: .clear, size: CGSize(width: 35, height: 70), noise: 1, speed: 1, strenght: 1)
//    var armadio: InteractableObject = InteractableObject(texture: SKTexture(imageNamed: "closet"), highlighted: SKTexture(imageNamed: "closetFocused"), color: .clear, size: CGSize(width: 100, height: 100), type: .HIDEOUT)
    var armadio: Closet = Closet()
    var lampione = Lampione(texture: SKTexture(imageNamed: "lampione"), color: .clear, size: CGSize(width: 70, height: 140), objectName: "lampione1", lightBitmask: 2)
    
    var lightSwitch = LightSwitch(texture: SKTexture(imageNamed: "ConoPiccoloBackF1"), highlighted: SKTexture(imageNamed: "ConoPiccoloBackF2"), color: .clear, size: CGSize(width: 100, height: 100), referredLightName: "lampione1")
    
//    var luce: SKLightNode = SKLightNode()

    
    var scenecamera = SKCameraNode()
    
    var coin = SKSpriteNode(imageNamed: "ingranaggio")
    var t = SKTransformNode()
    var animationCoin = SKAction()
    
    var inputVector: CGVector = CGVector.zero
    var rollVector: CGVector = CGVector.init(dx: 1, dy: 0)
    var velocity: CGVector = CGVector.zero
    
    var ACCELLERATION: Double = 20
    var MAX_SPEED: Double = 100
    var FRICTION: Double = 10
    
    var ombra = SKShapeNode(ellipseOf: CGSize(width: 30, height: 2))
    
    func createRoom2(){
        for index in 0...roomWalls2.count-1{
            for index2 in 0...roomWalls2[1].count-1{
                
                if(roomWalls2[index][index2] != 0){
                    let myWall = SKSpriteNode(texture: SKTexture(imageNamed: "erba"), size: CGSize(width: blocco, height: blocco))
                    myWall.name = "wall"+String(index)+String(index2)
                    myWall.zPosition = 1
                    myWall.position = CGPoint(x:  CGFloat(Float(blocco*index2)) + CGFloat(blocco/2), y: size.height - CGFloat(blocco*index) + CGFloat(blocco/2))
                    addChild(myWall)
                }
                
                if(roomWalls2[index][index2] == 1){
                    let myWall = SKSpriteNode(texture: SKTexture(imageNamed: "parete frontaleSu"), size: CGSize(width: blocco, height: blocco))
                    myWall.name = "wall"+String(index)+String(index2)
                    myWall.zPosition = 2
                    myWall.position = CGPoint(x: CGFloat(Float(blocco*index2)) + CGFloat(blocco/2), y: size.height - CGFloat(blocco*index) + CGFloat(blocco/2))
                    myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    myWall.physicsBody?.restitution = 0
                    myWall.physicsBody?.affectedByGravity = false
                    myWall.physicsBody?.isDynamic = false
                    addChild(myWall)
                }

                if(roomWalls2[index][index2] == 2){
                    let myWall = SKSpriteNode(texture: SKTexture(imageNamed: "angolo frontaleSxSu"), size: CGSize(width: blocco, height: blocco))
                    myWall.name = "wall"+String(index)+String(index2)
                    myWall.zPosition = 2
                    myWall.position = CGPoint(x: blocco*index2 + blocco/2, y: Int(size.height) - blocco*index + blocco/2)
                    myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    myWall.physicsBody?.restitution = 0
                    myWall.physicsBody?.affectedByGravity = false
                    myWall.physicsBody?.isDynamic = false
                    addChild(myWall)
                }

                if(roomWalls2[index][index2] == 3){
                    let myWall = SKSpriteNode(texture: SKTexture(imageNamed: "angolo frontaleDxSu"), size: CGSize(width: blocco, height: blocco))
                    myWall.name = "wall"+String(index)+String(index2)
                    myWall.zPosition = 2
                    myWall.position = CGPoint(x: CGFloat(Float(blocco*index2)) + CGFloat(blocco/2), y: size.height - CGFloat(blocco*index) + CGFloat(blocco/2))
                    myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco, height: blocco/2), center: CGPoint(x: 0, y: blocco/4))
                    myWall.physicsBody?.restitution = 0
                    myWall.physicsBody?.affectedByGravity = false
                    myWall.physicsBody?.isDynamic = false
                    addChild(myWall)
                }
                if(roomWalls2[index][index2] == 4){
                    let myWall = SKSpriteNode(texture: SKTexture(imageNamed: "parete laterale"), size: CGSize(width: blocco, height: blocco))
                    myWall.name = "wall"+String(index)+String(index2)
                    myWall.zPosition = 2
                    myWall.position = CGPoint(x: size.width * 0 + CGFloat(Float(blocco*index2)) + CGFloat(blocco/2), y: size.height - CGFloat(blocco*index) + CGFloat(blocco/2))
                    myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: -blocco/3, y: 0))
                    if index == 1{
                        myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco*2), center: CGPoint(x: -blocco/3, y: 0))
                    }
                    myWall.physicsBody?.restitution = 0
                    myWall.physicsBody?.affectedByGravity = false
                    myWall.physicsBody?.isDynamic = false
                    addChild(myWall)
                }
                if(roomWalls2[index][index2] == 5){
                    let myWall = SKSpriteNode(texture: SKTexture(imageNamed: "parete laterale"), size: CGSize(width: blocco, height: blocco))
                    myWall.name = "wall"+String(index)+String(index2)
                    myWall.zPosition = 2
                    myWall.position = CGPoint(x: size.width * 0 + CGFloat(Float(blocco*index2)) + CGFloat(blocco/2), y: size.height - CGFloat(blocco*index) + CGFloat(blocco/2))
                    myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco), center: CGPoint(x: +blocco/3, y: 0))
                    if index == 1{
                        myWall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: blocco/3, height: blocco*2), center: CGPoint(x: +blocco/3, y: 0))
                    }
                    myWall.physicsBody?.restitution = 0
                    myWall.physicsBody?.affectedByGravity = false
                    myWall.physicsBody?.isDynamic = false
                    addChild(myWall)
                }
             


                }
            }
        }

    
    
    override func didMove(to view: SKView) {
        myGameController.connectController()
        camera = scenecamera
        scenecamera.position = player.position
//        scenecamera.setScale(10)
        armadio.position = player.position
        armadio.position.x += 250
        lampione.position = player.position
        lampione.position.y += 100
        player.zPosition = 10
        armadio.zPosition = 1
        lampione.zPosition = 1
        player.position = CGPoint(x: 0, y: 0)
        
//        let room = Room(.SIMPLE_1, startingPosition: CGPoint(x: 400, y: 400))
//        let _ = Floor(self, floorType: .FIRST_FLOOR)
        
//        luce.categoryBitMask = 2
//        luce.position = lampione.position
//        luce.position.y += 35
        
        
//        lampione.lightingBitMask = 2
        
        player.lightingBitMask = 2
        armadio.lightingBitMask = 2


//        lampione.name = "enemy"
        coin.size = CGSize(width: 30, height: 30)

        ombra.position = t.position
        ombra.position.y -= coin.size.height/2 + 10
        ombra.zPosition = 1
        ombra.fillColor = .init(white: 0, alpha: 0.2)
        ombra.strokeColor = .clear
        
        coin.addChild(ombra)
        
        t.position = CGPoint(x: 100, y: 100)
        t.addChild(coin)
        animationCoin = SKAction.repeatForever(.sequence([.run {
            self.t.yRotation += 0.063  //UN CENTESIMO DI 2PI
        }, .wait(forDuration: 0.05)]))
        animationCoin.timingMode = .easeOut
        t.run(animationCoin)
        
        lightSwitch.position = player.position
        lightSwitch.position.x -= 70
        
        addChild(player)
        addChild(armadio)
        addChild(lampione)
//        addChild(luce)
        addChild(t)
//        addChild(ombra)
        addChild(lightSwitch)
//        createRoom2()
//        addChild(room)
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        calcDelta(currentTime: currentTime)
        player.updateActionState(scene: self)
//        player.updateMovingDirection()
        player.animationTree()
        player.searchObject(scene: self)
        player.updateFocus(scene: self)
        
        switch player.getActionState(){
        case .MOVE:
            moveState()
            
        case .ATTACK:
            attackState(scene: self)
            
        case .INTERACT:
            interactState(scene: self)
            
        case .ROLL:
            rollState()
            
        case .HIDDEN:
            hiddenState()
            
        case .RUNNING:
            runningState()
        }
        
        playerMovement(player: player as SKSpriteNode, velocity: velocity)

        
        scenecamera.position = player.position
//        print(player.getFacingDirection())
//        print(player.getFocusState())
        print(player.getActionState())
//        print(player.getStatus().isInteracting)
    }
    
    
    
    
}
