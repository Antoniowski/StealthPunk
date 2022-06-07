//
//  InventoryPage.swift
//  StealthProject
//
//  Created by Martina Ottaviano on 01/06/22.
//

import Foundation
import SpriteKit

class InventoryPage: SKNode{
    private let backgroundImage: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed:"Menu_Frame"), size: .init(width: UIScreen.main.bounds.width*0.75, height: UIScreen.main.bounds.height*0.75))
    private let backgroundElements: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed:"MenuGear"), size: .init(width: UIScreen.main.bounds.width*0.75, height: UIScreen.main.bounds.height*0.75))
    var title: SKLabelNode = SKLabelNode()
    var testo: SKLabelNode = SKLabelNode()
    var testo1: SKLabelNode = SKLabelNode()
    var valore: SKLabelNode = SKLabelNode()
    
    var gearsAcquired: SKLabelNode = SKLabelNode()
        
    private let page1: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "page1"), size: CGSize(width: 390*0.75, height: 320*0.75))
    private let page2: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "page2"), size: CGSize(width: 390*0.75, height: 320*0.75))
    private let page3: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "page3"), size: CGSize(width: 390*0.8, height: 320*0.8))
    
    override init() {
        super.init()
        backgroundImage.zPosition = 1000
        backgroundImage.position = .init(x: 0,y: 0)
        
        backgroundElements.zPosition = 1001
        backgroundElements.position = .init(x: 0,y: 0)
        backgroundElements.alpha = 0.15
        
        page1.zPosition = 1001
        page1.position = .init(x: -120,y: -20)
        
        page2.zPosition = 1001
        page2.position = .init(x: 140,y: -23)
        
        gearsAcquired.position = .init(x: -25, y: 58)
        gearsAcquired.zPosition = 1002
        gearsAcquired.text = "0"
        if storage.value(forKey: "gears") != nil{
            gearsAcquired.text = "\(String(describing: storage.value(forKey: "gears") as! Int))"
        }
        gearsAcquired.fontName = "OldNewspaperTypes"
        gearsAcquired.fontSize = 25
        gearsAcquired.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
//        page3.zPosition = 1001
//        page3.position = .init(x: 150,y: -30)
        
        
        title.zPosition = 1002
        title.position = CGPoint (x: 0, y: 90)
        title.text = "Inventory"
        title.fontSize = 60
        title.fontName = "OldLondon"
        title.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        
        addChild(title)
        addChild(page1)
        addChild(page2)
//        addChild(page3)
        addChild(backgroundImage)
        addChild(backgroundElements)
        addChild(gearsAcquired)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


