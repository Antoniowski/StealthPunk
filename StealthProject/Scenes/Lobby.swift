//
//  Lobby.swift
//  StealthProject
//
//  Created by Antonio Romano on 19/05/22.
//

import Foundation
import SpriteKit

class LobbyScene: SKScene{
    private var label: SKLabelNode = SKLabelNode()
    private let stanza = Room(.LOBBY, startingPosition: .zero)
    private var sceneCamera: SKCameraNode = SKCameraNode()
    
    override func didMove(to view: SKView) {
        myGameController.setUpGameController()

        addChild(stanza)
        camera = sceneCamera
        label.text = "Press to continue"
        label.fontName = "Victorian Parlor Vintage Alternate_free"
        label.fontSize = UIScreen.main.bounds.height/5
        label.position = CGPoint(x: 0, y: 0)
        label.zPosition = 1000
        label.run(.repeatForever(.sequence([.fadeOut(withDuration: 1), .fadeIn(withDuration: 1)])))
        sceneCamera.addChild(label)
        sceneCamera.setScale(4)
        sceneCamera.position = CGPoint(x: 350, y: -650)
        addChild(sceneCamera)

    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myGameController.disconnectController()
        let scene = TestScene2(size: self.size)
        view?.presentScene(scene)
    }
}
