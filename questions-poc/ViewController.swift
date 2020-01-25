//
//  ViewController.swift
//
//  Created by Luke Sadler on 24/01/2020.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var counterTitle: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var stackviewContainer: UIView!
    
    var currentSection: Section?
    var currentPage: Page?
    var currentIndex = 0
    
    var stackedPages: [Page] = []
    
    // this is temp
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let aboutYou = AboutYouSection.generate()
        
        currentSection = aboutYou
        
        updateCounter()
        
        let page = currentSection?.next()
        stackedPages.append(page!)
        generatePage(page)
    }

    func updateCounter () {
        counterTitle.text = "\(currentIndex + 1) / \(currentSection!.sectionCount)"
    }
    
    @IBAction func nextButtonPressed () {

        currentIndex += 1
        
        currentPage?.nextAction?()
        
        if currentIndex+1 <= stackedPages.count {
            print("get page from stack if we've gone backwards")
            generatePage(stackedPages[currentIndex])
        } else if let nextPage = currentSection?.next(currentPage) {
            stackedPages.append(nextPage)
            generatePage(nextPage)
        } else {
            // take me away
            print("end")
        }
        
    }
    
    @IBAction func prevButtonPressed () {
    
        // get a page from the stack
        currentIndex = max(0 , currentIndex-1)
        updateCounter()
        print(currentIndex)
        generatePage(stackedPages[currentIndex])
    
    }

    func generatePage (_ page: Page?) {
        
        /*
            Generally, this would want to be a UIPageController or something similar.
            For the sake of POC, just logging out some should-be labels and replacing the content rather than seguing or whatever
         */
        
        guard var page = page else {
            print("next section")
            return
        }
        
        updateCounter()
        currentPage = page
        
        stackviewContainer.subviews.first?.removeFromSuperview()
        
        let stackview = PageBuilder.createView(&page)
        stackviewContainer.addSubview(stackview)
        stackview.fitToSuperview()

        // Make these labels outside the main stack view. Being lazy.
        for text in [page.subtitle, page.title] {
            let label = UILabel(frame: .zero)
            label.textColor = .black
            label.text = text
            label.numberOfLines = 0
            stackview.insertArrangedSubview(label, at: 0)
        }
        
    }
    
}

