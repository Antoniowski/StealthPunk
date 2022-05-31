//
//  StatusController.swift
//  StealthProject
//
//  Created by Antonio Romano on 23/05/22.
//

import Foundation
import SpriteKit

class Museum{
    var firstFloor: SKScene = TestScene2(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    var secondFloor: SKScene = TestScene3(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    var finalFloor: SKScene = TestScene4(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    
    func createNewFloor(){
        firstFloor = SKScene()
        secondFloor = SKScene()
        finalFloor = SKScene()
    }
}

var newMuseum = Museum()
