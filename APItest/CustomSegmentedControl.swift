

import UIKit
protocol CustomSegmentedControlDelegate:class {
    func change(to index:Int)
}

class CustomSegmentedControl: UIView {
    private var buttonTitles:[String]!
    public var buttons: [UIButton]!
    private var selectorView: UIView!
    
    var textColor:UIColor = .white
    var selectorViewColor: UIColor = .blue
    var selectorTextColor: UIColor = .white
    
    weak var delegate:CustomSegmentedControlDelegate?

    public private(set) var selectedIndex : Int = 0
    
    convenience init(frame:CGRect,buttonTitle:[String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitle
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.backgroundColor = UIColor.white
        updateView()
    }
    
    func setButtonTitles(buttonTitles:[String]) {
        self.buttonTitles = buttonTitles
        self.updateView()
    }
    
    func setIndex(index:Int) {
        buttons.forEach({ $0.setTitleColor(textColor, for: .normal) })
        let button = buttons[index]
        selectedIndex = index
        button.setTitleColor(selectorTextColor, for: .normal)
        let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(index)
        UIView.animate(withDuration: 0.2) {
            self.selectorView.frame.origin.x = selectorPosition
        }
    }
    
    @objc func buttonAction(sender:UIButton) {


        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition = frame.width/CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
                selectedIndex = buttonIndex
	          delegate?.change(to: selectedIndex)

				switch selectedIndex
				{
				case 0: createTV()
				case 1: createTV2()
				case 2: createTV3()
				default: break
				}

				
				UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }


	
}




//Configuration View
extension CustomSegmentedControl {
	private func updateView() {
		createButton()
		configSelectorView()
		configStackView()
		createTV()
	}

	private func configStackView() {
		let stack = UIStackView(arrangedSubviews: buttons)
		stack.axis = .horizontal
		stack.alignment = .fill
		stack.distribution = .fillEqually
		addSubview(stack)
		stack.translatesAutoresizingMaskIntoConstraints = false
		stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
		stack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
		stack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
	}

	private func configSelectorView() {
		let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
		selectorView = UIView(frame: CGRect(x: 0, y: self.frame.height, width: selectorWidth, height: 2))
		selectorView.backgroundColor = selectorViewColor
		addSubview(selectorView)
	}

	private func createButton() {
		buttons = [UIButton]()
		buttons.removeAll()
		subviews.forEach({$0.removeFromSuperview()})
		for buttonTitle in buttonTitles {
			let button = UIButton(type: .system)
			button.setTitle(buttonTitle, for: .normal)
			button.addTarget(self, action:#selector(CustomSegmentedControl.buttonAction(sender:)), for: .touchUpInside)
			button.setTitleColor(textColor, for: .normal)
			buttons.append(button)
		}
		buttons[0].setTitleColor(selectorTextColor, for: .normal)
	}

	private func createTV() {
		let textView = UITextView(frame: CGRect(x: 20.0, y: 90.0, width: 250.0, height: 100.0))
		textView.translatesAutoresizingMaskIntoConstraints = true
		textView.center = self.center
		textView.textAlignment = NSTextAlignment.justified
		textView.textColor = UIColor.blue
		textView.text = "hello"
		textView.backgroundColor = UIColor.lightGray
	//	textView.isEditable = true
		addSubview(textView)

	}


	private func createTV2() {
		let textView = UITextView(frame: CGRect(x: 20.0, y: 90.0, width: 250.0, height: 100.0))
		textView.translatesAutoresizingMaskIntoConstraints = true
		textView.center = self.center
		textView.textAlignment = NSTextAlignment.justified
		textView.textColor = UIColor.blue
		textView.text = "popo"
		textView.backgroundColor = UIColor.lightGray
		textView.isEditable = true
		addSubview(textView)

	}


	private func createTV3() {
		let textView = UITextView(frame: CGRect(x: 20.0, y: 90.0, width: 250.0, height: 100.0))
		textView.translatesAutoresizingMaskIntoConstraints = true
		textView.center = self.center
		textView.textAlignment = NSTextAlignment.justified
		textView.textColor = UIColor.blue
		textView.text = "toto"
		textView.backgroundColor = UIColor.lightGray
	//	textView.isEditable = true
		addSubview(textView)

	}

}



