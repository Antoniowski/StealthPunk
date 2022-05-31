//
//  gameOver.swift
//  StealthProject
//
//  Created by Guendalina De Laurentis on 31/05/22.
//

import Foundation
import SpriteKit

class GameOver: SKScene{
    private var backgroundImage: SKSpriteNode = SKSpriteNode(imageNamed: "Menu_Template")
    private var title: SKLabelNode = SKLabelNode(fontNamed: "OldLondon")
    private var breakingNews: SKLabelNode = SKLabelNode()
    private var option: SKLabelNode = SKLabelNode()
    
    override func didMove(to view: SKView) {
        backgroundImage.size = .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundImage.position = .init(x: frame.width/2, y: frame.height/2)
        
        title.fontName = "OldLondon"
        title.fontSize = 60
        title.text = "StealthPunk"
        title.position = .init(x: frame.width*0.5, y: frame.height*0.80)
        title.zPosition = 2
        title.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        breakingNews.fontSize = 30
        breakingNews.text = "Breaking News"
        breakingNews.fontName = "
        breakingNews.zPosition = 2
        breakingNews.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        breakingNews.position = .init(x: frame.width*0.7, y: frame.height*0.55)

        option.fontSize = 30
        option.text = "Settings"
        option.zPosition = 2
        option.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        option.position = .init(x: frame.width*0.74, y: frame.height*0.35)
        
        addChild(backgroundImage)
        addChild(title)
        addChild(breakingNews)
        addChild(option)
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

