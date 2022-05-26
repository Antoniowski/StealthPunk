//
//  TestScene2.swift
//  StealthProject
//
//  Created by Salvatore Manna on 04/05/22.
//

import UIKit
import GameplayKit


class TestScene4: SKScene, PlayableScene, SKPhysicsContactDelegate {

    
    var floor = SKSpriteNode(texture: SKTexture(imageNamed: "pavimento3"), size: CGSize(width: blocco, height: blocco))
    
    var delta: TimeInterval = 0.0
    var lastUpdate: TimeInterval?
    
    var player: PlayableCharacter = Human(texture: SKTexture(imageNamed: "boyFront"), color: .clear, size: CGSize(width: 35, height: 70), noise: 1, speed: 3, strenght: 1)
//    var armadio: InteractableObject = InteractableObject(texture: SKTexture(imageNamed: "closet"), highlighted: SKTexture(imageNamed: "closetFocused"), color: .clear, size: CGSize(width: 100, height: 100), type: .HIDEOUT)
    var armadio: Bush = Bush()
//    var lampione = Lampione(texture: SKTexture(imageNamed: "lampione"), color: .clear, size: CGSize(width: 70, height: 140), objectName: "lampione1", lightBitmask: 2)
    
    var lightSwitch = LightSwitch(referredLightName: "lampione1")
    
    var luce: SKLightNode = SKLightNode()

    
    var scenecamera = SKCameraNode()
    
    var coin = SKSpriteNode(imageNamed: "ingranaggio")
    var t = SKTransformNode()
    var animationCoin = SKAction()
    
    var inputVector: CGVector = CGVector.zero
    var rollVector: CGVector = CGVector.init(dx: 1, dy: 0)
    var velocity: CGVector = CGVector.zero
    
    var ACCELLERATION: Double = 10
    var MAX_SPEED: Double = 50
    var FRICTION: Double = 10
    
    var ombra = SKShapeNode(ellipseOf: CGSize(width: 30, height: 2))
    var boots = Collectible(type: .BOOTS)
    var knuckles = Collectible(type: .KNUCKLES)
    var testcoin = Collectible(type: .COIN)
    var testcoin2 = Collectible(type: .COIN)

    var testcoin3 = Collectible(type: .COIN)

    var testcoin4 = Collectible(type: .COIN)

    
    var indicatore = Counter()
    var chest = Chest(locked: false)
    
    var index = 0

    
    
    override func didMove(to view: SKView) {
        myGameController.connectController()
        self.backgroundColor = .black
        physicsWorld.contactDelegate = self
        camera = scenecamera
        
        luce.position = .init(x: 2000, y: 2000)
        
        
        indicatore.position.x = player.position.x - 100
        indicatore.position.y = player.position.y + frame.height/3.5 + 90
//        scenecamera.addChild(indicatore)

        scenecamera.position = player.position
        scenecamera.setScale(1)
//        armadio.position = player.position
//        armadio.position.x += 250
//        lampione.position = player.position
//        lampione.position.y += 100
//        player.zPosition = 10
//        armadio.zPosition = 1
//        lampione.zPosition = 1
        player.position = CGPoint(x: 204, y: 300)
//        player.lightingBitMask = 5
        
//        let room = Room(.LOBBY, startingPosition: CGPoint(x: 0, y: 400), floor: .FIRST_FLOOR)
        let f = Floor(self, floorType: .SECOND_FLOOE)
        
//        luce.categoryBitMask = 2
//        luce.position = lampione.position
        
        
//        lampione.lightingBitMask = 2
//
        player.lightingBitMask = 1 | 2
//        armadio.lightingBitMask = 2
//
//
//        lampione.name = "enemy"
        
//        luce.ambientColor = .init(red: 0.624, green: 0.624, blue: 0.914, alpha: 0.5) // PER LE PARTI SCURE - GIARDINO
        luce.ambientColor = .init(red: 0.6, green: 0.6, blue: 0.75, alpha: 0.5)

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
        
        knuckles.position = .init(x: 150, y: 150)
        testcoin.position = .init(x: 150, y: -150)
        testcoin2.position = .init(x: 170, y: -150)
        testcoin3.position = .init(x: 190, y: -150)
        testcoin4.position = .init(x: 210, y: -150)

        
        chest.position = .init(x: -100 , y: -120)
        
        luce.falloff = 10
        luce.lightColor = .init(white: 1, alpha: 0.5)
        luce.zPosition = 50
        

        player.position = f.spawn
        player.zPosition = 10

        
        addChild(player)
//        addChild(armadio)
//        addChild(lampione)
        addChild(luce)
//        addChild(t)
//        addChild(ombra)
//        addChild(lightSwitch)
//        addChild(boots)
//        addChild(knuckles)
//        addChild(testcoin)
//        addChild(testcoin2)
//        addChild(testcoin4)
//        addChild(testcoin3)
//
//        addChild(chest)
        
//        addChild(scenecamera)
//        createRoom2()
//        addChild(room)
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
            item?.action(player: firstBody.node as? PlayableCharacter ?? PlayableCharacter())
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
        //PER FAR APPARIRE LE STANZE
        if firstBody.node?.name == "player" && secondBody.node?.name == "door"{
            let door = secondBody.node as? Door
            door?.open()
            door?.parent?.alpha = 1
        }
        
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "nextLevel"{
            let oggetto = secondBody.node as? NextFloor
            oggetto?.loadScene(self.view!)
        }
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        calcDelta(currentTime: currentTime)
        indicatore.etichetta.text = "x \(indicatore.number)"
      

        
        scenecamera.position = player.position

        
        
        
//        print(player.position)
//        print(player.getFocusState())
//        print(player.getActionState())
//        print(player.getStatus().nearBush)
//        print(player.name)
//        print(boots.name)
//        print(player.getSpeed())
        

    }
    
    
    
    
}