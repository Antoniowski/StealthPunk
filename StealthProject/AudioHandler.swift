//
//  AudioHandler.swift
//  StealthProject
//
//  Created by Guendalina De Laurentis on 01/06/22.
//

import Foundation
import AVFoundation
import SwiftUI

class Music{
    
    static let instance = Music()
    
    let doorTaverna : String = "doorTaverna"
    let door : String = "door"
    let door2 : String = "door2"
    let panca : String = "pancaOpenCorto"
    let bushExit : String = "BushExit"
    let bushEnter : String = "BushEnter"
    let cabinetOpen : String = "closeCabinet"
    let cabinetClose : String = "openCabinet"
    let vetrna : String = "vetrina"
    let bonk : String = "BONK"
    let gear : String = "GearSound"
    let pagina : String = "pagina"
    let footstep1 : String = "SingleFootstep"
    let footstep2 : String = "SingleFootstep2"
    let swing : String = "swing"
    let footstep3 : String = "footsteps"
    let grassfootstep : String = "grassFootsteps"
    
    var soundEffects : AVAudioPlayer = AVAudioPlayer()
    var musicEffect : AVAudioPlayer = AVAudioPlayer()
    
    var soundOn : Bool = false
    
    var audioOn : Bool = false
    
    func starsSound( file named: String){
        
    }
    
    func stopSound(){
        soundEffects.stop()
    }
    
    func muteSound(){
        soundOn = false
    }

    func unmuteSound(){
        soundOn = true
    }
    
}
