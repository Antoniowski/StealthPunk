//
//  Intro.swift
//  StealthProject
//
//  Created by Antonio Romano on 18/05/22.
//

//TODO: Aggiungere transizione scena
import Foundation
import SpriteKit
import AVFAudio

class Intro: SKScene{
    
    private var logo: SKSpriteNode = SKSpriteNode(imageNamed: "GoosezillaV3")
    private var border: SKShapeNode = SKShapeNode()
//    private let audio: AVAudioPlayer = AVAudioPlayer()
    private var animazione: SKAction = SKAction.sequence([.fadeIn(withDuration: 1.5), .playSoundFileNamed("GOOSE2", waitForCompletion: false), .wait(forDuration: 1.5), .fadeOut(withDuration: 1.5)])
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .black
        
        logo.position = .init(x: UIScreen.main.bounds.width*0.5, y: UIScreen.main.bounds.height*0.5)
        logo.size = CGSize(width: UIScreen.main.bounds.height*0.5, height: UIScreen.main.bounds.height*0.7)
        border = SKShapeNode(rectOf: .init(width: logo.size.width*1.05, height: logo.size.height*1.05))
        border.position = logo.position
        border.strokeColor = .white
//        border.fillColor = .white
        
        logo.alpha = 0
        border.alpha = 0
        
        logo.run(animazione)
        border.run(animazione)
        
        addChild(border)
        addChild(logo)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
