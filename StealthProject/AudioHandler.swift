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
    
    let doorTaverna : String = "doorTaverna.wav"
    let door : String = "door.wav"
    let door2 : String = "door2.wav"
    let panca : String = "pancaOpenCorto.wav"
    let bushExit : String = "BushExit.wav"
    let bushEnter : String = "BushEnter.wav"
    let cabinetClose : String = "closeCabinet.wav"
    let cabinetOpen : String = "openCabinet.wav"
    let vetrna : String = "vetrina.wav"
    let bonk : String = "BONK.mp3"
    let gear : String = "GearSound.wav"
    let pagina : String = "pagina.wav"
    let footstep1 : String = "SingleFootstep.mp3"
    let footstep2 : String = "SingleFootstep2.wav"
    let swing : String = "swing.wav"
    let footstep3 : String = "footsteps.mp3"
    let grassfootstep : String = "grassFootsteps.mp3"
    
    var soundEffects : AVAudioPlayer = AVAudioPlayer()
    var musicEffect : AVAudioPlayer = AVAudioPlayer()
    
    var soundOn : Bool = true
    
    var audioOn : Bool = true
    
    func starsSound( filenamed: String){
        if(self.soundOn){
            let resourceUrl = Bundle.main.url(forResource:
             filenamed , withExtension: nil)
            do {
              try soundEffects = AVAudioPlayer(contentsOf: resourceUrl!)
                soundEffects.volume = 0.3
                soundEffects.prepareToPlay()
                soundEffects.play()
              } catch {
                print("Could not create audio player!")
            return
            }
            self.soundEffects.play()
        }
    }
    
    func startMusic( filenamed: String){
        if(self.audioOn){
            let resourceUrl = Bundle.main.url(forResource:
             filenamed , withExtension: nil)
            do {
              try musicEffect = AVAudioPlayer(contentsOf: resourceUrl!)
                musicEffect.volume = 0.3
                musicEffect.numberOfLoops = -1
                musicEffect.prepareToPlay()
                musicEffect.play()
              } catch {
                print("Could not create audio player!")
            return
            }
            self.musicEffect.play()
        }
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


let music = Music()
