//
//  Dimension.swift
//  StealthProject
//
//  Created by Gennaro Cirillo on 10/05/22.
//


//DIMENSIONI ORIGINALI:
//GUARDIA CONO GRANDE: 300x600
//GUARDIA CONO PICCOLO: 200x400
//GUARDIA CERCHIO GRANDE: 300x600

import Foundation
import SpriteKit
import SwiftUI

//Variabile che tiene conto della morte/perdita della partita
var loseFlag: Bool = false

//Variabili per far scendere il tempo
let moltiplicatoreTempo4 = 8
let moltiplicatoreTempo2 = 2
let moltiplicatoreTempo3 = 4
var moltiplicatoreTempo = 1

let blocco : Int = 100
let bloccoSize: CGSize = CGSize(width: blocco, height: blocco)


//Dimensioni delle sprite delle guardie
let dimensioneGuardiaConoGrandeWidth: Double = 45
let dimensioneGuardiaConoGrandeHeight: Double = 90

let dimensioneGuardiaConoPiccoloWidth: Double = dimensioneGuardiaConoGrandeWidth / 1.5
let dimensioneGuardiaConoPiccoloHeight: Double = dimensioneGuardiaConoGrandeHeight / 1.5

let dimensioneGuardiaCerchioGrandeWidth: Double = 45
let dimensioneGuardiaCerchioGrandeHeight: Double = 90

