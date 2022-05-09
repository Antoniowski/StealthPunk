//
//  UsableObject.swift
//  StealthProject
//
//  Created by Antonio Romano on 09/05/22.
//

import Foundation
import SpriteKit

enum UsableObjectCategory: Int{
    case SWITCH = 0
}

class UsableObject: InteractableObject{
    private var usableCategory: UsableObjectCategory = .SWITCH
    
    //GET FUNCTIONS
    
    func getUsableCategory()->UsableObjectCategory{
        return self.usableCategory
    }
    
    func setUsableCategory(_ newCategory: UsableObjectCategory){
        self.usableCategory = newCategory
    }
}
