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
    
    private var audio: SKLabelNode = SKLabelNode()
    private var effect: SKLabelNode = SKLabelNode()
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
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
        start.position = .init(x: frame.width*0.74, y: frame.height*0.27)
        start.run(.repeatForever(.sequence([.fadeAlpha(to: 0.4, duration: 0.5), .fadeAlpha(to: 1, duration: 0.5)])))

        option.fontSize = 28
        option.text = "SETTINGS"
        option.name = "settings"
        option.fontName = "OldNewspaperTypes"
        option.zPosition = 2
        option.fontColor = .init(white: 0, alpha: 0.8)
        option.position = .init(x: frame.width*0.16, y: frame.height*0.67)
        option.run(.repeatForever(.sequence([.scale(to: 0.9, duration: 2), .scale(to: 1, duration: 2)])))
        
//        option.run(.repeatForever(.sequence([.fadeAlpha(to: 0.4, duration: 0.5), .fadeAlpha(to: 1, duration: 0.5)])))

        credits.fontSize = 28
        credits.text = "CREDITS"
        credits.name = "credits"
        credits.fontName = "OldNewspaperTypes"
        credits.zPosition = 2
        credits.fontColor = .init(white: 0, alpha: 0.8)
        credits.position = .init(x: frame.width*0.845, y: frame.height*0.67)
        credits.run(.repeatForever(.sequence([.scale(to: 0.9, duration: 2), .scale(to: 1, duration: 2)])))

        
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

        if touchedNode.name != "credits" && touchedNode.name != "settings" && touchedNode.name != "menu"{
            let lobby = LobbyScene(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            view?.presentScene(lobby, transition: .fade(withDuration: 3))
        }
        
        if touchedNode.name == "settings"{
            self.run(.fadeOut(withDuration: 1), completion: {
                self.subtitle.text = "SETTINGS"
                self.credits.text = "Main menu"
                self.credits.name = "menu"
                self.option.text = ""
                self.option.name = ""
                self.start.removeFromParent()
                self.run(.fadeIn(withDuration: 1))
            })
        }
        
        if touchedNode.name == "menu"{
            self.run(.fadeOut(withDuration: 1), completion: {
                self.subtitle.text = "MAIN MENU"
                self.credits.text = "CREDITS"
                self.credits.name = "credits"
                self.option.text = "SETTINGS"
                self.option.name = "settings"
                self.addChild(self.start)
                self.run(.fadeIn(withDuration: 1))
            })
        }
        
        if touchedNode.name == "credits"{
            self.run(.fadeOut(withDuration: 1), completion: {
                self.subtitle.text = "CREDITS"
                self.credits.text = "Main menu"
                self.credits.name = "menu"
                self.option.text = ""
                self.option.name = ""
                self.start.removeFromParent()
                self.run(.fadeIn(withDuration: 1))
            })
        }
    }
}
