//
//  MainMenu.swift
//  StealthProject
//
//  Created by Antonio Romano on 31/05/22.
//

import Foundation
import SpriteKit

class MainMenu: SKScene{
    private var backgroundImage: SKSpriteNode = SKSpriteNode(imageNamed: "Menu_Template")
    private var title: SKLabelNode = SKLabelNode(fontNamed: "OldLondon")
    private var subtitle: SKLabelNode = SKLabelNode()
    private var start: SKLabelNode = SKLabelNode()
    private var option: SKLabelNode = SKLabelNode()
    private var credits: SKLabelNode = SKLabelNode()
    
    override func didMove(to view: SKView) {
        backgroundImage.size = .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundImage.position = .init(x: frame.width/2, y: frame.height/2)
        
        title.fontName = "OldLondon"
        title.fontSize = 50
        title.text = "StealthPunk"
        title.position = .init(x: frame.width*0.5, y: frame.height*0.80)
        title.zPosition = 2
        title.fontColor = .init(white: 0, alpha: 0.8)
        
        subtitle.fontName = "OldNewspaperTypes"
        subtitle.fontSize = 28
        subtitle.text = "MAIN MENU"
        subtitle.position = .init(x: frame.width*0.5, y: frame.height*0.67)
        subtitle.zPosition = 2
        subtitle.fontColor = .init(white: 0, alpha: 0.8)
        
        start.fontSize = 60
        start.text = "Tap to Start"
        start.name = "start"
        start.fontName = "OldLondon"
        start.zPosition = 2
        start.fontColor = .init(white: 0, alpha: 0.8)
        start.position = .init(x: frame.width*0.74, y: frame.height*0.37)
        start.run(.repeatForever(.sequence([.fadeAlpha(to: 0.4, duration: 0.5), .fadeAlpha(to: 1, duration: 0.5)])))

        option.fontSize = 28
        option.text = "SETTINGS"
        option.fontName = "OldNewspaperTypes"
        option.zPosition = 2
        option.fontColor = .init(white: 0, alpha: 0.8)
        option.position = .init(x: frame.width*0.16, y: frame.height*0.67)
        
//        option.run(.repeatForever(.sequence([.fadeAlpha(to: 0.4, duration: 0.5), .fadeAlpha(to: 1, duration: 0.5)])))

        credits.fontSize = 28
        credits.text = "CREDITS"
        credits.fontName = "OldNewspaperTypes"
        credits.zPosition = 2
        credits.fontColor = .init(white: 0, alpha: 0.8)
        credits.position = .init(x: frame.width*0.845, y: frame.height*0.67)
        
        addChild(backgroundImage)
        addChild(title)
        addChild(subtitle)
        addChild(start)
        addChild(option)
        addChild(credits)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }

        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)

        if touchedNode.name == "start"{
            let lobby = LobbyScene(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            view?.presentScene(lobby, transition: .fade(withDuration: 3))
        }
    }
}
