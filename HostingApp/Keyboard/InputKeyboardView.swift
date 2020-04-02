//
//  InputKeyboardView.swift
//  HostingApp
//
//  Created by tuRen on 2020/4/1.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

protocol InputKeyboardViewProtocol: NSObjectProtocol {
    func inputKeyboardItemsClickedWithString(_ str: String)
}

class InputKeyboardView: KeyboardView {
    
    var inputDelegate: InputKeyboardViewProtocol?
    var items: [String] = []
    
    override func createBanner() -> ExtraView? {        
        let banner = InputAssistantView(globalColors: type(of: self).globalColors, darkMode: false, solidColorMode: self.solidColorMode())
        banner.trailingActions = [InputAssistantAction.init(image: UIImage.init(named: "open") ?? UIImage.init())]
        banner.delegate = self
        banner.dataSource = self
        
        return banner // to bannerView
    }
    
    func setInputItems(items: [String]) {
        self.items.removeAll()
        self.items.append(contentsOf: items)
        
        let banner = self.bannerView as! InputAssistantView?
        banner?.reloadData()        
    }
}

extension InputKeyboardView: InputAssistantViewDelegate {
    func inputAssistantView(_ inputAssistantView: InputAssistantView, didSelectSuggestionAtIndex index: Int) {
        if let delegate = inputDelegate {
            delegate.inputKeyboardItemsClickedWithString(items[index])
        }
    }
}

extension InputKeyboardView: InputAssistantViewDataSource {
    func textForEmptySuggestionsInInputAssistantView() -> String? {
        return "No Data"
    }
    
    func numberOfSuggestionsInInputAssistantView() -> Int {
        return items.count
    }
    
    func inputAssistantView(_ inputAssistantView: InputAssistantView, nameForSuggestionAtIndex index: Int) -> String {
        return items[index]
    }
}
