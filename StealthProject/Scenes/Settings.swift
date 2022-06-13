//
//  Settings.swift
//  StealthProject
//
//  Created by Martina Ottaviano on 06/06/22.
//

import Foundation
import SpriteKit

class SettingsPage: SKScene{
    private var backgroundImage: SKSpriteNode = SKSpriteNode(imageNamed: "Menu_Template")
    private var title: SKLabelNode = SKLabelNode(fontNamed: "OldLondon")
    private var subtitle: SKLabelNode = SKLabelNode()
    private var option: SKLabelNode = SKLabelNode()
    private var image: SKSpriteNode = SKSpriteNode(imageNamed: "grammofono")
    private var audio: SKLabelNode = SKLabelNode()
    private var effect: SKLabelNode = SKLabelNode()
    
    private var muteMusic: SKSpriteNode = SKSpriteNode()
    private var muteEffect: SKSpriteNode = SKSpriteNode()
    
    private var musicL: SKShapeNode = SKShapeNode()
    private var musicR: SKShapeNode = SKShapeNode()
    private var effectL: SKShapeNode = SKShapeNode()
    private var effectR: SKShapeNode = SKShapeNode()
    
    private var M01: SKShapeNode = SKShapeNode(rectOf: .init(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.05))
    private var M02: SKShapeNode = SKShapeNode(rectOf: .init(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.05))
    private var M03: SKShapeNode = SKShapeNode(rectOf: .init(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.05))
    private var M04: SKShapeNode = SKShapeNode(rectOf: .init(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.05))
    private var M05: SKShapeNode = SKShapeNode(rectOf: .init(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.05))
    
    private var E01: SKShapeNode = SKShapeNode(rectOf: .init(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.05))
    private var E02: SKShapeNode = SKShapeNode(rectOf: .init(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.05))
    private var E03: SKShapeNode = SKShapeNode(rectOf: .init(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.05))
    private var E04: SKShapeNode = SKShapeNode(rectOf: .init(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.05))
    private var E05: SKShapeNode = SKShapeNode(rectOf: .init(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.05))

    private var plusButton: SKSpriteNode = SKSpriteNode(imageNamed: "plus")
    private var minusButton: SKSpriteNode = SKSpriteNode(imageNamed: "meno")
    
    private var plusButton2: SKSpriteNode = SKSpriteNode(imageNamed: "plus")
    private var minusButton2: SKSpriteNode = SKSpriteNode(imageNamed: "meno")
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        backgroundImage.size = .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        backgroundImage.position = .init(x: frame.width/2, y: frame.height/2)
        
        self.run(.repeatForever(.sequence([.wait(forDuration: .random(in: 5...20)), .run {
            music.starsSound2(filenamed: music.horse)
        }])))
        
        title.fontName = "OldLondon"
        title.fontSize = 70
        title.text = "StealthPunk"
        title.position = .init(x: frame.width*0.5, y: frame.height*0.79)
        title.zPosition = 2
        title.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        subtitle.fontName = "OldNewspaperTypes"
        subtitle.fontSize = 25
        subtitle.text = "SETTINGS"
        subtitle.position = .init(x: frame.width*0.5, y: frame.height*0.67)
        subtitle.zPosition = 2
        subtitle.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        
        option.fontSize = 24
        option.text = "Main Menu"
        option.name = "menu"
        option.fontName = "OldNewspaperTypes"
        option.zPosition = 2
        option.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        option.position = .init(x: frame.width*0.845, y: frame.height*0.67)
        option.run(.repeatForever(.sequence([.scale(to: 0.9, duration: 2), .scale(to: 1, duration: 2)])))
        
//        option.run(.repeatForever(.sequence([.fadeAlpha(to: 0.4, duration: 0.5), .fadeAlpha(to: 1, duration: 0.5)])))

        
        image.position = .init(x: frame.width*0.295, y: frame.height*0.33)
        image.xScale = size.width*0.00112
        image.yScale = size.width*0.00112
//        image.xScale = 1.27
//        image.yScale =  1.27
        if(UIDevice.modelName.contains("iPhone 8") || UIDevice.modelName.contains("iPhone 8 Plus")){
            image.xScale = size.width*0.00112
            image.yScale = size.width*0.00135
        }
        if(UIDevice.modelName.contains("iPad")){
            image.xScale = 0.74
            image.yScale =  0.9
        }
        image.zPosition = 3
        
        audio.fontName = "OldNewspaperTypes"
        audio.fontSize = 24
        audio.text = "Music"
        audio.zPosition = 3
        audio.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        audio.position = .init(x: frame.width*0.75, y: frame.height*0.45)
        
//        INDICATORE AUDIO BACKGROUND
        
        plusButton.position = .init(x: frame.width*0.75 + 95, y: frame.height*0.38)
        plusButton.zPosition = 2
        plusButton.xScale = 0.2
        plusButton.yScale = 0.2
        plusButton.name = "+"
        minusButton.position = .init(x: frame.width*0.75 - 95, y: frame.height*0.38)
        minusButton.zPosition = 2
        minusButton.xScale = 0.2
        minusButton.yScale = 0.2
        minusButton.name = "-"
    
        M01.zPosition = 2
        M01.position = .init(x: frame.width*0.75 - 40, y: frame.height*0.38)
        M01.fillColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        M01.strokeColor = .clear
        
        M02.zPosition = 2
        M02.position = .init(x: frame.width*0.75 - 20, y: frame.height*0.38)
        M02.fillColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        M02.strokeColor = .clear
        
        M03.zPosition = 2
        M03.position = .init(x: frame.width*0.75, y: frame.height*0.38)
        M03.fillColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        M03.strokeColor = .clear
        
        M04.zPosition = 2
        M04.position = .init(x: frame.width*0.75 + 20, y: frame.height*0.38)
        M04.fillColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        M04.strokeColor = .clear
        
        M05.zPosition = 2
        M05.position = .init(x: frame.width*0.75 + 40, y: frame.height*0.38)
        M05.fillColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        M05.strokeColor = .clear
        
//        INDICATORE SOUND EFFECTS
        
        plusButton2.position = .init(x: frame.width*0.75 + 95, y: frame.height*0.17)
        plusButton2.zPosition = 2
        plusButton2.xScale = 0.2
        plusButton2.yScale = 0.2
        plusButton2.name = "+2"
        minusButton2.position = .init(x: frame.width*0.75 - 95, y: frame.height*0.17)
        minusButton2.zPosition = 2
        minusButton2.xScale = 0.2
        minusButton2.yScale = 0.2
        minusButton2.name = "-2"
        
        E01.zPosition = 2
        E01.position = .init(x: frame.width*0.75 - 40, y: frame.height*0.17)
        E01.fillColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        E01.strokeColor = .clear
        
        E02.zPosition = 2
        E02.position = .init(x: frame.width*0.75 - 20, y: frame.height*0.17)
        E02.fillColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        E02.strokeColor = .clear
        
        E03.zPosition = 2
        E03.position = .init(x: frame.width*0.75, y: frame.height*0.17)
        E03.fillColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        E03.strokeColor = .clear
        
        E04.zPosition = 2
        E04.position = .init(x: frame.width*0.75 + 20, y: frame.height*0.17)
        E04.fillColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        E04.strokeColor = .clear
        
        E05.zPosition = 2
        E05.position = .init(x: frame.width*0.75 + 40, y: frame.height*0.17)
        E05.fillColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        E05.strokeColor = .clear
                
        
        effect.fontName = "OldNewspaperTypes"
        effect.fontSize = 24
        effect.text = "Sound effects"
        effect.zPosition = 2
        effect.fontColor = .init(red: 0.22, green: 0.196, blue: 0.165, alpha: 0.85)
        effect.position = .init(x: frame.width*0.75, y: frame.height*0.25)
        
        addChild(backgroundImage)
        addChild(title)
        addChild(subtitle)
        addChild(option)
        addChild(image)
        addChild(audio)
        
        addChild(M01)
        addChild(M02)
        addChild(M03)
        addChild(M04)
        addChild(M05)
        addChild(E01)
        addChild(E02)
        addChild(E03)
        addChild(E04)
        addChild(E05)
        
        addChild(plusButton)
        addChild(plusButton2)
        
        addChild(minusButton)
        addChild(minusButton2)
        
        
        
        addChild(effect)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }

        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)

        
        if touchedNode.name == "menu"{
            touchedNode.alpha = 0.5
        }
        
        if touchedNode.name == "+" {
            touchedNode.alpha = 0.5
        }
        if touchedNode.name == "-" {
            touchedNode.alpha = 0.5
        }
        if touchedNode.name == "+2" {
            touchedNode.alpha = 0.5
        }
        if touchedNode.name == "-2" {
            touchedNode.alpha = 0.5
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }

        let touchLocation = touch.location(in: self)
        let touchedNode = atPoint(touchLocation)
        
        if touchedNode.name == "menu"{
            touchedNode.alpha = 1
            music.starsSound(filenamed: music.pagina)
            let menu = MainMenu(size: .init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            view?.presentScene(menu, transition: .fade(withDuration: 2))
            
        }
        if touchedNode.name == "+" {
            touchedNode.alpha = 1
            
            if(music.musicVolume < 1) {
                music.musicVolume += 0.2
                music.musicEffect.volume += 0.2
                if music.musicVolume > 1{
                    music.musicVolume = 1
                    music.musicEffect.volume = 1
                }
                storage.set(music.musicVolume, forKey: "musicVolume")
            }
        }
        if touchedNode.name == "-" {
            touchedNode.alpha = 1
            if(music.musicVolume > 0) {
                music.musicVolume -= 0.2
                music.musicEffect.volume -= 0.2
                if music.musicVolume < 0{
                    music.musicVolume = 0
                    music.musicEffect.volume = 0
                }
                storage.set(music.musicVolume, forKey: "musicVolume")
            }
        }
        if touchedNode.name == "+2" {
            touchedNode.alpha = 1
            
            if(music.volume < 1) {
                music.volume += 0.2
                if music.volume > 1{
                    music.volume = 1
                }
                storage.set(music.volume, forKey: "volume")
            }
        }
        if touchedNode.name == "-2" {
            touchedNode.alpha = 1
            if(music.volume > 0) {
                music.volume -= 0.2
                if music.volume < 0{
                    music.volume = 0
                }
                storage.set(music.volume, forKey: "volume")
            }
        }
        
    }
    
    func updateVolumeSoundEffect() {
        if (music.volume.rounded(digits: 2) == 0) {
            E01.setScale(1)
            E02.setScale(1)
            E03.setScale(1)
            E04.setScale(1)
            E05.setScale(1)
        }
        else if(music.volume.rounded(digits: 2) == 0.2){
            E01.setScale(1.5)
            E02.setScale(1)
            E03.setScale(1)
            E04.setScale(1)
            E05.setScale(1)
        }
        else if(music.volume.rounded(digits: 2) == 0.4){
            E01.setScale(1.5)
            E02.setScale(1.5)
            E03.setScale(1)
            E04.setScale(1)
            E05.setScale(1)
        }
        else if(music.volume.rounded(digits: 2) == 0.6){
            E01.setScale(1.5)
            E02.setScale(1.5)
            E03.setScale(1.5)
            E04.setScale(1)
            E05.setScale(1)
        }
        else if(music.volume.rounded(digits: 2) == 0.8){
            E01.setScale(1.5)
            E02.setScale(1.5)
            E03.setScale(1.5)
            E04.setScale(1.5)
            E05.setScale(1)
        }
        else if(music.volume.rounded(digits: 2) == 1){
            E01.setScale(1.5)
            E02.setScale(1.5)
            E03.setScale(1.5)
            E04.setScale(1.5)
            E05.setScale(1.5)
        
    }
}
    
    func updateVolumeMusic() {
        if (music.musicVolume.rounded(digits: 2) == 0) {
            M01.setScale(1)
            M02.setScale(1)
            M03.setScale(1)
            M04.setScale(1)
            M05.setScale(1)
        }
        else if(music.musicVolume.rounded(digits: 2) == 0.2){
            M01.setScale(1.5)
            M02.setScale(1)
            M03.setScale(1)
            M04.setScale(1)
            M05.setScale(1)
        }
        else if(music.musicVolume.rounded(digits: 2) == 0.4){
            M01.setScale(1.5)
            M02.setScale(1.5)
            M03.setScale(1)
            M04.setScale(1)
            M05.setScale(1)
        }
        else if(music.musicVolume.rounded(digits: 2) == 0.6){
            M01.setScale(1.5)
            M02.setScale(1.5)
            M03.setScale(1.5)
            M04.setScale(1)
            M05.setScale(1)
        }
        else if(music.musicVolume.rounded(digits: 2) == 0.8){
            M01.setScale(1.5)
            M02.setScale(1.5)
            M03.setScale(1.5)
            M04.setScale(1.5)
            M05.setScale(1)
        }
        else if(music.musicVolume.rounded(digits: 2) == 1){
            M01.setScale(1.5)
            M02.setScale(1.5)
            M03.setScale(1.5)
            M04.setScale(1.5)
            M05.setScale(1.5)
        
    }
    }
    override func update(_ currentTime: TimeInterval) {
        updateVolumeSoundEffect()
        updateVolumeMusic()
    }

}
