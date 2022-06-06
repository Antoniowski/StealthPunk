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
    private var image: SKSpriteNode = SKSpriteNode(imageNamed: "menuImage")
    private var audio: SKLabelNode = SKLabelNode()
    private var effect: SKLabelNode = SKLabelNode()
    private var muteMusic: SKSpriteNode = SKSpriteNode()
    private var muteEffect: SKSpriteNode = SKSpriteNode()
    
    private var musicL: SKShapeNode = SKShapeNode()
    private var musicR: SKShapeNode = SKShapeNode()
    private var effectL: SKShapeNode = SKShapeNode()
    private var effectR: SKShapeNode = SKShapeNode()
    
    private var M01: SKShapeNode = SKShapeNode(rectOf: .init(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.05))
    private var M02: SKShapeNode = SKShapeNode()
    private var M03: SKShapeNode = SKShapeNode()
    private var M04: SKShapeNode = SKShapeNode()
    private var M05: SKShapeNode = SKShapeNode()
    
    private var E01: SKShapeNode = SKShapeNode()
    private var E02: SKShapeNode = SKShapeNode()
    private var E03: SKShapeNode = SKShapeNode()
    private var E04: SKShapeNode = SKShapeNode()
    private var E05: SKShapeNode = SKShapeNode()



    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        backgroundImage.size = .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundImage.position = .init(x: frame.width/2, y: frame.height/2)
        
        title.fontName = "OldLondon"
        title.fontSize = 70
        title.text = "StealthPunk"
        title.position = .init(x: frame.width*0.5, y: frame.height*0.79)
        title.zPosition = 2
        title.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        subtitle.fontName = "OldNewspaperTypes"
        subtitle.fontSize = 25
        subtitle.text = "MAIN MENU"
        subtitle.position = .init(x: frame.width*0.5, y: frame.height*0.67)
        subtitle.zPosition = 2
        subtitle.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        start.fontSize = 50
        start.text = "Tap to Start"
        start.name = "start"
        start.fontName = "OldNewspaperTypes"
        start.zPosition = 2
        start.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        start.position = .init(x: frame.width*0.74, y: frame.height*0.25)
        start.run(.repeatForever(.sequence([.fadeAlpha(to: 0.4, duration: 0.5), .fadeAlpha(to: 1, duration: 0.5)])))

        option.fontSize = 24
        option.text = "Settings"
        option.name = "settings"
        option.fontName = "OldNewspaperTypes"
        option.zPosition = 2
        option.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        option.position = .init(x: frame.width*0.16, y: frame.height*0.67)
        option.run(.repeatForever(.sequence([.scale(to: 0.9, duration: 2), .scale(to: 1, duration: 2)])))
        
//        option.run(.repeatForever(.sequence([.fadeAlpha(to: 0.4, duration: 0.5), .fadeAlpha(to: 1, duration: 0.5)])))

        credits.fontSize = 24
        credits.text = "Credits"
        credits.name = "credits"
        credits.fontName = "OldNewspaperTypes"
        credits.zPosition = 2
        credits.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        credits.position = .init(x: frame.width*0.845, y: frame.height*0.67)
        credits.run(.repeatForever(.sequence([.scale(to: 0.9, duration: 2), .scale(to: 1, duration: 2)])))
        
        
        musicLabel.fontName = "OldNewspaperTypes"
        musicLabel.fontSize = 24
        musicLabel.text = "Music"
        musicLabel.zPosition = 3
        musicLabel.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        musicLabel.position = .init(x: frame.width*0.75, y: frame.height*0.45)
        
        M01.zPosition = 2
        M01.position = .init(x: frame.width*0.75, y: frame.height*0.4)
        M01.fillColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        M01.strokeColor = .clear
        
        
        
        effect.fontName = "OldNewspaperTypes"
        effect.fontSize = 24
        effect.text = "Sound effects"
        effect.zPosition = 2
        effect.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        effect.position = .init(x: frame.width*0.75, y: frame.height*0.25)
        

        image.position = .init(x: frame.width*0.295, y: frame.height*0.33)
        image.xScale = 1.27
        image.yScale =  1.27
        image.zPosition = 3
        
        addChild(backgroundImage)
        addChild(title)
        addChild(subtitle)
        addChild(start)
        addChild(option)
        addChild(credits)
        addChild(image)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }

        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)

        if touchedNode.name != "credits" && touchedNode.name != "settings" && touchedNode.name != "menu" && subtitle.text == "MAIN MENU"{
            let lobby = LobbyScene(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            view?.presentScene(lobby, transition: .fade(withDuration: 3))
        }
        
        if touchedNode.name == "settings"{
            touchedNode.alpha = 0.5
        }
        
        if touchedNode.name == "credits"{
            touchedNode.alpha = 0.5
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }

        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        if touchedNode.name == "settings"{
            touchedNode.alpha = 1
            self.run(.playSoundFileNamed("pagina", waitForCompletion: true))
            let credit = SettingsPage(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            view?.presentScene(credit, transition: .fade(withDuration: 2))
        }
        
        if touchedNode.name == "credits"{
            touchedNode.alpha = 1
            self.run(.playSoundFileNamed("pagina", waitForCompletion: true))
            let credit = Credits(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            view?.presentScene(credit, transition: .fade(withDuration: 2))
        }
            
            if touchedNode.name == "options"{
                touchedNode.alpha = 1
                self.run(.playSoundFileNamed("pagina", waitForCompletion: true))
                let credit = SettingsPage(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
                view?.presentScene(credit, transition: .fade(withDuration: 2))
        }
    }
}
