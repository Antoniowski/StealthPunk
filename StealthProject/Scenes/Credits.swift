//
//  Credits.swift
//  StealthProject
//
//  Created by Guendalina De Laurentis on 31/05/22.
//

import Foundation
import SpriteKit

class Credits: SKScene{
    private var backgroundImage: SKSpriteNode = SKSpriteNode(imageNamed: "Menu_Template")
    private var title: SKLabelNode = SKLabelNode(fontNamed: "OldLondon")
    private var subtitle: SKLabelNode = SKLabelNode()
    private var start: SKLabelNode = SKLabelNode()
    private var option: SKLabelNode = SKLabelNode()
    private var mainmenu: SKLabelNode = SKLabelNode()
    private var nomi: SKLabelNode = SKLabelNode()
    private var Goosezilla: SKLabelNode = SKLabelNode()
    var logo = SKSpriteNode(imageNamed: "logo")
    
    override func didMove(to view: SKView) {
        backgroundImage.size = .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundImage.position = .init(x: frame.width/2, y: frame.height/2)
        
        self.run(.repeatForever(.sequence([.wait(forDuration: .random(in: 5...20)), .run {
            music.starsSound2(filenamed: music.horse)
        }])))
        
        title.fontName = "OldLondon"
        title.fontSize = 70
        title.text = "StealthPunk"
        title.position = .init(x: frame.width*0.5, y: frame.height*0.79)
        title.zPosition = 2
        title.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        subtitle.fontName = "OldNewspaperTypes"
        subtitle.fontSize = 25
        subtitle.text = "CREDITS"
        subtitle.position = .init(x: frame.width*0.5, y: frame.height*0.67)
        subtitle.zPosition = 2
        subtitle.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
//        start.fontSize = 50
//        start.text = "Tap to Start"
//        start.name = "start"
//        start.fontName = "OldNewspaperTypes"
//        start.zPosition = 2
//        start.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
//        start.position = .init(x: frame.width*0.74, y: frame.height*0.37)
//        start.run(.repeatForever(.sequence([.fadeAlpha(to: 0.4, duration: 0.5), .fadeAlpha(to: 1, duration: 0.5)])))

//        option.fontSize = 24
//        option.text = "Settings"
//        option.name = "settings"
//        option.fontName = "OldNewspaperTypes"
//        option.zPosition = 2
//        option.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
//        option.position = .init(x: frame.width*0.16, y: frame.height*0.67)
        
//        option.run(.repeatForever(.sequence([.fadeAlpha(to: 0.4, duration: 0.5), .fadeAlpha(to: 1, duration: 0.5)])))

        mainmenu.fontSize = 24
        mainmenu.text = "Main menu"
        mainmenu.name = "mainmenu"
        mainmenu.fontName = "OldNewspaperTypes"
        mainmenu.zPosition = 2
        mainmenu.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        mainmenu.position = .init(x: frame.width*0.16, y: frame.height*0.67)
        mainmenu.run(.repeatForever(.sequence([.scale(to: 0.9, duration: 2), .scale(to: 1, duration: 2)])))
        
        Goosezilla.fontSize = 40
        if (UIDevice.modelName.contains("iPad")){
            Goosezilla.fontSize = 35
        }
        Goosezilla.text = "GOOSEZILLA"
        Goosezilla.fontName = "OldNewspaperTypes"
        Goosezilla.zPosition = 2
        Goosezilla.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        Goosezilla.position = .init(x: frame.width*0.74, y: frame.height*0.35)

        nomi.fontSize = 25
        nomi.fontName = "OldNewspaperTypes"
        nomi.zPosition = 2
        nomi.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        nomi.preferredMaxLayoutWidth = size.width*0.9
        nomi.numberOfLines = 0
        nomi.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        nomi.text = "Team"
        nomi.position = .init(x: frame.width*0.74, y: frame.height*0.2)
        
        logo.position = .init(x: frame.width*0.295, y: frame.height*0.33)
        logo.xScale = size.width*0.00112
        logo.yScale = size.width*0.00112
//        image.xScale = 1.27
//        image.yScale =  1.27
        if(UIDevice.modelName.contains("iPhone 8") || UIDevice.modelName.contains("iPhone 8 Plus")){
            logo.xScale = size.width*0.00112
            logo.yScale = size.width*0.00135
        }
        if(UIDevice.modelName.contains("iPad")){
            logo.xScale = 0.74
            logo.yScale =  0.9
        }
        logo.zPosition = 3
        
        addChild(backgroundImage)
        addChild(title)
        addChild(subtitle)
        addChild(start)
        addChild(option)
        addChild(mainmenu)
        addChild(nomi)
        addChild(Goosezilla)
        addChild(logo)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }

        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)

        if touchedNode.name == "mainmenu"{
            touchedNode.alpha = 0.5
        }
        
        if touchedNode.name == "settings"{
            touchedNode.alpha = 0.5
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }

        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)

        if touchedNode.name == "mainmenu"{
            touchedNode.alpha = 1
            music.starsSound(filenamed: music.pagina)
            let menu = MainMenu(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            view?.presentScene(menu, transition: .fade(withDuration: 3))
        }
        
        if touchedNode.name == "settings"{
            touchedNode.alpha = 1
            music.starsSound(filenamed: music.pagina)
            let go = MainMenu(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            view?.presentScene(go, transition: .fade(withDuration: 3))
        }
    }
}

