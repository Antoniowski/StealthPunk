//
//  Matrixes.swift
//  StealthProject
//
//  Created by Antonio Romano on 11/05/22.
//

import Foundation

typealias Matrix = [[Int]]


//STANZA DI SCAMBIO
let simple1Scambio: [[Int]] =
    [[2,1,1,1,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,15],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,8,1,1,1]
    ]

let simple2Scambio: [[Int]] =
    [[2,1,1,15,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [9,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]

let simple3Scambio: [[Int]] =
    [[2,1,1,7,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,15],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]

let simple4Scambio: [[Int]] =
    [[2,1,1,15,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,10],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,8,1,1,1]
    ]
    

//FORMA 1: 12X13
let simple1UP_DOWN: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1]
    ]

let simple1UP_DOWN_L: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [9, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1]
    ]

let simple1UP_DOWN_R: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 10],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1]
    ]

let simple1UP_L_R: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [9, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 10],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    ]


let simple1DOWN_R: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 10],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1]
    ]

let simple1DOWN_L: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [9, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1]
    ]

//FORMA 2: 9X7 (forma a C)
let simple2R_L_DOWN: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 3],
     [9, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 4, 6, 6, 5],
     [0, 0, 0, 4, 6, 6, 10],
     [0, 0, 0, 4, 6, 6, 5],
     [0, 0, 0, 4, 6, 6, 5],
     [2, 1, 1, 4, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 8, 1, 1, 1]
    ]

let simple2DOWN: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 4, 6, 6, 5],
     [0, 0, 0, 4, 6, 6, 5],
     [0, 0, 0, 4, 6, 6, 5],
     [0, 0, 0, 4, 6, 6, 5],
     [2, 1, 1, 4, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 8, 1, 1, 1]
    ]

let simple2R_L: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 3],
     [9, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 4, 6, 6, 5],
     [0, 0, 0, 4, 6, 6, 10],
     [0, 0, 0, 4, 6, 6, 5],
     [0, 0, 0, 4, 6, 6, 5],
     [2, 1, 1, 4, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 1]
    ]

let simple2DOWN_R: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 4, 6, 6, 5],
     [0, 0, 0, 4, 6, 6, 10],
     [0, 0, 0, 4, 6, 6, 5],
     [0, 0, 0, 4, 6, 6, 5],
     [2, 1, 1, 4, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 8, 1, 1, 1]
    ]

let simple2DOWN_L: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 3],
     [9, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 4, 6, 6, 5],
     [0, 0, 0, 4, 6, 6, 5],
     [0, 0, 0, 4, 6, 6, 5],
     [0, 0, 0, 4, 6, 6, 5],
     [2, 1, 1, 4, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 8, 1, 1, 1]
    ]

//FORMA 3: 8X12 (forma imbuto)
let simple1UP_DOWN_L_R: [[Int]] =
    [[2, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [9, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 10],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 4, 6, 6, 6, 6, 5, 1, 1, 1],
     [0, 0, 0, 4, 6, 6, 6, 6, 5, 0, 0, 0],
     [0, 0, 0, 1, 1, 8, 1, 1, 1, 0, 0, 0]
    ]

//PORTA A SX E SOTTO
let simple1L_UP: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [9, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1]
    ]

//PORTA A DX E SOTTO
let simple1R_DOWN: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 1, 3, 0, 0, 0, 0],
     [4, 6, 6, 6, 6, 6, 6, 5, 0, 0, 0, 0],
     [4, 6, 6, 6, 6, 6, 6, 5, 0, 0, 0, 0],
     [4, 6, 6, 6, 6, 6, 6, 5, 0, 0, 0, 0],
     [4, 6, 6, 6, 6, 6, 6, 5, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 10],
     [1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1]
    ]

//STANZE STRANE
let simpleFinale: [[Int]] =
    [[2, 1, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0],
     [4, 6, 6, 6, 5, 0, 0, 0, 0, 0, 0, 0],
     [4, 6, 6, 6, 5, 0, 0, 0, 0, 0, 0, 0],
     [4, 6, 6, 6, 5, 1, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5],
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5],
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5],
     [0, 0, 2, 1, 1, 1, 1, 1, 1, 1, 4, 5],
     [0, 0, 9, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    ]






//TAVERNA
let taverna: [[Int]] =
    [[0, 2, 1, 7, 1, 3, 0],
     [0, 4, 6, 6, 6, 5, 0],
     [0, 4, 6, 6, 6, 5, 0],
     [0, 1, 4, 6, 5, 1, 0],
     [0, 0, 4, 6, 5, 0, 0],
     [2, 1, 4, 6, 5, 1, 3],
     [4, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 1]
    ]





let prova1: Matrix =
    [[2,1,1,7,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]

let prova2: Matrix =
    [[2,1,1,1,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,8,1,1,1]
    ]
let prova3: Matrix =
    [[2,1,1,1,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [9,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]
let prova4: Matrix =
    [[2,1,1,1,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,10],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]
    








//PORTA SOTTO E SOPRA
let simple1Matrix: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 7, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1]
    ]

let simple2Matrix: [[Int]] =
    [[2, 1, 7, 1, 1, 1, 1, 1, 1,  3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 1, 8, 1, 1]
    ]

//PORTA SOTTO DX E SX
let simple3Matrix: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 3],
     [9, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 4, 6, 6, 5],
     [0, 0, 0, 4, 6, 6, 10],
     [0, 0, 0, 4, 6, 6, 5],
     [0, 0, 0, 4, 6, 6, 5],
     [2, 1, 1, 4, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 8, 1, 1, 1]
    ]

//PORTA SOPRA SX E DX
let simple4Matrix: [[Int]] =
    [[2, 1, 1, 1, 1, 7, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [9, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 10],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 4, 6, 6, 6, 6, 5, 1, 1, 1],
     [0, 0, 0, 4, 6, 6, 6, 6, 5, 0, 0, 0],
     [0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0]
    ]

//PORTA A SX E SOTTO
let simple5Matrix: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [9, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1]
    ]

//PORTA A DX E SOTTO
let simple6Matrix: [[Int]] =
    [[2, 1, 1, 1, 1, 1, 1, 3, 0, 0, 0, 0],
     [4, 6, 6, 6, 6, 6, 6, 5, 0, 0, 0, 0],
     [4, 6, 6, 6, 6, 6, 6, 5, 0, 0, 0, 0],
     [4, 6, 6, 6, 6, 6, 6, 5, 0, 0, 0, 0],
     [4, 6, 6, 6, 6, 6, 6, 5, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 10],
     [1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1]
    ]






//ARRAY DI STANZE DIVISI PER POSIZIONE PORTE

let STANZE_U: [RoomArchetype] = [.SIMPLE_1, .SIMPLE_2, .SIMPLE_4]
let STANZE_R: [RoomArchetype] = [.SIMPLE_3, .SIMPLE_4, .SIMPLE_6]
let STANZE_L: [RoomArchetype] = [.SIMPLE_3 , .SIMPLE_4, .SIMPLE_5]
let STANZE_D: [RoomArchetype] = [.SIMPLE_1, .SIMPLE_2, .SIMPLE_3, .SIMPLE_5, .SIMPLE_6]

let STANZE_U_1DOOR: [RoomArchetype] = [.PROVA1]
let STANZE_R_1DOOR: [RoomArchetype] = [.PROVA4]
let STANZE_L_1DOOR: [RoomArchetype] = [.PROVA3]
let STANZE_D_1DOOR: [RoomArchetype] = [.PROVA2]

//let STANZE_FINALI_U: [RoomArchetype]
//let STANZE_FINALI_R: [RoomArchetype]
//let STANZE_FINALI_L: [RoomArchetype]
//let STANZE_FINALI_D: [RoomArchetype]
