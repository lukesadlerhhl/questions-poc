//
//  OptionButton.swift
//
//  Created by Luke Sadler on 24/01/2020.
//

import UIKit

class OptionButton: UIButton {
    
    private(set) var isToggledOn: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTarget(self, action: #selector(tapped), for: .touchUpInside)
        setColour()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapped() {
        
        isToggledOn = !isToggledOn
        setColour()
    }
    
    private func setColour() {
        if isToggledOn {
            setTitleColor(.black, for: .normal)
        } else {
            setTitleColor(.green, for: .normal)
        }
    }
}
