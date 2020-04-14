# Group RadioButton


###Sample Code
Sample code would look like this

```
class ViewController: UIViewController, RadioGroupDelegate {
    
    @IBOutlet private weak var firstButton: RadioButton!
    @IBOutlet private weak var secondButton: RadioButton!
    @IBOutlet private weak var thirdButton: RadioButton!
    
    private var groupController: RadioGroup?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupController = RadioGroup(buttons: [firstButton, secondButton, thirdButton])
        groupController?.delegate = self
        
    }

    func didSelectedButton(_ index: Int?, value: String?) {
        print("Index => \(index), selected value => \(value)")
    }

}

```

## Demo
![Demo](https://github.com/jithinpala/RadioButton/blob/master/Screenshots/RadioGif.gif?raw=true)

### Get currently selected button
To get the currently selected button, you can use 

```
var currentButton = groupController.selectedButton
```

To get the currently selected button index, you can use 

```
var selectedIndex = groupController.selectedIndex
```

To get the currently selected button value, you can use 

```
var selectedValue = groupController.selectedValue
```

## 🎨 Customization

#### default color
```swift
    firstButton.defaultColor = UIColor.black
```

#### highlightedColor color
```swift
    firstButton.highlightedColor = UIColor.red
```

#### title left space
```swift
    firstButton.titleLeftSpace = 50
```

We can assign these properties through XIB

<img src="Screenshots/xibProperty.png" width="220" height="388"/>
