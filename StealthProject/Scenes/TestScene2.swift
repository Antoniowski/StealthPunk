//
//  TestScene2.swift
//  StealthProject
//
//  Created by Salvatore Manna on 04/05/22.
//

import UIKit
import GameplayKit


class TestScene2: SKScene, PlayableScene, SKPhysicsContactDelegate {
    var initGuards = false
    var delta: TimeInterval = 0.0
    var lastUpdate: TimeInterval?
    
    var player: PlayableCharacter = Human(texture: SKTexture(imageNamed: "boyFront"), color: .clear, size: CGSize(width: 35, height: 70), noise: 2, speed: 3, strenght: 3)
    
    var luce: SKLightNode = SKLightNode()
    
    var scenecamera = SKCameraNode()
    
    var inputVector: CGVector = CGVector.zero
    var rollVector: CGVector = CGVector.init(dx: 1, dy: 0)
    var velocity: CGVector = CGVector.zero
    
    var ACCELLERATION: Double = 10
    var MAX_SPEED: Double = 50
    var FRICTION: Double = 20

    
    var indicatore = Counter()
    var timer = TimeCounter()
    
    var index = 0

    var oggetti: [SKNode] = []
    var nemici: [SKNode] = []
    
    var oggetto = Collectible(type: .COIN)
    
    
    
    
    override func didMove(to view: SKView) {
        arrayOfGuards.removeAll()
        
        //Resetto le variabili di sconfitta e del tempo
        loseFlag = false
        MINUTE = 10
        SECONDS = 0
        
        
        myGameController.connectController()
        self.backgroundColor = .black
        physicsWorld.contactDelegate = self
        camera = scenecamera
        
        luce.position = .init(x: 2000, y: 2000)
        
        
        indicatore.position.x = player.position.x - 100
        indicatore.position.y = player.position.y + frame.height/3.5 + 90
        
        timer.position.x = player.position.x - frame.width*0.45
        timer.position.y = player.position.y + frame.height * 0.35
        timer.setScale(0.5)
        
        
        scenecamera.addChild(indicatore)
        scenecamera.addChild(timer)

        scenecamera.position = player.position
        scenecamera.setScale(1)
        
        let f = Floor(self, floorType: .FIRST_FLOOR)
        
        runCounter += 1

        
        luce.ambientColor = .init(red: 0.624, green: 0.624, blue: 0.914, alpha: 0.40) // PER LE PARTI SCURE - GIARDINO
//        luce.ambientColor = .init(red: 0.6, green: 0.6, blue: 0.75, alpha: 0.15)

        luce.falloff = 10
        luce.lightColor = .init(white: 0, alpha: 0.1)
        luce.zPosition = 50
        player.position = f.spawn
        player.zPosition = 900
        
        print("POSIZIONE GIOCATORE: \(player.position)")
        
        addChild(player)

        addChild(luce)

        addChild(scenecamera)
        enumerateChildNodes(withName: "ROOM/dynamicObject"){oggetto, _ in
            self.oggetti.append(oggetto)
        }

        oggetto.position = player.position
        oggetto.position.y -= 200
        addChild(oggetto)
        
       Timer(scene: self)
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
                indicatore.run(.moveTo(y: UIScreen.main.bounds.height*0.29, duration: 0.5), completion: {
                    self.indicatore.run(.sequence([.wait(forDuration: 1.5), .moveTo(y: UIScreen.main.bounds.height*0.55, duration: 0.5)]))
                })
                item?.action(contatore: indicatore)
            }else {
                let box = ObjectBox(item!)
                box.position.x = -125
                box.position.y = UIScreen.main.bounds.height*0.55
                scenecamera.addChild(box)
                box.run(.moveTo(y: UIScreen.main.bounds.height*0.29 , duration: 0.5), completion: {
                    box.run(.sequence([.wait(forDuration: 2.5), .moveTo(y: UIScreen.main.bounds.height*0.55, duration: 0.5)]), completion: {
                        box.removeFromParent()
                    })
                })
            }
            secondBody.node?.removeFromParent()
            
        }
        
        //PER FAR APPARIRE LE STANZE
        if firstBody.node?.name == "player" && secondBody.node?.name == "door"{
            let door = secondBody.node as? Door
            let cifra = Int.random(in: 0...2)
            if(cifra == 0){
            door?.run(.run {
                music.starsSound(filenamed: music.door)
            })
            }
            if(cifra == 1){
                music.starsSound(filenamed: music.door2)
            }
//            if(cifra == 2){
//                music.starsSound(filenamed: music.doorTaverna)
//            }
            door?.open()
            door?.parent?.alpha = 1
        }
        
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "nextLevel"{
            let oggetto = secondBody.node as? NextFloor
            oggetto?.loadScene(self.view!, Floor: .FIRST_FLOOR)
        }
    }
    
    
    
    func updateTimerLabel(){
        timer.etichetta.text = String(format: "%d:%d", MINUTE, SECONDS)
        if SECONDS == 60{
            timer.etichetta.text = String(format: "%d:00", MINUTE)
        }else if SECONDS < 10{
            timer.etichetta.text = String(format: "%d:0%d", MINUTE, SECONDS)

        }
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
        loseFunc(scene: self)
        
        calcDelta(currentTime: currentTime)
        updateTimerLabel()
        indicatore.etichetta.text = "x \(indicatore.number)"
        playerEssential(scene: self, nemici: nemici, oggetti: oggetti)
        playerMovement(player: player as SKSpriteNode, velocity: velocity)

        
        scenecamera.position = player.position

        if(!initGuards){
            initGuards = true
            for guardia in arrayOfGuards{
                nemici.append(guardia)
            }
        }
        
        for guardia in arrayOfGuards{
            visionCone(entity: guardia, scene: self)
            guardia.checkState(point: player.position, deltaTime: delta, scene: self)
        }

    }
    
    
    
    
}
