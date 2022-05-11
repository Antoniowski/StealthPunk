//
//  HideoutObject.swift
//  StealthProject
//
//  Created by Antonio Romano on 10/05/22.
//

import Foundation
import SpriteKit

enum HideoutCategory: Int{
    case CLOSET = 0
}

class Hideout: InteractableObject{
    private var hideoutCategory: HideoutCategory = .CLOSET
    
    func getHideoutCategory()->HideoutCategory{
        return self.hideoutCategory
    }
    
    func setHideoutCategory(_ newCategory: HideoutCategory){
        self.hideoutCategory = newCategory
    }
    
    func action(player: PlayableCharacter) {
//        player.setHiddenStatus(true)
        player.setEnteringStatus(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            player.setActionState(.HIDDEN)
        })
    }
}
