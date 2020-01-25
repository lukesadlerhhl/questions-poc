//
//  PageContentItem.swift
//
//  Created by Luke Sadler on 24/01/2020.
//

import UIKit

enum PageContentOptions {
    case buttons, radioButtons, toggleButtons, datePicker, stringPicker, text, numberInput
}

protocol ContentItemStyle /*names - kill me*/ {
    var type: PageContentOptions { get }
}

struct Button {
    let title: String
    let key: String
}

/// Getting messy now :/

struct ButtonsContentItem: ContentItemStyle {
    
    let type: PageContentOptions = .buttons
    var buttonTitles: [String]
}

struct RadioButtonsContentItem: ContentItemStyle {
    let type: PageContentOptions = .radioButtons
    
    var buttonTitles: [String]
}

struct ToggleButtonsContentItem: ContentItemStyle {
    let type: PageContentOptions = .toggleButtons
    var buttonTitles: [String]
}

struct TextContentItem: ContentItemStyle {
    let type: PageContentOptions = .text
    var bodyText: String
}

struct NumberInputContentItem: ContentItemStyle {
    let type: PageContentOptions = .numberInput
    
    let title: String
    let placeholder: String
    
    var textfield: UITextField?
}
