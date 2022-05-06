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
    
    private var initialized: Bool = false
    
    
    func setUpGameController(){
//        virtualController?.disconnect()
        
        if(initialized){
            virtualController?.connect()
        } else {
            if #available(iOS 15.0, *)
            {
                
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
    }
    
    func registerGameController(_ gameController: GCController) {
        self.initialized = true
        
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
                buttonAIsPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now()+0.1, execute: {
                    buttonAIsPressed = false
                })
            }else{
                buttonAIsPressed = false
            }
        }
        

        buttonB?.valueChangedHandler = {(_ button: GCControllerButtonInput, _ value: Float, _ pressed: Bool) -> Void in
            // Put here the codes to run when button B clicked
            if(pressed == true){
                buttonBIsPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now()+0.1, execute: {
                    buttonBIsPressed = false
                })
            }else{
                buttonBIsPressed = false
            }
        }
        
    }
    
    func disconnectController(){
        virtualController?.disconnect()
    }
    
    func connectController(){
        virtualController?.connect()
    }
    
}

    
