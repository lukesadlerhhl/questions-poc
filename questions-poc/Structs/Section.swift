//
//  Section.swift
//
//  Created by Luke Sadler on 24/01/2020.
//

import Foundation

// There is ALMOST certainly a better way to do this. KeyPaths, I heard is a neater way, but I cba to do this again.

protocol Section {
    func next(_ currentPage: Page?) -> Page?
    var sectionCount: Int { get }
}

extension Section {
    func next(_ currentPage: Page? = nil) -> Page? {
        
        let mirror = Mirror(reflecting: self).children
        
        var snatchNextElement = false
        
        for attr in mirror {
            if let element = attr.value as? Page {
                
                if snatchNextElement || currentPage == nil {
                    return element
                }
                
                snatchNextElement = element == currentPage
            }
        }
        return nil
    }
    
    var sectionCount: Int {
        return Mirror(reflecting: self).children.filter({$0.value is Page}).count
    }
}
