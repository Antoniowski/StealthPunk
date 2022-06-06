//
//  Settings.swift
//  StealthProject
//
//  Created by Martina Ottaviano on 06/06/22.
//

import Foundation
import SpriteKit

class SettingsPage: SKScene{
    private var backgroundImage: SKSpriteNode = SKSpriteNode(imageNamed: "Menu_Template")
    private var title: SKLabelNode = SKLabelNode(fontNamed: "OldLondon")
    private var subtitle: SKLabelNode = SKLabelNode()
    private var option: SKLabelNode = SKLabelNode()
    private var image: SKSpriteNode = SKSpriteNode(imageNamed: "")
    private var audio: SKLabelNode = SKLabelNode()
    private var effect: SKLabelNode = SKLabelNode()
    
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
        subtitle.text = "SETTINGS"
        subtitle.position = .init(x: frame.width*0.5, y: frame.height*0.67)
        subtitle.zPosition = 2
        subtitle.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        option.fontSize = 24
        option.text = "Main Menu"
        option.name = "menu"
        option.fontName = "OldNewspaperTypes"
        option.zPosition = 2
        option.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        option.position = .init(x: frame.width*0.845, y: frame.height*0.67)
        option.run(.repeatForever(.sequence([.scale(to: 0.9, duration: 2), .scale(to: 1, duration: 2)])))
        
//        option.run(.repeatForever(.sequence([.fadeAlpha(to: 0.4, duration: 0.5), .fadeAlpha(to: 1, duration: 0.5)])))

        
        image.position = .init(x: frame.width*0.295, y: frame.height*0.33)
        image.xScale = 1.27
        image.yScale =  1.27
        image.zPosition = 3
        
        addChild(backgroundImage)
        addChild(title)
        addChild(subtitle)
        addChild(option)
        addChild(image)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }

        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)

//        if touchedNode.name != "credits" && touchedNode.name != "settings" && touchedNode.name != "menu" && subtitle.text == "MAIN MENU"{
//            let lobby = LobbyScene(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//            view?.presentScene(lobby, transition: .fade(withDuration: 3))
//        }
        
        if touchedNode.name == "settings"{
            touchedNode.alpha = 0.5
        }
        
        if touchedNode.name == "menu"{
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
        
//        if touchedNode.name == "settings"{
//            touchedNode.alpha = 1
//            self.run(.playSoundFileNamed("pagina", waitForCompletion: true))
//            self.run(.fadeOut(withDuration: 1), completion: {
//                self.subtitle.text = "SETTINGS"
//                self.option.name = ""
//                self.run(.fadeIn(withDuration: 1))
//            })
//        }
        
        if touchedNode.name == "menu"{
            touchedNode.alpha = 1
            self.run(.playSoundFileNamed("pagina", waitForCompletion: true))
            self.run(.fadeOut(withDuration: 1), completion: {
                self.option.text = "Main Menu"
                self.option.name = "menu"
                self.run(.fadeIn(withDuration: 1))
                
            })
        }
        
//        if touchedNode.name == "credits"{
//            touchedNode.alpha = 1
//            self.run(.playSoundFileNamed("pagina", waitForCompletion: true))
//            let credit = Credits(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
//            view?.presentScene(credit, transition: .fade(withDuration: 2))
//        }
    }
}

