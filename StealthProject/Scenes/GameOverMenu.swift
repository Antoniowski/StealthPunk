//
//  GameOverMenu.swift
//  StealthProject
//
//  Created by Guendalina De Laurentis on 31/05/22.
//

import Foundation
import SpriteKit

class GameOverMenu: SKScene{
    var number: Int = 0
    private var backgroundImage: SKSpriteNode = SKSpriteNode(imageNamed: "Menu_Template")
    private var title: SKLabelNode = SKLabelNode(fontNamed: "OldLondon")
    private var subtitle: SKLabelNode = SKLabelNode()
    private var breakingNews: SKLabelNode = SKLabelNode()
    private var timeCounter: SKLabelNode = SKLabelNode()
    private var gearCounter: SKLabelNode = SKLabelNode()
    private var label: SKLabelNode = SKLabelNode()
    private var lobby: SKLabelNode = SKLabelNode()
    private var mainmenu: SKLabelNode = SKLabelNode()
    private var immagine: SKSpriteNode = SKSpriteNode(imageNamed: "badEnding")
    private var mugshot: SKLabelNode = SKLabelNode()
    
    override func didMove(to view: SKView) {
        backgroundImage.size = .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundImage.position = .init(x: frame.width/2, y: frame.height/2)
        
        title.fontName = "OldLondon"
        title.fontSize = 70
        title.text = "Game Over"
        title.position = .init(x: frame.width*0.5, y: frame.height*0.79)
        title.zPosition = 2
        title.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        subtitle.fontName = "OldNewspaperTypes"
        subtitle.fontSize = 25
        subtitle.text = "YOU LOSE!"
        subtitle.position = .init(x: frame.width*0.5, y: frame.height*0.67)
        subtitle.zPosition = 2
        subtitle.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        breakingNews.fontSize = 40
        if UIDevice.modelName.contains("iPad"){
            breakingNews.fontSize = 30
        }
        breakingNews.text = "Breaking News"
        breakingNews.fontName = "OldNewspaperTypes"
        breakingNews.zPosition = 2
        breakingNews.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        breakingNews.position = .init(x: frame.width*0.74, y: frame.height*0.5)

        lobby.fontSize = 24
        if UIDevice.modelName.contains("iPad"){
            lobby.fontSize = 18
        }
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
        if UIDevice.modelName.contains("iPad"){
            label.fontSize = 18
        }
        label.fontName = "OldNewspaperTypes"
//        label.numberOfLines = -1
        label.preferredMaxLayoutWidth = size.width*0.9
        label.numberOfLines = 0
        label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        label.text = "Arrested thief who tried \nto steal Crown jewels."
        label.position = .init(x: frame.width*0.74, y: frame.height*0.3)
        label.zPosition = 3
        label.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        timeCounter.fontSize = 25
        if UIDevice.modelName.contains("iPad"){
            timeCounter.fontSize = 18
        }
        timeCounter.fontName = "OldNewspaperTypes"
        timeCounter.preferredMaxLayoutWidth = size.width*0.9
        timeCounter.numberOfLines = 0
        timeCounter.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        if(SECONDS == 60 && MINUTE < 9){
        timeCounter.text = "Time: 0\(MINUTE) : 00"
        }else
        if(SECONDS > 10 && MINUTE <= 9){
            timeCounter.text = "Time: 0\(MINUTE) : \(SECONDS)"
        }else
        if(MINUTE <= 9 && SECONDS == 60){
            timeCounter.text = "Time: 0\(MINUTE) : 00"
        }else
        if(MINUTE == 10 && SECONDS == 60){
            timeCounter.text = "Time: \(MINUTE): 00"
        }else
        if(MINUTE == 0 && SECONDS == 0){
            timeCounter.text = "Time: 00 : 00"
        }
        
        timeCounter.position = .init(x: frame.width*0.74, y: frame.height*0.2)
        timeCounter.zPosition = 3
        timeCounter.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        gearCounter.fontSize = 25
        if UIDevice.modelName.contains("iPad"){
            gearCounter.fontSize = 18
        }
        gearCounter.fontName = "OldNewspaperTypes"
        gearCounter.preferredMaxLayoutWidth = size.width*0.9
        gearCounter.numberOfLines = 0
        gearCounter.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        gearCounter.text = "Gears acquired: \(number)"
        gearCounter.position = .init(x: frame.width*0.74, y: frame.height*0.1)
        gearCounter.zPosition = 3
        gearCounter.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        immagine.position = .init(x: frame.width*0.295, y: frame.height*0.33)
        if(UIDevice.modelName.contains("iPad")){
            immagine.xScale = 0.74
            immagine.yScale =  0.9
        }
        immagine.zPosition = 3
        
        mugshot.fontSize = 16
        if UIDevice.modelName.contains("iPad"){
            mugshot.fontSize = 11
        }
        mugshot.fontName = "OldNewspaperTypes"
        mugshot.preferredMaxLayoutWidth = size.width*0.5
        mugshot.numberOfLines = 0
        mugshot.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        mugshot.text = "   INMATE #\n       7436\nPOLICE DEPT"
        mugshot.position = immagine.position
        mugshot.position.y -= frame.height/4
        mugshot.zPosition = 4
        mugshot.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        addChild(backgroundImage)
        addChild(title)
        addChild(subtitle)
        addChild(breakingNews)
        addChild(mainmenu)
        addChild(lobby)
        addChild((timeCounter))
        addChild(gearCounter)
        addChild(label)
        addChild(immagine)
        addChild(mugshot)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }

        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)

        if touchedNode.name == "lobby"{
            touchedNode.alpha = 0.5
        }
        if touchedNode.name == "mainmenu"{
            touchedNode.alpha = 0.5

    }
}
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }

        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)

        if touchedNode.name == "lobby"{
            touchedNode.alpha = 1
            music.starsSound(filenamed: music.pagina)
            let lobby = LobbyScene(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            view?.presentScene(lobby, transition: .fade(withDuration: 3))
        }
        if touchedNode.name == "mainmenu"{
            touchedNode.alpha = 1
            music.starsSound(filenamed: music.pagina)
            let go = MainMenu(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            view?.presentScene(go, transition: .fade(withDuration: 3))
    }
    }
}
