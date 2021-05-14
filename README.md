# LLSwipeableView 📱📲

Swipeable view which reveals action views. 💫

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/LLSwipeableView.svg)](https://img.shields.io/cocoapods/v/LLSwipeableView.svg)

- [Getting Started]
- [Example Use]
- [Versioning]
- [Authors]
- [License]



## Getting Started

These instructions will help you integrate LLSwipeableView into your project.

### Prerequisities

- Xcode 12 or higher
- iOS 14.0 or higher
- Cocoapods (optional)
- Swift Package Manager (optional)

### Installation

#### CocoaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.10.1+ is required to build LLSwipeableView 1.0.4+.

To integrate CoreNavigation into your Xcode project using CocoaPods, specify it in your Podfile:

```ruby
target '<Your Target Name>' do
    use_frameworks!
    
    pod 'LLSwipeableView'
end
```

Then, run the following command:

```bash
$ pod install
```

## Example Use

### Creating view:

```swift
SwipeableView(content: {
    HStack {
        Image("image")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 75)
            .clipped()
        
        Text(item)
        
        Spacer()
    }
}, actionsContent: {
    HStack(spacing: 0) {
        Button(action: {
            acceptItem(item: item)
        }, label: {
            Image(systemName: "checkmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .padding(20)
                .background(Color.purple)
        })
        
        Button(action: {
            removeItem(item: item)
        }, label: {
            Image(systemName: "xmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .padding(20)
                .background(Color.orange)
        })
    }
}, actionContentPosition: .leading)
```

### View initializer:

```swift
SwipeableView(
	content: {
		// Main content view
	}, 
	actionsContent: {
		// Actions content view
	}, 
	actionContentPosition: ActionContentPosition,
	animation: Animation
)
```
<img src="Docs/Images/image1.png" width=400 />

## Configuration

### Action content position

Enum ActionContentPosition options for setting action content position:

- `.leading`
- `.trailing`

Set the actions content view position by passing the ActionContentPosition value to the SwipeableView initializer.

#### Usage:

| Property | Value |
| -------------- | ---------- |
| actionContentPosition | ActionContentPosition |

> By passing ActionContentPosition.leading, action content view will appear on the left side of a view. 
> Default: ActionContentPosition.trailing

### Animating

Set the animation of content view by passing the SwiftUI.Animation value to the SwipeableView initializer.

#### Usage:

| Property | Value |
| -------------- | ---------- |
| animation | SwiftUI.Animation |

> By passing SwiftUI Animation type, view will animate it's swipe gesture correspondingly 
> Default: Animation.spring()

SwiftUI Animation types:

- `.default`
- `.easeIn`
- `.easeInOut`
- `.easeOut`
- `.linear`

Check Apple's docs to find out more on SwiftUI's Animation here - [SwiftUI.Animation](https://developer.apple.com/documentation/swiftui/animation)

## Versioning

Current release:

- 1.0.7

## Authors

- Aron Balog - [GitHub](https://github.com/aronbalog) | [Twitter](https://twitter.com/Aron_Balog) | [LinkedIn](https://www.linkedin.com/in/aronbalog/) | [Medium](https://medium.com/@aronbalog)
- Bruno Bartol - [GitHub](https://github.com/brunobartol) | [LinkedIn](https://www.linkedin.com/in/brunobartol/) | [Medium](https://medium.com/@brunobartol)

<!---
### Contributing

Please read [Contributing](CONTRIBUTING.md) for details on code of conduct, and the process for submitting pull requests.
-->

## License

This project is licensed under the **GNU GPL License** - see the [LICENSE](LICENSE.md) file for details.

[Getting Started]: #getting-started
[Example Use]: #example-use
[Versioning]: #versioning
[Authors]: #authors
[License]: #license

<!--- example apps -->
