//
//  ControllerRelatedGlobalVariables.swift
//  StealthProject
//
//  Created by Salvatore Manna on 04/05/22.
//

import Foundation
import GameController


var arrayOfTouches: [CGPoint] = []
let projectileShootDistance: CGFloat = 5000
let projectileVelocity: CGFloat = 500

var myMovement: CGVector = CGVector(dx: 0, dy: 0)
var myAngle: Float = 0

var buttonAIsPressed: Bool = false
var buttonBIsPressed: Bool = false

var myGameController: MyVirtualControllerClass = MyVirtualControllerClass()

var accortDX : Bool = false
var accortSX : Bool = false



