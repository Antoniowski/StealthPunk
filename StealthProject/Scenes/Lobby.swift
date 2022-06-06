//
//  Lobby.swift
//  StealthProject
//
//  Created by Antonio Romano on 19/05/22.
//

import Foundation
import SpriteKit
import SwiftUI

class LobbyScene: SKScene, PlayableScene{
    //Variabile che tiene conto se è la prima volta che avvii la partita e che vede se farti vedere o meno il tutorial
    @AppStorage("firstTimePlayingAgainstTheClock") var firstTimePlayingAgainstTheClock: Bool = true
    
    var gears: Int = 0
    
    var delta: TimeInterval = 0
    var lastUpdate: TimeInterval?
    
    var player: PlayableCharacter = Human()
    
    var indicatore: Counter = Counter()
    
    var MAX_SPEED: Double =  50
    var ACCELLERATION: Double = 10
    var FRICTION: Double = 10
    
    var inputVector: CGVector = .zero
    var rollVector: CGVector = .init(dx: 1, dy: 0)
    var velocity: CGVector  = .zero
    var counter2 = Counter2()
    
    var player2: Bool = false
    var player3: Bool = false
    var player4: Bool = false
    

    private let ambientLight = SKLightNode()
    private var lightArray: [LuceTaverna] = []
    
    private var startGame: Bool = false
    private let stanza = Room(.LOBBY, startingPosition: .zero, floor: .SECOND_FLOOE)
    private var sceneCamera: SKCameraNode = SKCameraNode()
    
    private var oggetti: [SKNode] = []
    private var nemici: [SKNode] = []
    
    
    override func didMove(to view: SKView) {
        self.name = "Lobby"
        currentScene = self
        print("Scena corrente: \(currentScene)")
        
        if firstTimePlayingAgainstTheClock == true{
            storage.set(0, forKey: "gears")
        }
        
        gears = storage.value(forKey: "gears") as! Int
        
        myGameController.setUpGameController()
        self.backgroundColor = .black
        physicsWorld.contactDelegate = self
        
        indicatore.position.x = player.position.x - 100
        indicatore.position.y = player.position.y + frame.height/3.5 + 90
        sceneCamera.addChild(indicatore)
        
        
        counter2.position.x = player.position.x
        counter2.position.y = player.position.y - frame.height/3.5 - 175
        sceneCamera.addChild(counter2)
        ambientLight.ambientColor = .init(red: 0.6, green: 0.6, blue: 0.75, alpha: 0.5)
        ambientLight.position = .init(x: 2000, y: 2000)
        ambientLight.falloff = 10
        ambientLight.categoryBitMask = 1|2
        
        addChild(ambientLight)
        
        addChild(stanza)
        camera = sceneCamera
        sceneCamera.setScale(1)
        player.position.x += Double(stanza.getRighe()) * Double(blocco/2)
        player.position.y -= Double(stanza.getColonne()) * Double(blocco/2)
        player.zPosition = 10
        addChild(player)
        addChild(sceneCamera)
        
        enumerateChildNodes(withName: "ROOM/light"){object, _ in
            let luce = object as? LuceTaverna
            self.lightArray.append(luce ?? LuceTaverna(lightBitmask: 1|2))
            
        }
        
        enumerateChildNodes(withName: "ROOM/dynamicObject"){oggetto, _ in
            self.oggetti.append(oggetto)
        }

    }
    
    override func update(_ currentTime: TimeInterval) {
        calcDelta(currentTime: currentTime)
        indicatore.etichetta.text = "x \(indicatore.number)"
        playerEssential(scene: self, nemici: nemici, oggetti: oggetti)
        if sceneCamera.childNode(withName: "cornice") != nil{
            if (sceneCamera.childNode(withName: "cornice") as? Inventory)?.statoInventario == false{
                playerMovement(player: player as SKSpriteNode, velocity: velocity)
            }
        }else{
            playerMovement(player: player as SKSpriteNode, velocity: velocity)
        }
        
        sceneCamera.position = player.position
        startGameFunction()
        showCounter()
        
        for x in 0..<lightArray.count{
            if lightArray[x].animationBool == false{
                lightArray[x].light.falloff -= 0.002
                lightArray[x].light.lightColor = lightArray[x].light.lightColor.withAlphaComponent(lightArray[x].light.lightColor.rgba.alpha + 0.0005)
                if lightArray[x].light.falloff <= 0.5{
                    lightArray[x].animationBool = true
                }
            }else{
                lightArray[x].light.falloff += 0.002
                lightArray[x].light.lightColor = lightArray[x].light.lightColor.withAlphaComponent(lightArray[x].light.lightColor.rgba.alpha - 0.0005)
                if lightArray[x].light.falloff >= 0.6{
                    lightArray[x].animationBool = false
                }
            }
            
        }
        
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
        
        if (firstBody.node?.name == "player" && secondBody.node?.name == "player2") {
            player2 = true
        }
        if (firstBody.node?.name == "player" && secondBody.node?.name == "player3") {
            player3 = true
        }
        if (firstBody.node?.name == "player" && secondBody.node?.name == "player4") {
            player4 = true
        }
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "collectible"{
            let item = secondBody.node as? Collectible
            item?.action(player: firstBody.node as? PlayableCharacter ?? PlayableCharacter())
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if contact.bodyA.node?.name == "player"{
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }else if contact.bodyB.node?.name == "player"{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if (firstBody.node?.name == "player" && secondBody.node?.name == "player2") {
            player2 = false
        }
        if (firstBody.node?.name == "player" && secondBody.node?.name == "player3") {
            player3 = false
        }
        if (firstBody.node?.name == "player" && secondBody.node?.name == "player4") {
            player4 = false
        }
        
        
    }
    
    func showCounter() {
        if player2 == true {
            counter2.nome.text = "Vanessa / locked"
            counter2.forza.text = "strenght: 2/5"
            counter2.velocita.text = "speed: 3/5"
            counter2.rumore.text = "noise: 1/5"
            counter2.run(.moveTo(y: -frame.height/3.5 - 15, duration: 0.5), completion: {
                self.counter2.moveBox = false
            })
        }
        else if (player3 == true){
            counter2.moveBox = true
            counter2.nome.text = "Oswald / locked"
            counter2.forza.text = "strenght: 5/5"
            counter2.velocita.text = "speed: 2/5"
            counter2.rumore.text = "noise: 4/5"
            counter2.run(.moveTo(y: -frame.height/3.5 - 15, duration: 0.5), completion: {
                self.counter2.moveBox = false
            })
        }
        else if (player4 == true){
            counter2.nome.text = "??? / locked"
            counter2.forza.text = "strenght: 4/5"
            counter2.velocita.text = "speed: 3/5"
            counter2.rumore.text = "noise: 2/5"
            counter2.run(.moveTo(y: -frame.height/3.5 - 15, duration: 0.5), completion: {
                self.counter2.moveBox = false
            })
            
        }
        else{
            if (counter2.moveBox == false){
            run(.sequence([.wait(forDuration: 0.5), .run {
               
                self.counter2.run(.moveTo(y: -self.frame.height/3.5 - 175, duration: 0.5))
                self.counter2.moveBox = true
            }]))
            }
        }
    }
    
    func startGameFunction(){
        if self.startGame == true{
            self.startGame = false
            let scene = newMuseum.firstFloor
            view?.presentScene(scene)
        }
    }
}
