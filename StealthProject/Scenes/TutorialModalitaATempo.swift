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
        SKLabelNode(text: "You can move with the analog stick on the left of the screen.\n\nBy pressing B you can roll.\n\nBy pressing A you can interact with the items in the room, for example you can hide in certain objects or you can stun the guards."),
        SKLabelNode(text: "The objective of the game is to get to the end of the floors before the timer runs out.\nThroughout the floors, inside of certain rooms you can find some chests that might give you items that grant you certain effects.")
    ]
    
    let nextTutorialPage: SKShapeNode = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
    let previousTutorialPage: SKShapeNode = SKShapeNode(rectOf: CGSize(width: 50, height: 50))
    
    var tutorialPartsIndex: Int = 0
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        for tutorial in tutorialParts{
            tutorial.fontName = "Victorian Parlor Vintage Alternate_free"
            tutorial.numberOfLines = 0
            tutorial.preferredMaxLayoutWidth = size.width*0.9
            tutorial.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
            tutorial.fontSize = size.width*0.05
            tutorial.fontColor = .white
            tutorial.position.x = size.width*0.5
            tutorial.position.y = size.height*0.2
        }
        
        addChild(tutorialParts[tutorialPartsIndex])
        
        nextTutorialPage.position = CGPoint(x: size.width*0.8, y: size.height*0.1)
        nextTutorialPage.fillColor = .white
        nextTutorialPage.strokeColor = .white
        nextTutorialPage.zPosition = 5
        nextTutorialPage.name = "nextTutorialPage"
        addChild(nextTutorialPage)
        
        previousTutorialPage.position = CGPoint(x: size.width*0.2, y: size.height*0.1)
        previousTutorialPage.fillColor = .red
        previousTutorialPage.strokeColor = .red
        previousTutorialPage.zPosition = 5
        previousTutorialPage.name = "previousTutorialPage"
        addChild(previousTutorialPage)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        if(touchedNode.name == "nextTutorialPage"){
            tutorialParts[tutorialPartsIndex].removeFromParent()
            tutorialPartsIndex += 1
            addChild(tutorialParts[tutorialPartsIndex])
        } else if (touchedNode.name == "previousTutorialPage"){
            if(tutorialPartsIndex != 0){
                tutorialParts[tutorialPartsIndex].removeFromParent()
                tutorialPartsIndex -= 1
                addChild(tutorialParts[tutorialPartsIndex])
            }
        }
        
    }
    
    
    
}
