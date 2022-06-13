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
    
    var allarmeLivello1: SKSpriteNode = SKSpriteNode(imageNamed: "siren1")
    var allarmeLivello2: SKSpriteNode = SKSpriteNode(imageNamed: "siren1")
    var allarmeLivello3: SKSpriteNode = SKSpriteNode(imageNamed: "siren1")

    var proiettile1: SKSpriteNode = SKSpriteNode(imageNamed: "bullet")
    var proiettile2: SKSpriteNode = SKSpriteNode(imageNamed: "bullet")
    
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
        if (moltiplicatoreTempo == moltiplicatoreTempo2){
            allarmeLivello1.run(.setTexture(SKTexture(imageNamed: "siren2")))
        } else if (moltiplicatoreTempo == moltiplicatoreTempo3) {
            allarmeLivello1.run(.setTexture(SKTexture(imageNamed: "siren2")))
            allarmeLivello2.run(.setTexture(SKTexture(imageNamed: "siren2")))
        } else if (moltiplicatoreTempo == moltiplicatoreTempo4) {
            allarmeLivello1.run(.setTexture(SKTexture(imageNamed: "siren2")))
            allarmeLivello2.run(.setTexture(SKTexture(imageNamed: "siren2")))
            allarmeLivello3.run(.setTexture(SKTexture(imageNamed: "siren2")))
        }
        allarmeLivello1.size = CGSize(width: 60, height: 60)
        allarmeLivello1.position = CGPoint(x: 50, y: -32)
        allarmeLivello1.zPosition = 1000
        allarmeLivello2.size = CGSize(width: 60, height: 60)
        allarmeLivello2.position = CGPoint(x: 100, y: -32)
        allarmeLivello2.zPosition = 1000
        allarmeLivello3.size = CGSize(width: 60, height: 56)
        allarmeLivello3.position = CGPoint(x: 150, y: -32)
        allarmeLivello3.zPosition = 1000
        
        proiettile1.size = CGSize(width: 200, height: 200)
        proiettile1.zPosition = 1000
        proiettile1.zRotation = 120 * 3.14 / 180
        proiettile1.position = CGPoint(x: UIScreen.main.bounds.size.width*1.8, y: 25)
        proiettile2.size = CGSize(width: 200, height: 200)
        proiettile2.zPosition = 1000
        proiettile2.zRotation = 120 * 3.14 / 180
        proiettile2.position = CGPoint(x: UIScreen.main.bounds.size.width*1.85, y: 25)
        addChild(proiettile1)
        addChild(proiettile2)
        addChild(allarmeLivello1)
        addChild(allarmeLivello2)
        addChild(allarmeLivello3)
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
