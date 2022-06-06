//
//  LoseFunction.swift
//  StealthProject
//
//  Created by Gennaro Cirillo on 06/06/22.
//

import Foundation
import SpriteKit

func loseFunc(scene : SKScene){
    if(loseFlag){
        
        scene.removeAllActions()
        scene.removeAllChildren()
        
        scene.camera?.removeAllChildren()
        
        myGameController.disconnectController()
        
        loseFlag = false
        moltiplicatoreTempo = 1
        
        let livelloMorte = GameOverMenu(size: scene.size)
        let transition = SKTransition.fade(with: .black, duration: 2)
        scene.view?.presentScene(livelloMorte, transition: transition)
    }
}
