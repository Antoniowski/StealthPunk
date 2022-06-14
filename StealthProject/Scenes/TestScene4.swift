//
//  TestScene2.swift
//  StealthProject
//
//  Created by Salvatore Manna on 04/05/22.
//

import UIKit
import GameplayKit


class TestScene4: SKScene, PlayableScene, SKPhysicsContactDelegate {
    var initGuards = false
    var delta: TimeInterval = 0.0
    var lastUpdate: TimeInterval?
    
    var player: PlayableCharacter = Human()
    
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
    
    
    
    
    override func didMove(to view: SKView) {
        if(globalPlayerSpeed != 0){
            player.setSpeed(newSpeed: globalPlayerSpeed)
        }
        if(globalPlayerStrength != 0){
            player.setStrenght(newStrenght: globalPlayerStrength)
        }
        if(globalPlayerNoise != 0){
            player.setNoise(newNoise: globalPlayerNoise)
        }

        print("Speed: \(player.getSpeed()) + Noise: \(player.getNoise()) + Strength: \(player.getStrenght())")
        
        myGameController.connectController()
        self.backgroundColor = .black
        physicsWorld.contactDelegate = self
        camera = scenecamera
        
        finale = false

        
        luce.position = .init(x: 2000, y: 2000)
        
        
        indicatore.position.x = player.position.x - 100
        indicatore.position.y = player.position.y + frame.height/3.5 + 90
        
        timer.position.x = player.position.x - frame.width*0.45
        timer.position.y = player.position.y + frame.height * 0.35
        timer.setScale(0.5)
        
        
        scenecamera.addChild(indicatore)
        scenecamera.addChild(timer)

        scenecamera.position = player.position
//        scenecamera.setScale(10)
        
        arrayOfGuards.removeAll()
        let f = Floor(self, floorType: .LAST_FLOOR)

        
        luce.ambientColor = .init(red: 0.624, green: 0.624, blue: 0.914, alpha: 0.40) // PER LE PARTI SCURE - GIARDINO
//        luce.ambientColor = .init(red: 0.6, green: 0.6, blue: 0.75, alpha: 0.15)

        luce.falloff = 10
        luce.lightColor = .init(white: 0, alpha: 0.1)
        luce.zPosition = 50
        player.position = f.spawn
        player.zPosition = 900
        
        addChild(player)

        addChild(luce)

        addChild(scenecamera)
        enumerateChildNodes(withName: "ROOM/dynamicObject"){oggetto, _ in
            self.oggetti.append(oggetto)
        }
        
        if(ammo == 0){
            timer.proiettile1.alpha = 0.5
            timer.proiettile1.alpha = 0.5
        } else if (ammo == 1){
            timer.proiettile1.alpha = 0.5
        }

       Timer(scene: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        arrayOfTouches.removeAll()
        arrayOfTouches.append(touchLocation)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            arrayOfTouches.append(touch.location(in: self))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        enumerateChildNodes(withName: "BallTrajectory"){
//            node, _ in
//            node.removeFromParent()
//        }
//        for item in arrayOfTouches{
//            let ball = SKShapeNode(circleOfRadius: 5)
//            ball.zPosition = 950
//            ball.position = item
//            ball.strokeColor = .red
//            ball.fillColor = .red
//            ball.name = "BallTrajectory"
//            addChild(ball)
//        }
        shootProjectile(player: player, scene: self, timer: timer)
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
        } else if (contact.bodyA.node?.name != "player" && contact.bodyB.node?.name != "player" ){
            if contact.bodyA.node?.name == "projectile"{
                firstBody = contact.bodyA
                secondBody = contact.bodyB
            }else if contact.bodyB.node?.name == "projectile"{
                firstBody = contact.bodyB
                secondBody = contact.bodyA
            }
        }
        
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "collectible"{
            let item = secondBody.node as? Collectible
            item?.action(player: firstBody.node as? PlayableCharacter ?? PlayableCharacter(), scene: self)
            
            
            
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
        
        
//        if firstBody.node?.name == "player" && secondBody.node?.name == "nextLevel"{
//            let oggetto = secondBody.node as? NextFloor
//            oggetto?.loadScene(self.view!, Floor: .FIRST_FLOOR)
//        }
        
        if firstBody.node?.name == "projectile" && secondBody.node?.physicsBody?.categoryBitMask == ColliderType.WALL.rawValue {
            firstBody.node?.removeFromParent()
        }
        if firstBody.node?.name == "projectile" && secondBody.node?.physicsBody?.categoryBitMask == ColliderType.ENEMY.rawValue {
            firstBody.node?.removeFromParent()
            let corpoGuardia: Guard = secondBody.node as! Guard
            corpoGuardia.setDead(true)
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
            visionCone(entity: guardia, scene: self, timer: timer)
            guardia.checkState(point: player.position, deltaTime: delta, scene: self)
        }

    }
    
    
    
    
}

