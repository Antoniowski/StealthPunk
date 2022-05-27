//
//  GuardMatrixes.swift
//  StealthProject
//
//  Created by Salvatore Manna on 26/05/22.
//

//300 - GUARDIA CONO GRANDE
//301 - GUARDIA CONO PICCOLO

import Foundation
import SpriteKit

let simple1MatrixGuards: [[Int]] =
    [[2,  1,  1,  1,  1,  1,  7,  1,  1,  1,  3],
     [4,  6,  40, 6,  6,  12, 6,  12, 6,  300,  5],
     [4,  300,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  14, 5],
     [4,  6,  13, 6, 13,  6,  13, 6, 13,   6, 5],
     [4,  300,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [4,  41, 6,  6,  6,  12, 6,  12, 6,  6,  5],
     [1,  1,  1,  1,  1,  1,  8,  1,  1,  1,  1]
    ]

let simple2MatrixGuards: [[Int]] =
    [[2,  1,  7,  1,  1,  1,  1,  1,  1,  3],
     [4, 12,  6, 12,  6, 40,  6,  6,  6,  5],
     [4,  300,  6,  6,  6,  6,  6,  6, 13,  5],
     [4,  6,  6,  6,  6,  6,  6, 41,  6,  5],
     [4,  6,  6,  6, 14,  6,  6,  6,  300,  5],
     [4,  6,  300,  6,  6,  6,  6,  6,  6,  5],
     [4,  6, 13,  6, 13,  6, 12,  6, 12,  5],
     [1,  1,  1,  1,  1,  1,  1,  8,  1,  1]
    ]

let simple3MatrixGuards: [[Int]] =
    [[2,  1,  1,  1,  1,  1,  3,  0,  0,  0,  0],
     [9,  6,  301,  6,  6, 40,  5,  0,  0,  0,  0],
     [1,  1,  1,  4,  6,  6,  6,  1,  1,  1,  3],
     [0,  0,  0,  4, 12,  6,  6,  6,  6,  6, 10],
     [0,  0,  0,  4, 14,  6,  5,  1,  1,  1,  1],
     [0,  0,  0,  4,  6,  300,  5,  0,  0,  0,  0],
     [2,  1,  1,  32, 6, 13,  5,  0,  0,  0,  0],
     [4,  6,  6,   6, 6,  6,  5,  0,  0,  0,  0],
     [1,  1,  1,   1, 1,  1,  1,  0,  0,  0,  0]
    ]

let simple4MatrixGuards: [[Int]] =
    [[2, 1,  1, 1, 1, 7, 1, 1,   1, 1, 1,  3],
     [4, 6, 40, 6, 6, 6, 6, 6, 41, 41, 6,  5],
     [4, 6,  301, 6, 6, 6, 6, 6,  6,  301, 6,  5],
     [9, 6, 6, 6, 6, 13, 14,13, 6, 6, 6, 10],
     [4, 6, 6, 6, 6,  6,  6,  6, 6, 6, 6,  5],
     [1, 1, 1, 4, 6,  6,  6,  6, 5, 1, 1,  1],
     [0, 0, 0, 4, 6,  6,  300,  6, 5, 0, 0,  0],
     [0, 0, 0, 1, 1,  1,  1,  1, 1, 0, 0,  0]
    ]

let simple5MatrixGuards: [[Int]] =
    [[2,  1,  1,   1,  1,  1,    1,   1,  1,  1,  1,  1,  1, 3],
     [4,  6,  41,  6,  6,  6,    6,   6,  6,  6,  6, 40, 40, 5],
     [4,  6,   6,  300,  6,  6,    6,   6,  6,  6,  6,  300,  6, 5],
     [4, 12,   6,  6,  6,  13,  13,  14, 13,  6, 13,  6,  6, 5],
     [9,  6,   6,  6,  6,   6,   6,   6,  6,  6, 6,   6,  6, 5],
     [4, 12,   6,  6,  300,  6,    6,   6,  6,  6, 300,   6,  6, 5],
     [4,  6,   6,  6, 40,  6,    6,  12,  6, 12, 6,   6,  6, 5],
     [1,  1,   1,  1,  1,  1,    1,   1,  8,  1, 1,   1,  1, 1]
    ]

let simple6MatrixGuards: [[Int]] =
    [[2, 1, 1,  1,  1,  1,  1, 3, 0, 0,  0,  0],
     [4, 6, 6,  6,  6,  6, 40, 5, 0, 2,  1,  3],
     [4, 301, 13, 6, 13,  301,  6, 5, 0, 4,  6, 10],
     [4, 6, 6, 12,  6,  6,  6, 5, 0, 4,  6,  5],
     [4, 6, 13, 6, 13,  6, 6, 31, 1, 32, 6,  5],
     [4, 6,  6, 6,  6,  6, 6,  6, 6,  6, 300,  5],
     [4, 6,  6, 6,  6, 12, 6, 12, 6,  6, 41, 5],
     [1, 1,  1, 1,  1,  1, 8,  1, 1, 1,  1,  1]
    ]

let simple7MatrixGuards: [[Int]] =
    [[2, 1,  1, 1, 3,  0,  0,  2, 1,  1,  1,  3],
     [4, 6,  300, 6,31,  1,  1, 32, 6, 41, 40,  5],
     [1, 1, 34, 6, 6,  6,  6,  6,  6,  6, 6, 10],
     [0, 0,  4, 6, 6,  13, 6, 13, 6, 33, 1,  1],
     [0, 0,  4, 6, 6,  301,  14,  6, 6,  5, 0,  0],
     [2, 1, 32, 6, 6, 13,   6, 13, 6,  5, 0,  0],
     [9, 6, 6, 6,  6,  6, 6,  6,   6,  31, 3, 0],
     [4, 6, 300, 6, 40, 12, 6, 12,   6,  301, 5,  0],
     [1, 1, 1, 1,  1,  1, 8,  1,   1,  1, 1,  0]
    ]


let simple1MatrixGuardsPaths: [[myAction]] = [
    [myAction(actionType: .ROTATE_ACTION, duration: 1.5, startingPoint: CGPoint(x: 0,y: 0), endingPoint: CGPoint(x: 0,y: 0), angle: 90)
        ],
    [myAction(actionType: .ROTATE_ACTION, duration: 1.5, startingPoint: CGPoint(x: 0,y: 0), endingPoint: CGPoint(x: 0,y: 0), angle: 90)],
    [myAction(actionType: .ROTATE_ACTION, duration: 1.5, startingPoint: CGPoint(x: 0,y: 0), endingPoint: CGPoint(x: 0,y: 0), angle: -90)]
]

let simple2MatrixGuardsPaths : [[myAction]] = [
    [myAction(actionType: .ROTATE_ACTION, duration: 1.5, startingPoint: CGPoint(x: 0,y: 0), endingPoint: CGPoint(x: 0,y: 0), angle: -90),
     myAction(actionType: .PATH_ACTION, duration: 5, startingPoint: CGPoint(x: 1, y: 2), endingPoint: CGPoint(x: 8, y: 2), angle: 0),
     myAction(actionType: .ROTATE_ACTION, duration: 3, startingPoint: CGPoint(x: 0,y: 0), endingPoint: CGPoint(x: 0,y: 0), angle: 90),
    myAction(actionType: .PATH_ACTION, duration: 5, startingPoint: CGPoint(x: 8, y: 2), endingPoint: CGPoint(x: 1,y: 2), angle: 0)
    ],
    [myAction(actionType: .ROTATE_ACTION, duration: 1.5, startingPoint: CGPoint(x: 0,y: 0), endingPoint: CGPoint(x: 0,y: 0), angle: 90),
     myAction(actionType: .PATH_ACTION, duration: 5, startingPoint: CGPoint(x: 4, y: 9), endingPoint: CGPoint(x: 4, y: 6), angle: 0),
     myAction(actionType: .ROTATE_ACTION, duration: 3, startingPoint: CGPoint(x: 0,y: 0), endingPoint: CGPoint(x: 0,y: 0), angle: -90),
    myAction(actionType: .PATH_ACTION, duration: 5, startingPoint: CGPoint(x: 4, y: 6), endingPoint: CGPoint(x: 4,y: 9), angle: 0)
    ],
    [myAction(actionType: .ROTATE_ACTION, duration: 1.5, startingPoint: CGPoint(x: 0,y: 0), endingPoint: CGPoint(x: 0,y: 0), angle: -90),
     myAction(actionType: .PATH_ACTION, duration: 5, startingPoint: CGPoint(x: 2, y: 5), endingPoint: CGPoint(x: 6, y: 5), angle: 0),
     myAction(actionType: .ROTATE_ACTION, duration: 3, startingPoint: CGPoint(x: 0,y: 0), endingPoint: CGPoint(x: 0,y: 0), angle: -90),
    myAction(actionType: .PATH_ACTION, duration: 5, startingPoint: CGPoint(x: 6, y: 5), endingPoint: CGPoint(x: 2,y: 5), angle: 0)
    ]
]
