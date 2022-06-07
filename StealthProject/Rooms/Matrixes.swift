
//
//  Matrixes.swift
//  StealthProject
//
//  Created by Antonio Romano on 11/05/22.
//




// 0 - VOID
// 1 - FRONT WALL
// 2 - LEFT ANGLE
// 3 - RIGHT ANGLE
// 4 - LEFT WALL
// 5 - RIGHT WALL
// 6 - NEEDED FOR FLOOR
// 7 - UP DOOR
// 8 - DOWN DOOR
// 9 - LEFT DOOR
// 10 - RIGHT DOOR
// 11 - LOBBY DOOR
// 15 - CHANGE ROOM OBJECT
// 31 - ANGOLO INTERNO DX
// 32 - ANGOLO INTERNO SX
// 33 - ANGOLO INTERNO DX 2
// 34 - ANGOLO INTERNO SX 2
// 
// TAVERNA OGGETTI
// 16 - BARILI
// 17 - TAVOLINI
// 18 - BANCONE1
// 19 - BANCONE2
// 20 - FORZIERE
// 21 - BARILI SX
//

// OGGETTI STATICI
// 12 - COLONNA - COLONNA
// 13 - TECA GRANDE - COLONNA
// 14 - TECA PICCOLA - LAMPIONE
// 15 - OGGETTO CAMBIO STANZA
// 40 - ARMADIO - CESPUGLIO
// 41 - PANCA - CESPUGLIO
//
// SECONDARY CHARACTERS
// 50 - CHARACTER2
// 51 - CHARACTER3
// 52 - CHARACTER4


//OGGETTI DINAMICI
//100


import Foundation

typealias Matrix = [[Int]]

    

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
    [[2, 1, 1, 1, 1, 1, 3, 0, 0, 0, 0],
     [9, 6, 6, 6, 6, 6, 5, 0, 0, 0, 0],
     [1, 1, 1, 4, 6, 6, 5, 1, 1, 1, 3],
     [0, 0, 0, 4, 6, 6, 6, 6, 6, 6, 10],
     [0, 0, 0, 4, 6, 6, 5, 1, 1, 1, 1],
     [0, 0, 0, 4, 6, 6, 5, 0, 0, 0, 0],
     [2, 1, 1, 4, 6, 6, 5, 0, 0, 0, 0],
     [4, 6, 6, 6, 6, 6, 5, 0, 0, 0, 0],
     [1, 1, 1, 8, 1, 1, 1, 0, 0, 0, 0]
    ]

let simple2DOWN: [[Int]] =
[[2, 1, 1, 1, 1, 1, 3, 0, 0, 0, 0],
 [4, 6, 6, 6, 6, 6, 5, 0, 0, 0, 0],
 [1, 1, 1, 4, 6, 6, 5, 1, 1, 1, 3],
 [0, 0, 0, 4, 6, 6, 6, 6, 6, 6, 1],
 [0, 0, 0, 4, 6, 6, 5, 1, 1, 1, 1],
 [0, 0, 0, 4, 6, 6, 5, 0, 0, 0, 0],
 [2, 1, 1, 4, 6, 6, 5, 0, 0, 0, 0],
 [4, 6, 6, 6, 6, 6, 5, 0, 0, 0, 0],
 [1, 1, 1, 8, 1, 1, 1, 0, 0, 0, 0]
]

let simple2R_L: [[Int]] =
[[2, 1, 1, 1, 1, 1, 3, 0, 0, 0, 0],
 [9, 6, 6, 6, 6, 6, 5, 0, 0, 0, 0],
 [1, 1, 1, 4, 6, 6, 5, 1, 1, 1, 3],
 [0, 0, 0, 4, 6, 6, 6, 6, 6, 6, 10],
 [0, 0, 0, 4, 6, 6, 5, 1, 1, 1, 1],
 [0, 0, 0, 4, 6, 6, 5, 0, 0, 0, 0],
 [2, 1, 1, 4, 6, 6, 5, 0, 0, 0, 0],
 [4, 6, 6, 6, 6, 6, 5, 0, 0, 0, 0],
 [1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0]
]

let simple2DOWN_R: [[Int]] =
[[2, 1, 1, 1, 1, 1, 3, 0, 0, 0, 0],
 [1, 6, 6, 6, 6, 6, 5, 0, 0, 0, 0],
 [1, 1, 1, 4, 6, 6, 5, 1, 1, 1, 3],
 [0, 0, 0, 4, 6, 6, 6, 6, 6, 6, 10],
 [0, 0, 0, 4, 6, 6, 5, 1, 1, 1, 1],
 [0, 0, 0, 4, 6, 6, 5, 0, 0, 0, 0],
 [2, 1, 1, 4, 6, 6, 5, 0, 0, 0, 0],
 [4, 6, 6, 6, 6, 6, 5, 0, 0, 0, 0],
 [1, 1, 1, 8, 1, 1, 1, 0, 0, 0, 0]
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
     [4, 6, 6, 6, 6, 6, 6, 5, 0, 2, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 5, 0, 4, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 5, 0, 4, 6, 10],
     [4, 6, 6, 6, 6, 6, 6, 5, 1, 1, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 8, 1, 1, 1, 1, 1]
    ]

//STANZE STRANE
let simpleFinale_L: [[Int]] =
    [[2, 1, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0],
     [4, 6, 101, 6, 5, 0, 0, 0, 0, 0, 0, 0],
     [4, 6, 6, 6, 5, 0, 0, 0, 0, 0, 0, 0],
     [4, 6, 6, 6, 5, 1, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5],
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5],
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5],
     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5],
     [9, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    ]

let simpleFinale_D: [[Int]] =
    [[2, 1, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0],
     [4, 6, 6, 6, 5, 0, 0, 0, 0, 0, 0, 0],
     [4, 6, 6, 6, 5, 0, 0, 0, 0, 0, 0, 0],
     [4, 6, 6, 6, 5, 1, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5],
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5],
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5],
     [2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 8, 1, 1, 1, 1, 1, 1, 1]
    ]

let simpleFinale_R: [[Int]] =
    [[2, 1, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0],
     [4, 6, 6, 6, 5, 0, 0, 0, 0, 0, 0, 0],
     [4, 6, 6, 6, 5, 0, 0, 0, 0, 0, 0, 0],
     [4, 6, 6, 6, 5, 1, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5],
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5],
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5],
     [2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 10],
     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    ]

let simpleFinale_U: [[Int]] =
    [[1, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5],
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5],
     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 5],
     [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 5],
     [4, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 5],
     [4, 6, 6, 6, 5, 1, 1, 1, 1, 1, 1, 3],
     [4, 6, 6, 6, 5, 0, 0, 0, 0, 0, 0, 0],
     [4, 6, 6, 6, 5, 0, 0, 0, 0, 0, 0, 0],
     [2, 1, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0]
    ]



//TAVERNA
let taverna: [[Int]] =
    [[0,  2,  1,  11, 1,  3,  0],
     [0,  4,  18, 6,  20, 5,  0],
     [0,  4,  19, 6,  16, 5,  0],
     [0,  1,  4,  6,  5,  1,  0],
     [0,  0,  4,  6,  5,  0,  0],
     [2,  1,  32, 6, 31,  1,  3],
     [4,  17, 51,  6,  6,  17, 5],
     [4,  21, 6,  6,  6,  16, 5],
     [4,  17, 6,  6,  52,  17, 5],
     [4,  50,  6,  6,  6,  6,  5],
     [1,  1,  1,  1,  1,  1,  1]
    ]

let tavernaPavimento: Matrix =
    [[0,  1,  4,  1,  5,  1,  0],
     [0,  1,  1,  1,  1,  1,  0],
     [0,  1,  1,  1,  1,  1,  0],
     [0,  1,  1,  1,  1,  1,  0],
     [0,  0,  1,  1,  1,  0,  0],
     [1,  4,  1,  1,  1,  4,  1],
     [1,  1,  1,  1,  1,  1,  1],
     [1,  1,  1,  1,  1,  1,  1],
     [1,  1,  1,  1,  1,  1,  1],
     [1,  1,  1,  1,  1,  1,  1],
     [1,  1,  1,  1,  1,  1,  1]
    ]



let prova1: Matrix =
    [[2,1,1,7,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,14,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]

let prova1Pavimento: Matrix =
    [[1, 7, 6, 1, 6, 7, 1],
     [1, 1, 1,12, 1, 1, 1],
     [1, 1,12,12,12, 1, 1],
     [1, 1,12,12,12, 1, 1],
     [1, 1,12,12,12, 1, 1],
     [1, 1, 1, 1, 1, 1, 1],
     [1, 1, 1, 1, 1, 1, 1]
    ]



let prova1Scrigno: Matrix =
    [[2,1,1,7,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,100,6,6,5],
     [4,6,6,6,6,6,5],
     [4,14,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]

let prova1ScrignoPavimento: Matrix =
    [[2, 1, 1,  1, 1, 1, 3],
     [4, 6, 6,  6, 6, 6, 5],
     [4, 6,11, 16,10, 6, 5],
     [4, 6,14, 12,13, 6, 5],
     [4, 6,18, 15,17, 6, 5],
     [4,14, 6,  6, 6, 6, 5],
     [1, 1, 1,  1, 1, 1, 1]
    ]


let prova2: Matrix =
    [[2,1,1,1,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,14,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,8,1,1,1]
    ]

let prova2Scrigno: Matrix =
    [[2,1,1,1,1,1,3],
     [4,6,6,6,6,14,5],
     [4,6,6,6,6,6,5],
     [4,6,6,100,6,6,5],
     [4,6,6,6,6,6,5],
     [4,14,6,6,6,6,5],
     [1,1,1,8,1,1,1]
    ]

let prova2Pavimento: Matrix =
    [[1,6,1,7,1,6,1],
     [1,1,1,1,1,1,1],
     [1,1,12,12,12,1,1],
     [1,1,12, 1,12,1,1],
     [1,1,12,12,12,1,1],
     [1,1,1,1,1,1,1],
     [1,1,1,1,1,1,1]
    ]


let prova3: Matrix =
    [[2,1,1,1,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [9,6,6,14,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]
let prova3Scrigno: Matrix =
    [[2,1,1,1,1,1,3],
     [4,6,6,6,6,14,5],
     [4,6,6,6,6,6,5],
     [9,6,6,100,6,6,5],
     [4,6,6,6,6,6,5],
     [4,14,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]

let prova3Pavimento: Matrix =
    [[1,6,1,7,1,6,1],
     [1,1,1,1,1,1,1],
     [1,1,11,16,10,1,1],
     [1,1,14,12,13,1,1],
     [1,1,18,15,17,1,1],
     [1,1,1,1,1,1,1],
     [1,1,1,1,1,1,1]
    ]

let prova4: Matrix =
    [[2,1,1,1,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,14,6,6,10],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]
    
let prova4Scrigno: Matrix =
    [[2,1,1,1,1,1,3],
     [4,6,6,6,6,14,5],
     [4,6,6,6,6,6,5],
     [4,6,6,100,6,6,10],
     [4,6,6,6,6,6,5],
     [4,14,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]

let prova4Pavimento: Matrix =
    [[1,6,1,7,1,6,1],
     [1,1,1,1,1,1,1],
     [1,1,11,16,13,1,1],
     [1,1,14,12,13,1,1],
     [1,1,18,15,17,1,1],
     [1,1,1,1,1,1,1],
     [1,1,1,1,1,1,1]
    ]

//PORTA SOTTO E SOPRA
let simple1Matrix: [[Int]] =
    [[2,  1,  1,  1,  1,  1,  7,  1,  1,  1,  3],
     [4,  6,  40, 6,  6,  12, 6,  12, 6,  6,  5],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  14, 5],
     [4,  6,  13, 6, 13,  6,  13, 6, 13,   6, 5],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [4,  41, 6,  6,  6,  12, 6,  12, 6,  6,  5],
     [1,  1,  1,  1,  1,  1,  8,  1,  1,  1,  1]
    ]
let simple1MatrixPavimento: [[Int]] =
    [[1,  1,  7,  1,  7,  6,  1,  6,  7,  1,  1],
     [1,  1,  1,  1,  1,  1, 12, 12,  1,  1,  1],
     [9,  1,  1,  1,  1,  1, 12, 12,  1,  1,  8],
     [1,  1, 12, 12, 12, 12, 12, 12, 12, 12,  1],
     [1,  1, 12, 12, 12, 12, 12, 12, 12, 12,  1],
     [1,  1, 12, 12, 12, 12, 12, 12, 12, 12,  1],
     [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
     [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1]
    ]



let simple2Matrix: [[Int]] =
    [[2,  1,  7,  1,  1,  1,  1,  1,  1,  3],
     [4, 12,  6, 12,  6, 40,  6,  6,  6,  5],
     [4,  6,  6,  6,  6,  6,  6,  6, 13,  5],
     [4,  6,  6,  6,  6,  6,  6, 41,  6,  5],
     [4,  6,  6,  6, 14,  6,  6,  6,  6,  5],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [4,  6, 13,  6, 13,  6, 12,  6, 12,  5],
     [1,  1,  1,  1,  1,  1,  1,  8,  1,  1]
    ]

let simple2MatrixPavimento: [[Int]] =
[[1,  6,  1,  1,  7,  1,  6,  7,  1,  1],
 [1,  1, 12, 12,  1,  1,  1,  1,  1,  1],
 [1,  1, 12, 12,  1,  1,  1,  1,  1,  1],
 [9,  1, 12, 12, 12, 12, 12, 12,  1,  8],
 [1,  1, 12, 12, 12, 12, 12, 12,  1,  1],
 [1,  1, 12, 12, 12, 12, 12, 12,  1,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1]
]


//PORTA SOTTO DX E SX
let simple3Matrix: [[Int]] =
    [[2,  1,  1,  1,  1,  1,  3,  0,  0,  0,  0],
     [9,  6,  6,  6,  6, 40,  5,  0,  0,  0,  0],
     [1,  1,  1,  4,  6,  6,  6,  1,  1,  1,  3],
     [0,  0,  0,  4, 12,  6,  6,  6,  6,  6, 10],
     [0,  0,  0,  4, 14,  6,  5,  1,  1,  1,  1],
     [0,  0,  0,  4,  6,  6,  5,  0,  0,  0,  0],
     [2,  1,  1,  32, 6, 13,  5,  0,  0,  0,  0],
     [4,  6,  6,   6, 6,  6,  5,  0,  0,  0,  0],
     [1,  1,  1,   1, 1,  1,  1,  0,  0,  0,  0]
    ]

let simple3MatrixPavimento: [[Int]] =
[[1,  1,  7,  6,  7,  1,  1,  1,  1,  1,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
 [1,  1,  1,  1, 12, 12,  1,  1,  1,  1,  1],
 [1,  1,  1,  1, 12, 12,  1,  1,  1,  1,  1],
 [1,  1,  1,  1, 12, 12,  1,  1,  1,  1,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
 [9,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1]
]



//PORTA SOPRA SX E DX
let simple4Matrix: [[Int]] =
    [[2, 1,  1, 1, 1, 7, 1, 1,   1, 1, 1,  3],
     [4, 6, 40, 6, 6, 6, 6, 6, 41, 41, 6,  5],
     [4, 6,  6, 6, 6, 6, 6, 6,  6,  6, 6,  5],
     [9, 6, 6, 6, 6, 13, 14,13, 6, 6, 6, 10],
     [4, 6, 6, 6, 6,  6,  6,  6, 6, 6, 6,  5],
     [1, 1, 1, 4, 6,  6,  6,  6, 5, 1, 1,  1],
     [0, 0, 0, 4, 6,  6,  6,  6, 5, 0, 0,  0],
     [0, 0, 0, 1, 1,  1,  1,  1, 1, 0, 0,  0]
    ]
let simple4MatrixPavimento: [[Int]] =
[[1,  1,  1,  7,  1,  1,  1,  7,  1,  1,  1,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
 [1,  1,  1,  1, 11, 16, 16, 16, 10,  1,  1,  8],
 [1,  1,  1,  1, 14, 12, 12, 12, 13,  1,  1,  1],
 [1,  1,  1,  1, 14, 12, 12, 12, 13,  1,  1,  8],
 [1,  1,  1,  1, 18, 15, 15, 15, 17,  1,  1,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1]
]


//PORTA A SX E SOTTO
let simple5Matrix: [[Int]] =
    [[2,  1,  1,   1,  1,  1,    1,   1,  1,  1,  1,  1,  1, 3],
     [4,  6,  41,  6,  6,  6,    6,   6,  6,  6,  6, 40, 40, 5],
     [4,  6,   6,  6,  6,  6,    6,   6,  6,  6,  6,  6,  6, 5],
     [4, 12,   6,  6,  6,  13,  13,  14, 13,  6, 13,  6,  6, 5],
     [9,  6,   6,  6,  6,   6,   6,   6,  6,  6, 6,   6,  6, 5],
     [4, 12,   6,  6,  6,  6,    6,   6,  6,  6, 6,   6,  6, 5],
     [4,  6,   6,  6, 40,  6,    6,  12,  6, 12, 6,   6,  6, 5],
     [1,  1,   1,  1,  1,  1,    1,   1,  8,  1, 1,   1,  1, 1]
    ]

let simple5MatrixPavimento: [[Int]] =
[[1,  7,  7,  7,  1,  1,  1,  1,  1,  1,  7,  7,  7,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
 [1,  1,  1,  1, 11, 16, 16, 16, 16, 16, 10,  1,  1,  1],
 [9,  1,  1,  1, 14, 12, 12, 12, 12, 12, 13,  1,  1,  8],
 [1,  1,  1,  1, 14, 12, 12, 12, 12, 12, 13,  1,  1,  1],
 [1,  1,  1,  1, 18, 15, 15, 15, 15, 15, 17,  1,  1,  1],
 [1,  1,  1,  1, 1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1]
]



//PORTA A DX E SOTTO
let simple6Matrix: [[Int]] =
[[2, 1, 1,  1,  1,  1,  1, 3, 0, 0,  0,  0],
 [4, 6, 6,  6,  6,  6, 40, 5, 0, 2,  1,  3],
 [4, 6, 13, 6, 13,  6,  6, 5, 0, 4,  6, 10],
 [4, 6, 6, 12,  6,  6,  6, 5, 0, 4,  6,  5],
 [4, 6, 13, 6, 13,  6, 6, 31, 1, 32, 6,  5],
 [4, 6,  6, 6,  6,  6, 6,  6, 6,  6, 6,  5],
 [4, 6,  6, 6,  6, 12, 6, 12, 6,  6, 41, 5],
 [1, 1,  1, 1,  1,  1, 8,  1, 1, 1,  1,  1]
]

let simple6MatrixPavimento: [[Int]] =
[[1,  1,  7,  1,  7,  1,  1,  1,  1,  1,  1,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
 [1, 11, 16, 16, 16, 10,  1,  1,  1,  1,  1,  1],
 [1, 14, 12, 12, 12, 13,  1,  1,  1,  1,  1,  1],
 [1 ,18, 15, 15, 15, 17,  1,  1,  1,  1,  1,  8],
 [1, 1 , 1 , 1 , 1 , 1 ,  1,  1,  1,  1,  1,  1],
 [1, 1 , 1 , 1 , 1 , 1 ,  1,  1,  1,  1,  1,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1]
]


let simple7Matrix: [[Int]] =
    [[2, 1,  1, 1, 3,  0,  0,  2, 1,  1,  1,  3],
     [4, 6,  6, 6,31,  1,  1, 32, 6, 41, 40,  5],
     [1, 1, 34, 6, 6,  6,  6,  6,  6,  6, 6, 10],
     [0, 0,  4, 6, 6,  13, 6, 13, 6, 33, 1,  1],
     [0, 0,  4, 6, 6,  6,  14,  6, 6,  5, 0,  0],
     [2, 1, 32, 6, 6, 13,   6, 13, 6,  5, 0,  0],
     [9, 6, 6, 6,  6,  6, 6,  6,   6,  31, 3, 0],
     [4, 6, 6, 6, 40, 12, 6, 12,   6,  6, 5,  0],
     [1, 1, 1, 1,  1,  1, 8,  1,   1,  1, 1,  0]
    ]
let simple7MatrixPavimento: [[Int]] =
[[1,  1,  7,  1,  1,  1,  1,  1,  1,  1,  7,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
 [1,  1,  1,  1,  1, 12, 12, 12, 12,  1,  1,  1],
 [1,  1,  1,  1,  1, 12, 12, 12, 12,  1,  1,  1],
 [1,  1,  1,  1,  1, 12, 12, 12, 12,  1,  1,  1],
 [1,  1,  1,  1,  1, 12, 12, 12, 12,  1,  1,  1],
 [9,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1],
 [1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1]
]




//STANZA DI SCAMBIO GIU
let simple1Scambio: [[Int]] =
    [[2,1,1,15,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,8,1,1,1]
    ]

//SINISTRA
let simple2Scambio: [[Int]] =
    [[2,1,1,15,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [9,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]

let simple2ScambioPavimento: [[Int]] =
    [[2,1,1,15,1,1,3],
     [4,6,14,12,13,6,5],
     [4,6,18,15,17,6,5],
     [9,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]
//SU
let simple3Scambio: [[Int]] =
    [[2,1,1,7,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,15,1,1,1]
    ]

let simple3ScambioPavimento: [[Int]] =
    [[2,1,1,7,1,1,3],
     [4,6,12,12,12,6,5],
     [4,6,12,12,12,12,5],
     [4,6,12,12,12,12,5],
     [4,6,12,12,12,12,5],
     [4,6,6,6,6,6,5],
     [1,1,1,15,1,1,1]
    ]
//DESTRA
let simple4Scambio: [[Int]] =
    [[2,1,1,15,1,1,3],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,10],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]

let simple4ScambioPavimento: [[Int]] =
    [[2,1,1,15,1,1,3],
     [4,6,14,12,13,6,5],
     [4,6,18,15,17,6,5],
     [4,6,6,6,6,6,10],
     [4,6,6,6,6,6,5],
     [4,6,6,6,6,6,5],
     [1,1,1,1,1,1,1]
    ]

let simple1Iniziale : [[Int]] =
    [[2,  1,  1,  1,  1,  1,  7,  1,  1,  1,  3],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [1,  1,  1,  1,  1,  1,  8,  1,  1,  1,  1]
    ]

let simple3Iniziale : [[Int]] =
    [[2,  1,  1,  1,  1,  1,  3,  0,  0,  0,  0],
     [9,  6,  6,  6,  6,  6,  5,  0,  0,  0,  0],
     [1,  1,  1,  4,  6,  6,  6,  1,  1,  1,  3],
     [0,  0,  0,  4,  6,  6,  6,  6,  6,  6, 10],
     [0,  0,  0,  4,  6,  6,  5,  1,  1,  1,  1],
     [0,  0,  0,  4,  6,  6,  5,  0,  0,  0,  0],
     [2,  1,  1,  6,  6,  6,  5,  0,  0,  0,  0],
     [4,  6,  6,  6,  6,  6,  5,  0,  0,  0,  0],
     [1,  1,  1,  1,  1,  1,  1,  0,  0,  0,  0]
    ]

let simple4Iniziale : [[Int]] =
    [[2,  1,  1,  1,  1,  7,  1,  1,  1,  1,  1,  3],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [9,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6, 10],
     [4,  6,  6,  6,  6,  6,  6,  6,  6,  6,  6,  5],
     [1,  1,  1,  4,  6,  6,  6,  6,  5,  1,  1,  1],
     [0,  0,  0,  4,  6,  6,  6,  6,  5,  0,  0,  0],
     [0,  0,  0,  1,  1,  1,  1,  1,  1,  0,  0,  0]
    ]




//ARRAY DI STANZE DIVISI PER POSIZIONE PORTE

let STANZE_U: [RoomArchetype] = [.SIMPLE_1, .SIMPLE_2, .SIMPLE_4]
let STANZE_R: [RoomArchetype] = [.SIMPLE_3, .SIMPLE_4, .SIMPLE_6, .SIMPLE_7]
let STANZE_L: [RoomArchetype] = [.SIMPLE_3 , .SIMPLE_4, .SIMPLE_5, .SIMPLE_7]
let STANZE_D: [RoomArchetype] = [.SIMPLE_1, .SIMPLE_2, .SIMPLE_5, .SIMPLE_6, .SIMPLE_7]


let STANZE_D_NO_SX : [RoomArchetype] = [.SIMPLE_1, .SIMPLE_2]
let STANZE_R_NO_UP : [RoomArchetype] = [.SIMPLE_3, .SIMPLE_5, .SIMPLE_7]
let STANZE_L_NO_UP : [RoomArchetype] = [.SIMPLE_3, .SIMPLE_6, .SIMPLE_7]
 
let STANZE_U_1DOOR: [RoomArchetype] = [.PROVA1, .PROVA1, .PROVA1, .PROVA1, .PROVA1, .PROVA1, .PROVA1, .PROVA1, .PROVA1, .PROVA1POWERUP]
let STANZE_R_1DOOR: [RoomArchetype] = [.PROVA4,.PROVA4,.PROVA4,.PROVA4,.PROVA4,.PROVA4,.PROVA4,.PROVA4,.PROVA4, .PROVA4POWERUP]
let STANZE_L_1DOOR: [RoomArchetype] = [.PROVA3,.PROVA3,.PROVA3,.PROVA3,.PROVA3,.PROVA3,.PROVA3,.PROVA3,.PROVA3, .PROVA3POWERUP]
let STANZE_D_1DOOR: [RoomArchetype] = [.PROVA2,.PROVA2,.PROVA2,.PROVA2,.PROVA2,.PROVA2,.PROVA2,.PROVA2,.PROVA2, .PROVA2POWERUP]

let STANZE_FINALI_D: [RoomArchetype] = [.SCAMBIO1]
let STANZE_FINALI_L: [RoomArchetype] = [.SCAMBIO2]
let STANZE_FINALI_U: [RoomArchetype] = [.SCAMBIO3]
let STANZE_FINALI_R: [RoomArchetype] = [.SCAMBIO4]

let FINALE_DOWN : [RoomArchetype] = [.FINALE_D]
let FINALE_UP: [RoomArchetype] = [.FINALE_U]
let FINALE_LEFT : [RoomArchetype] = [.FINALE_L]
let FINALE_RIGHT : [RoomArchetype] = [.FINALE_R]

