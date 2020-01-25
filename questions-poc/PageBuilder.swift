//
//  PageBuilder.swift
//
//  Created by Luke Sadler on 24/01/2020.
//

import UIKit

extension UIView {
    func fitToSuperview () {
        
        guard let superview = superview else {
            preconditionFailure("add to superview first")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        widthAnchor.constraint(equalTo: superview.widthAnchor).isActive = true
        centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        setNeedsLayout()
    }
}

class PageBuilder {
    
    class func createView (_ page: inout Page) -> UIStackView {
        
        let stackview = UIStackView(frame: .zero)
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        
        let array = page.styles ?? [page.style!]
        
        for style in array {
            
            switch style.type {
                
            case .buttons:
                
                let buttonTitles = (style as! ButtonsContentItem).buttonTitles
                
                for t in buttonTitles {
                    let button = UIButton(type: .custom)
                    button.setTitle(t, for: .normal)
                    button.setTitleColor(.blue, for: .normal)
                    stackview.addArrangedSubview(button)
                }
                
            case .toggleButtons:
                
                let buttonTitles = (style as! ToggleButtonsContentItem).buttonTitles
                
                for t in buttonTitles {
                    let button = OptionButton(frame: .zero)
                    button.setTitle(t, for: .normal)
                    stackview.addArrangedSubview(button)
                }
                
            case .radioButtons:
                
                let buttonTitles = (style as! RadioButtonsContentItem).buttonTitles
                var buttons: [RadioButton] = []

                // This might be a hack. Who knows??!
                let cb: RadioCallback = { btn in
                    for b in buttons {
                        if b != btn {
                            b.isToggledOn = false
                            b.setColour()
                        }
                    }
                }
                
                for t in buttonTitles {
                    let button = RadioButton(frame: .zero)
                    button.setTitle(t, for: .normal)
                    stackview.addArrangedSubview(button)
                    button.tappedCallback = cb
                    buttons.append(button)
                }
                
            case .datePicker:
                
                let datePicker = UIDatePicker(frame: .zero)
                datePicker.minimumDate = Date()
                stackview.addArrangedSubview(datePicker)
                
            case .stringPicker:
                
                print("string picker stuff")
                
            case .text:
                
                let textview = UITextView(frame: .zero)
                textview.text = (style as! TextContentItem).bodyText
                stackview.addArrangedSubview(textview)
            case .numberInput:
                
                var pageStyle = style as! NumberInputContentItem
                
                // create a custom view here so we can composite a title and text field into a single stack view item
                let inputField = UITextField(frame: .zero)
                inputField.placeholder = pageStyle.placeholder
                pageStyle.textfield = inputField
                stackview.addArrangedSubview(inputField)
            }
        }
        return stackview
    }
    
}
