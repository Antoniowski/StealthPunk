//
//  TimeCounter.swift
//  StealthProject
//
//  Created by Antonio Romano on 26/05/22.
//

import Foundation
import SpriteKit

var MINUTE: Int = 9
var SECONDS: Int = 0

class TimeCounter: SKNode{
    private var border: SKSpriteNode = SKSpriteNode(imageNamed: "frameFill")
    var etichetta: SKLabelNode = SKLabelNode()
    var cerchio1: SKShapeNode = SKShapeNode(circleOfRadius: 15)
    var cerchio2: SKShapeNode = SKShapeNode(circleOfRadius: 15)
    var cerchio3: SKShapeNode = SKShapeNode(circleOfRadius: 15)
    
    override init() {
        super.init()
        border.zPosition = 1000
        border.size = CGSize (width: 200, height: 75)
        border.position = CGPoint(x: 100, y: 38)
        etichetta.zPosition = 1001
        etichetta.position = CGPoint (x: 100, y: 25)
        etichetta.text = "10:00"
        etichetta.fontSize = 40
        etichetta.fontName = "Victorian Parlor Vintage Alternate_free"
        etichetta.fontColor = .white
        cerchio1.strokeColor = .brown
        cerchio1.fillColor = .systemGray2
        cerchio1.position = CGPoint(x: 50, y: -25)
        cerchio1.zPosition = 1000
        cerchio2.strokeColor = .brown
        cerchio2.fillColor = .systemGray2
        cerchio2.position = CGPoint(x: 100, y: -25)
        cerchio2.zPosition = 1000
        cerchio3.strokeColor = .brown
        cerchio3.fillColor = .systemGray2
        cerchio3.position = CGPoint(x: 150, y: -25)
        cerchio3.zPosition = 1000
        addChild(cerchio1)
        addChild(cerchio2)
        addChild(cerchio3)
        addChild(border)
        addChild(etichetta)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

func Timer(scene: SKScene){
    
        let wait = SKAction.wait(forDuration: 1)
        let go = SKAction.run({            
            if SECONDS > 0 && MINUTE >= 0{
                if(SECONDS - moltiplicatoreTempo < 0){
                    let differenzaDiSecondi = moltiplicatoreTempo - SECONDS
                    SECONDS = 60
                    MINUTE -= 1
                    SECONDS -= differenzaDiSecondi
                } else {
                    SECONDS -= 1 * (moltiplicatoreTempo)
                }
            }else{
                if MINUTE > 0{
                    SECONDS = 60
                    SECONDS -= 1 * (moltiplicatoreTempo)
                    MINUTE -= 1
                }else{
                    print("GAME OVER")
                }
            }
            if(MINUTE < 0){
                loseFlag = true
                MINUTE = 0
                SECONDS = 0
            }
        })
        let actions = SKAction.sequence([wait, go])
//    scene.run(.sequence([wait, .run {
//        MINUTE -= 1
//    }]))
    scene.run(.repeatForever(actions), withKey: "CLOCK")
}
