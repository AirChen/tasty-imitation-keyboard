//
//  KeyboardViewController.swift
//  HostingApp
//
//  Created by air on 2020/3/28.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class KeyboardViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    let keyboardView: InputKeyboardView
    
    required init?(coder: NSCoder) {
        keyboardView = InputKeyboardView.init(orientation: .portrait)
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        keyboardView.keyboardDelegate = self
        keyboardView.inputDelegate = self
        textView.inputView = keyboardView
        textView.delegate = self
        
        keyboardView.loadView()
        
        // add date must after loadView!
        keyboardView.appendLeadingAction(image: UIImage.init(named: "gear") ?? UIImage.init(), target: self, action: #selector(openAction))
        keyboardView.appendTrailingAction(image: UIImage.init(named: "open") ?? UIImage.init(), target: self, action: #selector(openAction))
        keyboardView.setInputItems(items: ["one", "two", "three", "four"])
    }
    
    @objc func openAction() {
        print("open action");
    }
}

extension KeyboardViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        keyboardView.viewDidLayoutSubviews()
    }
}

extension KeyboardViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        keyboardView.viewWillAppear(true)
    }
}

extension KeyboardViewController: KeyboardViewProtocel {
    var documentContextBeforeInput: String? {
        get {
          return textView.text
        }
    }
    
    func insertText(_ text: String) {
        textView.insertText(text)
    }
    
    func deleteBackward() {
        textView.deleteBackward()
    }
    
    var keyboardAppearance: UIKeyboardAppearance {
        get {
            return textView.keyboardAppearance
        }
        set {
            
        }
    }
    
    var autocapitalizationType: UITextAutocapitalizationType {
        get {
            return textView.autocapitalizationType
        }
        set {
            
        }
    }
    
    var orientation: UIInterfaceOrientation {
        return self.preferredInterfaceOrientationForPresentation
    }
}

extension KeyboardViewController: InputKeyboardViewProtocol {
    func inputKeyboardItemsClickedWithString(_ str: String) {
        textView.insertText(str)
    }
}
