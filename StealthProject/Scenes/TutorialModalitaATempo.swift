//
//  TutorialModalitaATempo.swift
//  StealthProject
//
//  Created by Salvatore Manna on 01/06/22.
//

import UIKit
import SpriteKit

class TutorialModalitaATempo: SKScene {

    var tutorialParts: [SKLabelNode] = [
        SKLabelNode(text: "\nYou can move with the analog stick on the left of the screen.\n\nBy pressing B you can roll.\n\nBy pressing A you can interact with the items in the room, for example you can hide in certain objects or you can stun the guards."),
        SKLabelNode(text: "\nThe objective of the game is to get to the end of the floors before the timer runs out.\n\nThroughout the floors, inside certain rooms you can find some chests that might give you items that grant you certain effects."),
        SKLabelNode(text: "\nThe timer runs out faster every time you are seen, up to a maximum of three times.\n\nWhen you are seen for the third time it's game over.")
    ]
    
    let nextTutorialPage: SKLabelNode = SKLabelNode(text: ">")
    let previousTutorialPage: SKLabelNode = SKLabelNode(text: "<")
    
    var tutorialPartsIndex: Int = 0
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        let background: SKSpriteNode = SKSpriteNode(imageNamed: "Menu_Frame")
        background.position = CGPoint(x: size.width*0.5, y: size.height*0.5)
        background.size.width = size.width
        background.size.height = size.height
        background.zPosition = 1
        addChild(background)
        
        for indice in 0...tutorialParts.count-1{
            if(indice == 0){
                tutorialParts[indice].fontName = "Victorian Parlor Vintage Alternate_free"
                tutorialParts[indice].numberOfLines = 0
                tutorialParts[indice].preferredMaxLayoutWidth = size.width*0.9
                tutorialParts[indice].verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
                tutorialParts[indice].fontSize = size.width*0.05
                tutorialParts[indice].fontColor = .black
                tutorialParts[indice].position.x = size.width*0.48
                tutorialParts[indice].position.y = size.height*0.25
            } else if (indice == 1){
                tutorialParts[indice].fontName = "Victorian Parlor Vintage Alternate_free"
                tutorialParts[indice].numberOfLines = 0
                tutorialParts[indice].preferredMaxLayoutWidth = size.width*0.9
                tutorialParts[indice].verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
                tutorialParts[indice].fontSize = size.width*0.05
                tutorialParts[indice].fontColor = .black
                tutorialParts[indice].position.x = size.width*0.48
                tutorialParts[indice].position.y = size.height*0.3
            } else if (indice == 2){
                tutorialParts[indice].fontName = "Victorian Parlor Vintage Alternate_free"
                tutorialParts[indice].numberOfLines = 0
                tutorialParts[indice].preferredMaxLayoutWidth = size.width*0.9
                tutorialParts[indice].verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
                tutorialParts[indice].fontSize = size.width*0.05
                tutorialParts[indice].fontColor = .black
                tutorialParts[indice].position.x = size.width*0.48
                tutorialParts[indice].position.y = size.height*0.3
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
        nextTutorialPage.fontName = "Victorian Parlor Vintage Alternate_free"
        nextTutorialPage.fontSize = size.width*0.045
        nextTutorialPage.fontColor = .black
        nextTutorialPage.zPosition = 5
        nextTutorialPage.name = "nextTutorialPage"
        addChild(nextTutorialPage)
        
        previousTutorialPage.position = CGPoint(x: size.width*0.2, y: size.height*0.1)
        previousTutorialPage.fontName = "Victorian Parlor Vintage Alternate_free"
        previousTutorialPage.fontSize = size.width*0.045
        previousTutorialPage.fontColor = .black
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
