![Cocoapods](https://img.shields.io/cocoapods/v/AllDirectionsDismiss)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/kohei1218/AllDirectionsDismiss)
![Cocoapods platforms](https://img.shields.io/cocoapods/p/AllDirectionsDismiss)
![Cocoapods](https://img.shields.io/cocoapods/l/AllDirectionsDismiss)
[![Swift 4.2](https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat)](https://swift.org/)
[![Swift 5.0](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://swift.org/)
[![Swift 5.1](https://img.shields.io/badge/Swift-5.1-orange.svg?style=flat)](https://swift.org/)

# AllDirectionsDismiss

***AllDirectionsDismiss*** makes it easy for anyone to dismiss a ViewController by swiping in all four directions.
Not only views, but UIScrollView, UITableView, and UICollectionView can all be smoothly dismissed.

![single_view](https://user-images.githubusercontent.com/13994930/84598135-6ffd6080-aea3-11ea-892b-673217f42aa1.gif)
![scrollview](https://user-images.githubusercontent.com/13994930/84598091-1ac14f00-aea3-11ea-99e3-8665c2e5d403.gif)

## Feature
 - [x] Easy to use
 - [x] custom background view color, alpha
 - [x] custom dismissable percent, velocity
 - [ ] set custom background view
 - [ ] set background blur view

## Usage

### use with ScrollView, TableView, CollectionView

```swift
import UIKit
import AllDirectionsDismiss

// set member variable
var allDirectionsDismiss: AllDirectionsDismiss?

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // initialize with scrollView
        allDirectionsDismiss = AllDirectionsDismiss(scrollView: tableView)
        // set percent to dismiss
        allDirectionsDismiss?.dismissPercent = 0.3
        // set velocity to dismiss
        allDirectionsDismiss?.dismissVelocity = 1000
        // set alpha to background view alpha
        allDirectionsDismiss?.backgroundAlpha = 0.9
        // set alpha to background view color
        allDirectionsDismiss?.backgroundColor = .black
    }
}
```

If you're using a ScrollView, the top and bottom If you want to add a dismissal, use the ***addDismissGesture(view: UIView)*** You can use it.

```swift
let headerView = UIView()
allDirectionsDismiss?.addDismissGesture(view: headerView)
```

### use with ViewController

```swift 
import UIKit
import AllDirectionsDismiss

class ViewController: UIViewController {

    var allDirectionsDismiss: AllDirectionsDismiss?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Single"
        
        // initialize with UIViewController
        allDirectionsDismiss = AllDirectionsDismiss(viewController: self)
        // set percent to dismiss
        allDirectionsDismiss?.dismissPercent = 0.3
        // set velocity to dismiss
        allDirectionsDismiss?.dismissVelocity = 1000
        // set alpha to background view alpha
        allDirectionsDismiss?.backgroundAlpha = 0.9
        // set alpha to background view color
        allDirectionsDismiss?.backgroundColor = .black
    }
    
}

```

## Customize

### allowDismissDirection

You can specify the direction of the dismissal to be allowed.

default value is ***[.down, .up, .left, .right]***

```swift
allDirectionsDismiss?.allowDismissDirection = [.up, .right]
```

### dismissPercent

You can specify the percentages to dismiss.

default value is ***0.3*** (min is ***0***, max is ***1***)

```swift
allDirectionsDismiss?.dismissPercent = 0.15
```

![dismiss_percent](https://user-images.githubusercontent.com/13994930/84598089-19902200-aea3-11ea-9e60-bcd9f3eddb77.gif)


### dismissVelocity

You can specify the velocity to dismiss.

default value is ***500*** (min is ***0***, max is ***1000***)

```swift
allDirectionsDismiss?.dismissVelocity = 1000
```

![dismiss_velocity](https://user-images.githubusercontent.com/13994930/84598090-1a28b880-aea3-11ea-8bf7-95db56b761b3.gif)



### backgroundAlpha

You can change the alpha of the background.

default value is ***0.9*** (min is ***0***, max is ***1***)

```swift
allDirectionsDismiss?.backgroundAlpha = 0.0
```

![background_alpha](https://user-images.githubusercontent.com/13994930/84598081-12691400-aea3-11ea-9462-db3ed2c8dc0e.gif)


### backgroundColor

You can change the color of the background.

default color is black.

```swift
allDirectionsDismiss?.backgroundColor = .red
```

![background_color](https://user-images.githubusercontent.com/13994930/84598086-185ef500-aea3-11ea-82e0-e2df9b55ac25.gif)


## Installation

### Swift Package Manager
 - Add it as a dependency within your Package.swift manifest:

```
dependencies: [
  .package(url: "https://github.com/kohemon/AllDirectionsDismiss.git", from: "1.1.4")
]
```

## Requirements
 - iOS 10.0 or later

## Contributing
PullRequest and stars are welcome!

If you find a bug, please report it in the issue.
If you want to help me develop, please send me a PullRequest!

## Author

 - [@kohei1218](https://github.com/kohei1218/) / kohei saito

## License

AllDirectionsDismiss is released under the MIT license. See [LICENSE](https://github.com/kohemon/AllDirectionsDismiss/blob/master/LICENSE) for details.
