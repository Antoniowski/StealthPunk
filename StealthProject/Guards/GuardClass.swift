//
//  GuardClass.swift
//  StealthProject
//
//  Created by Antonio Romano on 04/05/22.
//

import Foundation
import SpriteKit

struct GuardState{
    var isDead: Bool = false
    var isStunned: Bool = false
    var isAlerted: Bool = false
    var isSerching: Bool = false
    var playerDetected: Bool = false
}

enum GuardActionState: Int{
    case MOVE = 0
    case SHOOT = 1
    case LOCKED = 2
}

class Guard: SKSpriteNode{
    
    private var strenght: Int = 0
    private var guardSpeed: Int = 0
    
    private var status: GuardState = GuardState()
    private var actionState: GuardActionState = .MOVE
    
    private var visionDistance: Double = 0
    private var visionRadius: Double = 0
    
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, strenght: Int, speed: Int, visionDistance: Double, visionRadius: Double) {
        super.init(texture: texture, color: color, size: size)
        self.name = "enemy"
        self.strenght = strenght
        self.guardSpeed = speed
        self.visionDistance = visionDistance
        self.visionRadius = visionRadius
    }
    
//    GET FUNCTIONS
    func getStrenght()->Int{
        return self.strenght
    }
    
    func getSpeed()->Int{
        return self.guardSpeed
    }
    
    func getVisionDistance()->Double{
        return self.visionDistance
    }
    
    func getVisionRadius()->Double{
        return self.visionRadius
    }
    
    
//    SET FUNCTIONS
//    Are these usefull for guards??
    
    func setStenght(_ newStrenght: Int){
        self.strenght = newStrenght
    }
    
    func setSpeed(_ newSpeed: Int){
        self.guardSpeed = newSpeed
    }
    
    func setVisionDistance(_ newVisionDistance: Double){
        self.visionDistance = newVisionDistance
    }
    
    func setVisionRadius(_ newVisionRadius: Double){
        self.visionRadius = newVisionRadius
    }
}
