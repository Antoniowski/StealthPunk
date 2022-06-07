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
    let hit01: String = "hit1.wav"
    let hit02: String = "hit2.wav"
    let failedHit01: String = "failedImpact.wav"
    let whoosh: String = "whoosh.wav"
    let menu: String = "MenuSound.wav"
    let horse: String = "Horse.mp3"
    
    var soundEffects : AVAudioPlayer!
    var musicEffect : AVAudioPlayer!
    var soundEffects2: AVAudioPlayer!
    
    var soundOn : Bool = true
    
    var audioOn : Bool = true
    
    var volume: Float = 0.4
    var musicVolume: Float = 0.4
    
    func starsSound( filenamed: String){
        if(self.soundOn){
            let resourceUrl = Bundle.main.url(forResource:
             filenamed , withExtension: nil)
            do {
              try soundEffects = AVAudioPlayer(contentsOf: resourceUrl!)
                soundEffects.volume = volume
                soundEffects.prepareToPlay()
                soundEffects.play()
              } catch {
                print("Could not create audio player!")
            return
            }
//            self.soundEffects.play()
        }
    }
    
    func starsSound2( filenamed: String){
        if(self.soundOn){
            let resourceUrl = Bundle.main.url(forResource:
             filenamed , withExtension: nil)
            do {
              try soundEffects2 = AVAudioPlayer(contentsOf: resourceUrl!)
                soundEffects2.volume = volume
                soundEffects2.prepareToPlay()
                soundEffects2.play()
              } catch {
                print("Could not create audio player!")
            return
            }
//            self.soundEffects.play()
        }
    }
    
    func startMusic( filenamed: String){
        if(self.audioOn){
            let resourceUrl = Bundle.main.url(forResource:
             filenamed , withExtension: nil)
            do {
              try musicEffect = AVAudioPlayer(contentsOf: resourceUrl!)
                musicEffect.volume = musicVolume
                musicEffect.numberOfLoops = -1
                musicEffect.prepareToPlay()
                musicEffect.play()
              } catch {
                print("Could not create audio player!")
            return
            }
//            self.musicEffect.play()
        }
    }
    
    func stopSound(){
        soundEffects.stop()
    }
    
    func stopEffect2(){
        guard soundEffects2 != nil else{
            return
        }
        soundEffects2.stop()
    }
    
    func stopMusic(){
        musicEffect.stop()
    }
    
    func muteSound(){
        soundOn = false
    }

    func unmuteSound(){
        soundOn = true
    }
    
}


let music = Music()
