//
//  Page.swift
//  Created by Luke Sadler on 24/01/2020.
//

import Foundation

struct Page: Equatable {
    
    typealias PageAction = () -> Void
    
    static func == (lhs: Page, rhs: Page) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id = UUID().uuidString
    
    let title: String
    let subtitle: String?
    var style: ContentItemStyle?
    var styles: [ContentItemStyle]?
    
    var nextAction: PageAction?
    
    var values: Any?
    
}
