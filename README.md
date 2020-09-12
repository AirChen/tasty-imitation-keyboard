# Tasty Imitation Keyboard

I'm working on a 3rd party keyboard and I want it to look and feel as close as possible to Apple's keyboard. Unfortunately, it's not possible to access the keyboard view through code, so this is my attempt to imitate it by hand. (I'm sure there are ways to get even more accuracy via reverse engineering, but that's too much work for me!) In the end, I hope to produce a coherent and robust baseline for creating custom 3rd party keybards — at least, until Apple decides to fully open up their keyboard API.

This keyboard is currently optimized for iPhone. iPad should work, but it'll look like a giant iPhone keyboard.

## Recent Screenshots

<img style="border: gray 1px solid;" width="320px" src="./Screenshot-Portrait.png"></img>
<img style="border: gray 1px solid;" width="568px" src="./Screenshot-Landscape.png"></img>
<img style="border: gray 1px solid;" width="320px" src="./Settings-Portrait.png"></img>

## Fantastic Features

* No bitmaps! Everything is rendered using CoreGraphics.
* Dynamic layouts! All the keys are laid out programmatically, meaning that the keyboard is much easier to extend and will automatically work on devices of all sizes.
* Auto-capitalization, period shortcut, keyboard clicks.
* An extensible settings screen.
* Dark mode and solid color mode.
* Surpport iPhoneX Serical Screen.
* Used for UITextField and UITextView as inputView.
* Advanced ExtraView could add leading 、 trailing actions and input suggestions. 

## Usage

### CocoaPods

To integrate TastyImitationKeyboard into your Xcode project using CocoaPods, specify it in your Podfile:

```
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'TastyImitationKeyboard'
end
```
Then, run the following command:

```
$ pod install
```
You just create KeyboardView instance like InputKeyboardView instance, and signed to UITextField's or UITextView's inputView. You also could append leading or trailing actions or input suggestions for top banner.

```
    keyboardView = InputKeyboardView.init(orientation: .portrait)
    keyboardView.keyboardDelegate = self
    keyboardView.inputDelegate = self
    textView.inputView = keyboardView
    textView.delegate = self
    
    keyboardView.loadView()
    
    // add date must after loadView!
    keyboardView.appendLeadingAction(image: UIImage.init(named: "gear") ?? UIImage.init(), target: self, action: #selector(openAction))
    keyboardView.appendTrailingAction(image: UIImage.init(named: "open") ?? UIImage.init(), target: self, action: #selector(openAction))
    keyboardView.setInputItems(items: ["one", "two", "three", "four"])
```

## Learning Goals

* Swift
* 3rd party extensions
* 3rd party frameworks (for IB use)
* Autolayout
* CoreGraphics

## License

This project is licensed under the 3-clause ("New") BSD license. Go Bears!
