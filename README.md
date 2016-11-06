# UIWindow-Transition
UIWindow transition effects while changing window's rootViewController

# Usage

```swift
UIApplication.sharedApplication().keyWindow?.transitRootVc(yourTabBarTwoController(), style: transitionType, duration: nil)
/* there are 11 kinds of transition effects, .None effect and .Random effect are also available
transitionType:  None, 
                 ZoomOut,
                 ZoomIn,
                 Dissolve,
                 SliceVertical,
                 SliceHorizontal,
                 FlipFromLeft,
                 FlipFromRight,
                 FlipFromTop,
                 FlipFromBottom,
                 CurlUp,
                 CurlDown,
                 Random
  */
```

# Install

- use cocoapods
```swift
pod 'UIWindow-Transition', '~> 0.0.2'
```
- manual import
```swift
just download lib folder and add into your project
```

# Screenshot

- ZoomOut effect

<img src="Screenshots/screenshot01.gif" width="320">

- ZoomIn effect

<img src="Screenshots/screenshot02.gif" width="320">

- Dissolve effect

<img src="Screenshots/screenshot03.gif" width="320">

- SliceVertical effect

<img src="Screenshots/screenshot04.gif" width="320">

- SliceHorizontal effect

<img src="Screenshots/screenshot05.gif" width="320">

- FlipFromLeft effect

<img src="Screenshots/screenshot06.gif" width="320">

- FlipFromRight effect

<img src="Screenshots/screenshot07.gif" width="320">

- FlipFromTop effect

<img src="Screenshots/screenshot08.gif" width="320">

- FlipFromBottom effect

<img src="Screenshots/screenshot09.gif" width="320">

- CurlUp effect

<img src="Screenshots/screenshot10.gif" width="320">

- CurlDown effect

<img src="Screenshots/screenshot11.gif" width="320">

# Release notes

- 0.0.1

`release first version.`
