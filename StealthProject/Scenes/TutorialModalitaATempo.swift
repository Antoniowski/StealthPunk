//
//  TutorialModalitaATempo.swift
//  StealthProject
//
//  Created by Salvatore Manna on 01/06/22.
//

import UIKit
import SpriteKit

class TutorialModalitaATempo: SKScene {
    var title: SKLabelNode = SKLabelNode(fontNamed: "OldLondon")
    var tutorialParts: [SKLabelNode] = [
        SKLabelNode(text: "You can move with the analog stick on the left of the screen. \nBy pressing B you can roll. By pressing A you can interact with the items in the room."),
        SKLabelNode(text: "Throughout the floors you can find some hidden items that may give you some effects. The goal of the game is to get to the end of the floors before the timer runs out."),
        SKLabelNode(text: "The timer runs out faster every time you are seen. When you are seen for the third time it's game over.")
    ]
    
    let nextTutorialPage: SKLabelNode = SKLabelNode(text: ">")
    let previousTutorialPage: SKLabelNode = SKLabelNode(text: "<")
    
    var tutorialPartsIndex: Int = 0
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        title.fontName = "OldLondon"
        title.fontSize = 70
        title.text = "Tutorial"
        title.position = .init(x: frame.width*0.5, y: frame.height*0.6)
        title.zPosition = 2
        title.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        let background: SKSpriteNode = SKSpriteNode(imageNamed: "Menu_Frame")
        background.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        background.size.width = size.width
        background.size.height = size.height
        background.zPosition = 1
        addChild(background)
        addChild(title)
        
        for indice in 0...tutorialParts.count-1{
            if(indice == 0){
//                tutorialParts[indice].fontName = "Victorian Parlor Vintage Alternate_free"
                tutorialParts[indice].fontName = "OldNewspaperTypes"
                tutorialParts[indice].numberOfLines = -1
                tutorialParts[indice].preferredMaxLayoutWidth = size.width*0.9
                tutorialParts[indice].verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
                tutorialParts[indice].fontSize = size.width*0.03
                tutorialParts[indice].fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
                tutorialParts[indice].position.x = size.width*0.48
                tutorialParts[indice].position.y = size.height*0.25
            } else if (indice == 1){
                tutorialParts[indice].fontName = "OldNewspaperTypes"
                tutorialParts[indice].numberOfLines = 0
                tutorialParts[indice].preferredMaxLayoutWidth = size.width*0.9
                tutorialParts[indice].verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
                tutorialParts[indice].fontSize = size.width*0.03
                tutorialParts[indice].fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
                tutorialParts[indice].position.x = size.width*0.48
                tutorialParts[indice].position.y = size.height*0.25
            } else if (indice == 2){
                tutorialParts[indice].fontName = "OldNewspaperTypes"
                tutorialParts[indice].numberOfLines = 0
                tutorialParts[indice].preferredMaxLayoutWidth = size.width*0.9
                tutorialParts[indice].verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
                tutorialParts[indice].fontSize = size.width*0.03
                tutorialParts[indice].fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
                tutorialParts[indice].position.x = size.width*0.48
                tutorialParts[indice].position.y = size.height*0.25
            }
            tutorialParts[indice].zPosition = 5
        }
        
//        for tutorial in tutorialParts{
//            tutorial.fontName = "Victorian Parlor Vintage Alternate_free"
//            tutorial.numberOfLines = 0
//            tutorial.preferredMaxLayoutWidth = size.width*0.9
//            tutorial.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
//            tutorial.fontSize = size.width*0.05
//            tutorial.fontColor = .white
//            tutorial.position.x = size.width*0.5
//            tutorial.position.y = size.height*0.2
//        }
        
        addChild(tutorialParts[tutorialPartsIndex])
        
        nextTutorialPage.position = CGPoint(x: size.width*0.8, y: size.height*0.1)
        nextTutorialPage.fontName = "OldNewspaperTypes"
        nextTutorialPage.fontSize = size.width*0.045
        nextTutorialPage.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        nextTutorialPage.zPosition = 5
        nextTutorialPage.name = "nextTutorialPage"
        addChild(nextTutorialPage)
        
        previousTutorialPage.position = CGPoint(x: size.width*0.2, y: size.height*0.1)
        previousTutorialPage.fontName = "OldNewspaperTypes"
        previousTutorialPage.fontSize = size.width*0.045
        previousTutorialPage.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        previousTutorialPage.zPosition = 5
        previousTutorialPage.name = "previousTutorialPage"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        if(touchedNode.name == "nextTutorialPage"){
            if(tutorialPartsIndex != tutorialParts.count-1){
                if(tutorialPartsIndex == 0){
                    addChild(previousTutorialPage)
                }
                tutorialParts[tutorialPartsIndex].removeFromParent()
                tutorialPartsIndex += 1
                if(tutorialPartsIndex == tutorialParts.count-1){
                    nextTutorialPage.text = "Play"
                    nextTutorialPage.run(.repeatForever(.sequence([.fadeAlpha(to: 0.7, duration: 0.5), .fadeAlpha(to: 1, duration: 0.5)])))
                }
                addChild(tutorialParts[tutorialPartsIndex])

            } else if(tutorialPartsIndex == tutorialParts.count-1){
                let scene = newMuseum.firstFloor
                view?.presentScene(scene, transition: .fade(withDuration: 1.5))
            }
        } else if (touchedNode.name == "previousTutorialPage"){
            if(tutorialPartsIndex != 0){
                if(tutorialPartsIndex == tutorialParts.count-1){
                    nextTutorialPage.text = ">"
                }
                tutorialParts[tutorialPartsIndex].removeFromParent()
                tutorialPartsIndex -= 1
                addChild(tutorialParts[tutorialPartsIndex])
                if(tutorialPartsIndex == 0){
                    previousTutorialPage.removeFromParent()
                }
            }
        }
        
    }
    
    
    
}
