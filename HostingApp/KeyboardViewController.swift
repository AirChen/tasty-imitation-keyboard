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

    let keyboardView: KeyboardView
    
    required init?(coder: NSCoder) {
        keyboardView = KeyboardView.init(orientation: .portrait)
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        keyboardView.keyboardDelegate = self
        textView.inputView = keyboardView
        textView.delegate = self
        
        self.keyboardView.loadView()
    }
}

extension KeyboardViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.keyboardView.viewDidLayoutSubviews()
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
        return self.interfaceOrientation
    }
}

extension KeyboardViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        keyboardView.viewWillAppear(true)
    }
}
