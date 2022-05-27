//
//  GuardMatrixes.swift
//  StealthProject
//
//  Created by Salvatore Manna on 26/05/22.
//

import Foundation
import SpriteKit

let simple1MatrixGuards: [[Int]] =
    [[2,  1,  1,  1,  1,  1,  7,  1,  1,  1,  3],
     [4,  6,  40, 6,  6,  12, 6,  12, 6,  0,  5],
     [4,  0,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  14, 5],
     [4,  6,  13, 6, 13,  6,  13, 6, 13,   6, 5],
     [4,  0,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [4,  41, 6,  6,  6,  12, 6,  12, 6,  6,  5],
     [1,  1,  1,  1,  1,  1,  8,  1,  1,  1,  1]
    ]

let simple1MatrixGuardsPaths: [[myAction]] = [
    [myAction(actionType: .ROTATE_ACTION, duration: 1.5, startingPoint: CGPoint(x: 0,y: 0), endingPoint: CGPoint(x: 0,y: 0), angle: 90)
        ],
    [myAction(actionType: .ROTATE_ACTION, duration: 1.5, startingPoint: CGPoint(x: 0,y: 0), endingPoint: CGPoint(x: 0,y: 0), angle: 90)],
    [myAction(actionType: .ROTATE_ACTION, duration: 1.5, startingPoint: CGPoint(x: 0,y: 0), endingPoint: CGPoint(x: 0,y: 0), angle: -90)]
]
