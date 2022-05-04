//
//  VirtualController.swift
//  StealthProject
//
//  Created by Antonio Romano on 03/05/22.
//

import Foundation
import GameController





class MyVirtualControllerClass {
        
    private var _virtualController: Any?
    public var virtualController: GCVirtualController? {
        get { return self._virtualController as? GCVirtualController }
        set { self._virtualController = newValue }
    }
    
    
    func setUpGameController(){
        if #available(iOS 15.0, *)
        {
            virtualController?.disconnect()
            
            let virtualConfiguration = GCVirtualController.Configuration()
            virtualConfiguration.elements = [GCInputLeftThumbstick, GCInputButtonA, GCInputButtonB]

            virtualController = GCVirtualController(configuration: virtualConfiguration)
        
            // Connect to the virtual controller if no physical controllers are available.
            if GCController.controllers().isEmpty {
                virtualController?.connect()
            }
            
            guard let myController = virtualController?.controller else {
                return
            }
            
            registerGameController(myController)
        }
    
    guard let controller = GCController.controllers().first else {
        return
    }
        
    }
    
    func registerGameController(_ gameController: GCController) {
        var buttonA: GCControllerButtonInput?
        var buttonB: GCControllerButtonInput?
        var leftThumb: GCControllerDirectionPad?
        
        if let gamepad = gameController.extendedGamepad
        {
            buttonA = gamepad.buttonA
            buttonB = gamepad.buttonB
            leftThumb = gamepad.leftThumbstick
        }
        
        leftThumb?.valueChangedHandler = {(_ thumbStick: GCControllerDirectionPad, _ value: Float, _ pressed: Float) -> Void in
            if(thumbStick.xAxis.value != 0 && thumbStick.yAxis.value != 0){
//                self.movement = true
            } else {
//                self.movement = false
            }
            myAngle = atan2(thumbStick.xAxis.value, thumbStick.yAxis.value)
//            let rad = atan2(thumbStick.xAxis.value, thumbStick.yAxis.value)
            myMovement.dx = CGFloat(thumbStick.xAxis.value)
            myMovement.dy = CGFloat(thumbStick.yAxis.value)
        }
        
        buttonA?.valueChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
            // Put here the codes to run when button A clicked
            if(pressed == true){
                
            }
        }
        

        buttonB?.valueChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
            // Put here the codes to run when button B clicked
            if(pressed == true){
                
            }
        }
        
    }
}

    
