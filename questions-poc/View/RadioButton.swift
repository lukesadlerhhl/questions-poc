//
//  RadioButton.swift
//
//  Created by Luke Sadler on 24/01/2020.
//

import UIKit

typealias RadioCallback = (RadioButton) -> Void

class RadioButton: UIButton {

    var tappedCallback: RadioCallback?
    
    var isToggledOn: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTarget(self, action: #selector(tapped), for: .touchUpInside)
        setColour()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapped() {
        
        tappedCallback?(self)
        isToggledOn = true
        setColour()
    }
    
    func setColour() {
        if isToggledOn {
            setTitleColor(.black, for: .normal)
        } else {
            setTitleColor(.green, for: .normal)
        }
    }
}

