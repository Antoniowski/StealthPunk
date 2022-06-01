//
//  GameOverMenu.swift
//  StealthProject
//
//  Created by Guendalina De Laurentis on 31/05/22.
//

import Foundation
import SpriteKit

class GameOverMenu: SKScene{
    private var backgroundImage: SKSpriteNode = SKSpriteNode(imageNamed: "Menu_Template")
    private var title: SKLabelNode = SKLabelNode(fontNamed: "OldLondon")
    private var subtitle: SKLabelNode = SKLabelNode()
    private var breakingNews: SKLabelNode = SKLabelNode()
    private var timeCounter: SKLabelNode = SKLabelNode()
    private var gearCounter: SKLabelNode = SKLabelNode()
    private var label: SKLabelNode = SKLabelNode()
    private var lobby: SKLabelNode = SKLabelNode()
    private var mainmenu: SKLabelNode = SKLabelNode()
    
    override func didMove(to view: SKView) {
        backgroundImage.size = .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundImage.position = .init(x: frame.width/2, y: frame.height/2)
        
        title.fontName = "OldLondon"
        title.fontSize = 70
        title.text = "StealthPunk"
        title.position = .init(x: frame.width*0.5, y: frame.height*0.8)
        title.zPosition = 2
        title.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        subtitle.fontName = "OldNewspaperTypes"
        subtitle.fontSize = 25
        subtitle.text = "GAME OVER"
        subtitle.position = .init(x: frame.width*0.5, y: frame.height*0.67)
        subtitle.zPosition = 2
        subtitle.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        breakingNews.fontSize = 40
        breakingNews.text = "Breaking News"
        breakingNews.fontName = "OldNewspaperTypes"
        breakingNews.zPosition = 2
        breakingNews.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        breakingNews.position = .init(x: frame.width*0.74, y: frame.height*0.5)

        lobby.fontSize = 24
        lobby.text = "Back to Lobby"
        lobby.fontName = "OldNewspaperTypes"
        lobby.name = "lobby"
        lobby.zPosition = 2
        lobby.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        lobby.position = .init(x: frame.width*0.155, y: frame.height*0.67)
        
//        option.run(.repeatForever(.sequence([.fadeAlpha(to: 0.4, duration: 0.5), .fadeAlpha(to: 1, duration: 0.5)])))

        mainmenu.fontSize = 24
        mainmenu.text = "Main menu"
        mainmenu.fontName = "OldNewspaperTypes"
        mainmenu.name = "mainmenu"
        mainmenu.zPosition = 2
        mainmenu.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        mainmenu.position = .init(x: frame.width*0.845, y: frame.height*0.67)
        
        label.fontSize = 25
        label.fontName = "OldNewspaperTypes"
//        label.numberOfLines = -1
        label.preferredMaxLayoutWidth = size.width*0.9
        label.numberOfLines = 0
        label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        label.text = "Crazy man tried to steal \nCrown Jewels."
        label.position = .init(x: frame.width*0.74, y: frame.height*0.3)
        label.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        timeCounter.fontSize = 25
        timeCounter.fontName = "OldNewspaperTypes"
        timeCounter.preferredMaxLayoutWidth = size.width*0.9
        timeCounter.numberOfLines = 0
        timeCounter.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        timeCounter.text = "Time: ..... \(MINUTE): \(SECONDS)"
        timeCounter.position = .init(x: frame.width*0.74, y: frame.height*0.2)
        timeCounter.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        gearCounter.fontSize = 25
        gearCounter.fontName = "OldNewspaperTypes"
        gearCounter.preferredMaxLayoutWidth = size.width*0.9
        gearCounter.numberOfLines = 0
        gearCounter.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        gearCounter.text = "Gear: .....(mettere counter)"
        gearCounter.position = .init(x: frame.width*0.74, y: frame.height*0.1)
        gearCounter.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        addChild(backgroundImage)
        addChild(title)
        addChild(subtitle)
        addChild(breakingNews)
        addChild(mainmenu)
        addChild(lobby)
        addChild((timeCounter))
        addChild(gearCounter)
        addChild(label)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }

        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)

        if touchedNode.name == "lobby"{
            self.run(.playSoundFileNamed("pagina", waitForCompletion: true))
            let lobby = LobbyScene(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            view?.presentScene(lobby, transition: .fade(withDuration: 3))
        }
        if touchedNode.name == "mainmenu"{
            self.run(.playSoundFileNamed("pagina", waitForCompletion: true))
            let go = MainMenu(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            view?.presentScene(go, transition: .fade(withDuration: 3))
    }
}
}