//
//  OpOverloading.swift
//  StealthProject
//
//  Created by Antonio Romano on 02/05/22.
//

import Foundation
import SpriteKit

func +(left: CGVector, right: CGVector)->CGVector{
    let newX = left.dx + right.dx
    let newY = left.dy + right.dy
    return CGVector(dx: newX, dy: newY)
}

func *(left: CGVector, right: CGVector)->CGVector{
    let newX = left.dx * right.dx
    let newY = left.dy * right.dy
    return CGVector(dx: newX, dy: newY)
}

func *(left: CGVector, right: Double)->CGVector{
    let newX = left.dx * right
    let newY = left.dy * right
    return CGVector(dx: newX, dy: newY)
}

func *(left: CGVector, right: CGVector)->Double{
    let newX = left.dx * right.dx
    let newY = left.dy * right.dy
    return newX+newY
}

func +=(left: inout CGVector, right: CGVector){
    left.dx += right.dx
    left.dy += right.dy
}

func *=(left: inout CGVector, right: CGVector){
    left.dx *= right.dx
    left.dy *= right.dy
}

extension Float {
    func rounded(digits: Int) -> Float {
        let multiplier = pow(10.0, Float(digits))
        return (self * multiplier).rounded() / multiplier
    }
}
