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
    
    
    private let ambientLight = SKLightNode()
    private var lightArray: [LuceTaverna] = []
    
    private var startGame: Bool = false
    private let stanza = Room(.LOBBY, startingPosition: .zero, floor: .SECOND_FLOOE)
    private var sceneCamera: SKCameraNode = SKCameraNode()
    
    private var oggetti: [SKNode] = []
    private var nemici: [SKNode] = []
    
    
    override func didMove(to view: SKView) {
        myGameController.setUpGameController()
        self.backgroundColor = .black
        physicsWorld.contactDelegate = self
        
        indicatore.position.x = player.position.x - 100
        indicatore.position.y = player.position.y + frame.height/3.5 + 90
        sceneCamera.addChild(indicatore)

        
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
        playerMovement(player: player as SKSpriteNode, velocity: velocity)
        sceneCamera.position = player.position
        startGameFunction()
        
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
    
    
    func startGameFunction(){
        if self.startGame == true{
            self.startGame = false
            let scene = newMuseum.firstFloor
            view?.presentScene(scene)
        }
    }
}
