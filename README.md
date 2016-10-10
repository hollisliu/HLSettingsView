# HLSettingsView
A better way to manage user preferences in iOS

*Author: Hollis Liu*

## Philosophy
The current way of handling preferences options in iOS is somewhat frustrating: too many options, too many layers and too much blank spaces. There's gotta be a better way to do it. That's why I wrote this framework.

HLSettingsView reduces the clutter of options by condensing them into a collection view that everyone is familiar with. It also enables quick actions on key options by 3D Touch on any icon.

## Features
First it presents users with a clear, simple collection view called **Board** with all the options.

A user can tap on any icon to navigate to the next view like we all do everyday. Or the user can **3D Touch** on an icon to bring up a **Popup** with quick actions for toggling key options. Keep pressing down on the screen will **pop** the UI into the next layer of settings with all the details.

## Screenshot
![Screenshot](screenshot.gif?raw=true")

## Usage

The view is broken into 2 parts: **Board** and **Popup Preview**

1. **Board** is a essentially a collectionView where you can provide the user with all the options a user need. Icons and text of the options can be provided with 2 constants: (note the images are preferably stored in the asset catalog)

```Swift
//input your own options
let images = ["Airplane", "Battery", "Cell", "Cloud", "Fingerprint", "Hand", "Lock", "Message", "Photos", "Shutdown", "Wi-Fi", "Battery", "Cell", "Cloud", "Fingerprint", "Hand", "Lock"]

let options = ["Air Mode", "Battery", "Cellular", "iCloud", "Touch ID", "Privacy", "Password", "Mail", "Photos", "Turn Off", "Wi-Fi", "Battery", "Cellular", "iCloud", "Touch ID", "Privacy", "Password"]
```

1. **Popup** utilizes the new UIPreviewInteraction API for 3D Touch effects. In addition to the system APIs, HLSettingsView also provides 2 delegate methods for the popup:

```Swift
/// configure the key options
func userDidSelectButton(postion: buttonPostion) {
    switch postion {
    case .top:

    //other cases
    }
}

//delegate callback when user dismisses the popup
func willDissmissPopup() {
    self.collectionView!.allowsSelection = true // revert selection
}
```

## Platform
iOS 10 or later

## Roadmap
This is an ongoing project. Improvements may include:

* better APIs
* packaging using SPM
* add unit tests
* dynamic center point for the popup
* sliding gestures when selecting key options
* better animation
