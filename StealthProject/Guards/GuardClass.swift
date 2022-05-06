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
    
    private var visionConeRadius: Double = 0
    private var visionConeAngle: Double = 60
    
    private var arrayOfVisionPoints: [CGPoint] = []
    
    private var invisibleBall: SKShapeNode = SKShapeNode(rectOf: CGSize(width: 1, height: 1))
    private var initBall: Bool = false
    
    private var playerFound: Bool = false
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, strenght: Int, speed: Int, visionConeRadius: Double, visionConeAngle: Double) {
        super.init(texture: texture, color: color, size: size)
        self.name = "enemy"
        self.strenght = strenght
        self.guardSpeed = speed
        self.visionConeRadius = visionConeRadius
        self.visionConeAngle = visionConeAngle
        
        invisibleBall.strokeColor = .clear
        invisibleBall.fillColor = .clear
       
        
    }
    
//    GET FUNCTIONS
    func getStrenght()->Int{
        return self.strenght
    }
    
    func getSpeed()->Int{
        return self.guardSpeed
    }
    
    func getArrayOfVisionPoints()->[CGPoint]{
        return self.arrayOfVisionPoints
    }
    
    func getVisionConeRadius()->Double{
        return self.visionConeRadius
    }
    
    func getVisionConeAngle()->Double{
        return self.visionConeAngle
    }
    
    func getPlayerFound()->Bool{
        return self.playerFound
    }
    
    func getCenterBall()->SKShapeNode{
        return self.invisibleBall
    }
    
    func getInitBall()->Bool{
        return self.initBall
    }
    
//    SET FUNCTIONS
//    Are these usefull for guards??
    
    func setStenght(_ newStrenght: Int){
        self.strenght = newStrenght
    }
    
    func setSpeed(_ newSpeed: Int){
        self.guardSpeed = newSpeed
    }
    
    func appendToArrayOfPoints(point: CGPoint){
        arrayOfVisionPoints.append(point)
    }
    
    func resetArrayOfPoints(){
        arrayOfVisionPoints.removeAll()
    }
    
    func setVisionConeRadius(_ newVisionConeRadius: Double){
        self.visionConeRadius = newVisionConeRadius
    }
    
    func setVisionConeAngle(_ newAngleRadius: Double){
        self.visionConeAngle = newAngleRadius
    }
    
    func setPlayerFoundTrue(){
        self.playerFound = true
    }
    
    func setPlayerFoundFlase(){
        self.playerFound = false
    }
 
    func centerBall(){
        self.invisibleBall.position = self.position
    }
    
    func setInitBall() {
        self.initBall = true
    }
    
}
