//
//  File.swift
//
//  Created by Luke Sadler on 24/01/2020.
//

import Foundation

struct AboutYouSection: Section {
    
    let id = UUID().uuidString

    let first: Page
    let second: Page
    let third: Page
    var thirdOptional: Page?
    let fourth: Page
    
    static func generate () -> AboutYouSection {
        return AboutYouSection(
            
            first:
            Page(title: "My Title",
                 subtitle: "This is the smaller, more verbose text that goes under the title. This is so informative",
                 style: TextContentItem(bodyText: "blah blah blah")),
            
            second:
            Page(title: "What do you use your car for?",
                 subtitle: "This is such an informative body. OMG... Choose all that apply.  Most need Social, domestic and pleasure but if you drive to work you;ll need commuting too!!!",
                 style: ToggleButtonsContentItem(buttonTitles: ["Social domestic and pleasure", "commuting", "business", "commercial"])),
            
            third:
            Page(title: "Do you have any no claims bonus?",
                 subtitle: nil,
                 style: RadioButtonsContentItem(buttonTitles: ["yes","no"]),
                 nextAction: {
                    /* I don't know what I want to do here. The actual buttons are not in scope so I cannot determine if they've been selected.
                     If only i could go
                     if radiobuttons.selection == .yes
                     me.thirdOptional = nil
                     */
            }),
            
            thirdOptional:
            Page(title: "This will only appear if you say that you have no claims :)",
                 subtitle: "How many years do you have?",
                 style: ButtonsContentItem(buttonTitles: ["yes","no"])),

            fourth:
            Page(title: "Roughly, how many miles do you drive each year?",
                 subtitle: "Insureres need to know how much you're on the roads!!!! It must be at least 1000 miles. Split out your personal and business miles if you do both!?!!!!11",
                 styles: [
                    NumberInputContentItem(title: "Personal miles", placeholder: "miles"),
                    NumberInputContentItem(title: "Business miles", placeholder: "miles")
            ])
        )
    }
}
