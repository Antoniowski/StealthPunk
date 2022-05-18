//
//  GameScene.swift
//  StealthProject
//
//  Created by Antonio Romano on 02/05/22.
//

import SpriteKit
import GameplayKit



class GameScene: SKScene {
    
//    var myGameController: MyVirtualControllerClass = MyVirtualControllerClass()
    
    override func didMove(to view: SKView) {
        myGameController.setUpGameController()
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myGameController.disconnectController()
        let scene = TestScene2(size: self.size)
        view?.presentScene(scene)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered

    }
}
