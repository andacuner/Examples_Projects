//
//  CustomViews.swift
//  PhoneContacts
//
//  Created by Andacuner on 13.06.2022.
//


import Foundation
import UIKit
import ChameleonFramework
@IBDesignable class CustomButtonRadiusWithBorder:UIButton {
    
    @IBInspectable var cornerRadius:CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0 {
         didSet {
             self.layer.borderWidth = self.borderWidth
         }
     }
    @IBInspectable var setBorderColor:UIColor = UIColor.systemBlue {
        
        didSet {
            
            self.layer.borderColor = self.setBorderColor.cgColor
            
        }
        
        
    }
  
    override  func awakeFromNib() {
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    convenience init() {
        self.init(frame:CGRect.zero)
        setup()
    }
    private func setup() {
        
        self.titleLabel?.textColor = .white
        
    }
    
    
}
 @IBDesignable class UnderlinedTextField: UITextField {

let border = CALayer()

@IBInspectable var borderColor: UIColor = UIColor.white {
    didSet {
        setup()
    }
}
    
    
    @IBInspectable var hintColor:UIColor = .black {
        
        didSet {
            
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                            attributes: [NSAttributedString.Key.foregroundColor: self.hintColor])
            
        }
        
    }
@IBInspectable var borderWidth: CGFloat = 0.5 {
    didSet {
        setup()
    }
}

override init(frame : CGRect) {
    super.init(frame : frame)
    setup()
}

convenience init() {
    self.init(frame:CGRect.zero)
    setup()
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
}


override func awakeFromNib() {
    super.awakeFromNib()
    setup()
}

override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
}

func setup() {
    
    border.borderColor = self.borderColor.cgColor
    border.borderWidth = borderWidth
    self.layer.addSublayer(border)
    self.layer.masksToBounds = true
}

override func layoutSubviews() {
    super.layoutSubviews()
    border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width:  self.frame.size.width, height: self.frame.size.height)
}

override func textRect(forBounds bounds: CGRect) -> CGRect {
    return editingRect(forBounds: bounds)
}

override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return editingRect(forBounds: bounds)
}

override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.insetBy(dx: 10, dy: 0)
}

}
@IBDesignable class CustomViewWithRadiusBorder:UIView {
    
    @IBInspectable var cornerRadius:CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    @IBInspectable var borderWidth:CGFloat = 0 {
         didSet {
             self.layer.borderWidth = self.borderWidth
         }
     }
    @IBInspectable var borderColor:UIColor = .black {
          didSet {
            self.layer.borderColor = self.borderColor.cgColor
          }
      }
   
    override  func awakeFromNib() {
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    @IBInspectable var isShadowActive:Bool = false {
        didSet {
            if self.isShadowActive {
                layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
                      layer.shadowOpacity = 1
                      layer.shadowOffset = .zero
                      layer.shadowRadius = 10
                       layer.cornerRadius = 12
            } else {
                layer.shadowColor = UIColor.clear.cgColor
                                     layer.shadowOpacity = 0
                                     layer.shadowOffset = .zero
                                     layer.shadowRadius = 0
                                      layer.cornerRadius = 0
            }
        }
    }
    convenience init() {
        self.init(frame:CGRect.zero)
        setup()
    }
    private func setup() {
        
        
        
    }
    
    
}
@IBDesignable
class DoubleImageButton: UIButton {
  
    
    @IBInspectable var rightImg: UIImage? = nil {
        didSet {
         
            setAttributedTitle()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setAttributedTitle()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setAttributedTitle()
        self.titleLabel!.lineBreakMode = .byWordWrapping

    }

    private func setAttributedTitle() {
        if rightImg != nil {
            
            self.setImage(rightImg, for: .normal)
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: self.frame.width - 15 , bottom: 0, right: 0)
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 20)

        }
    }
}
@IBDesignable class CustomImageCircular:UIImageView {
    
    @IBInspectable
    var isImageCircular:Bool = false {
        
        didSet {
            if self.isImageCircular {
                self.layer.cornerRadius = self.frame.height / 2
                self.layer.masksToBounds = false
                self.clipsToBounds = true
            } else {
                self.layer.cornerRadius = 0

            }
        }
        
    }
    
    override  func awakeFromNib() {
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    convenience init() {
        self.init(frame:CGRect.zero)
        setup()
    }
    private func setup() {
        
       
        
    }
    
    
}
@IBDesignable class CustomButtonCircular:UIButton {
    
    @IBInspectable
    var isLabelCircular:Bool = false {
        
        didSet {
            if self.isLabelCircular {
                self.layer.cornerRadius = self.frame.height / 2
                self.layer.masksToBounds = false
                self.clipsToBounds = true
            } else {
                self.layer.cornerRadius = 0

            }
        }
        
    }
    
    
    override  func awakeFromNib() {
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    convenience init() {
        self.init(frame:CGRect.zero)
        setup()
    }
    private func setup() {
        
       
        
    }
    
    
}
@IBDesignable class CustomLabelCircular:UILabel {
    
    @IBInspectable
    var isLabelCircular:Bool = false {
        
        didSet {
            if self.isLabelCircular {
                self.layer.cornerRadius = self.frame.height / 2
                self.layer.masksToBounds = false
                self.clipsToBounds = true
            } else {
                self.layer.cornerRadius = 0

            }
        }
        
    }
    
    override  func awakeFromNib() {
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    convenience init() {
        self.init(frame:CGRect.zero)
        setup()
    }
    private func setup() {
        
       
        
    }
    
    
}
@IBDesignable class CustomImageMasked:UIImageView {
    
    @IBInspectable
    var isMasked:Bool = false {
        
        didSet {
            if self.isMasked {
               
                self.layer.masksToBounds = true
                self.clipsToBounds = true
            } else {
               

            }
        }
        
    }
    @IBInspectable
    var cornerValue:Int = 0 {
        didSet {
            
            self.layer.cornerRadius = CGFloat(self.cornerValue)
            
        }
    }
    
    override  func awakeFromNib() {
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    convenience init() {
        self.init(frame:CGRect.zero)
        setup()
    }
    private func setup() {
        
       
        
    }
    
    
}
@IBDesignable class CustomProgressView:UIProgressView {
    
    @IBInspectable
    var willHeightIncrease:Bool = false {
        
        didSet {
            if self.willHeightIncrease {
               
                self.transform = self.transform.scaledBy(x: 1, y: 9)
                self.layer.cornerRadius = 12
            } else {
               

            }
        }
        
    }
    
    
    override  func awakeFromNib() {
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    convenience init() {
        self.init(frame:CGRect.zero)
        setup()
    }
    private func setup() {
        
       
        
    }
    
    
}
class LoadingButton: UIButton {
var originalButtonText: String?
var activityIndicator: UIActivityIndicatorView!

func showLoading() {
    self.isUserInteractionEnabled = false
    originalButtonText = self.titleLabel?.text
    self.setTitle("", for: .normal)

    if (activityIndicator == nil) {
        activityIndicator = createActivityIndicator()
    }

    showSpinning()
}

func hideLoading() {
     self.isUserInteractionEnabled = true
    self.setTitle(originalButtonText, for: .normal)
    activityIndicator.stopAnimating()
}

private func createActivityIndicator() -> UIActivityIndicatorView {
    let activityIndicator = UIActivityIndicatorView()
    activityIndicator.hidesWhenStopped = true
    activityIndicator.color = .lightGray
    return activityIndicator
}

private func showSpinning() {
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(activityIndicator)
    centerActivityIndicatorInButton()
    activityIndicator.startAnimating()
}

private func centerActivityIndicatorInButton() {
    let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
    self.addConstraint(xCenterConstraint)

    let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
    self.addConstraint(yCenterConstraint)
}
}
@IBDesignable class CustomEditTextWithShadow:UITextField {
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    func setup() {
        layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
       layer.shadowOpacity = 1
       layer.shadowOffset = .zero
       layer.shadowRadius = 10
        layer.cornerRadius = 12
        
    }
    
    
    
    
}
@IBDesignable class CustomButtonWithRadiusAndShadow:UIButton {
    var originalButtonText: String?
    var activityIndicator: UIActivityIndicatorView!
    var originalButtonImage:UIImage?
    func showLoading() {
        self.isUserInteractionEnabled = false
        originalButtonText = self.titleLabel?.text
        originalButtonImage = self.image(for: .normal)
        self.setTitle("", for: .normal)
        self.setImage(nil, for: .normal)

        if (activityIndicator == nil) {
            activityIndicator = createActivityIndicator()
        }

        showSpinning()
    }

    func hideLoading() {
         self.isUserInteractionEnabled = true
        self.setTitle(originalButtonText, for: .normal)
        self.setImage(originalButtonImage, for: .normal)
        activityIndicator.stopAnimating()
    }

    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .lightGray
        return activityIndicator
    }

    private func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }

    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)

        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }
    
    required init?(coder: NSCoder) {
           super.init(coder: coder)
           setup()
       }
       override init(frame: CGRect) {
           super.init(frame: frame)
           setup()
       }
       func setup() {
           layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
          layer.shadowOpacity = 1
          layer.shadowOffset = .zero
          layer.shadowRadius = 10
           layer.cornerRadius = 12
           
       }
    
}
@IBDesignable
class GradientView: UIView {
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    let gradientLayer = CAGradientLayer()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    
}
@IBDesignable
class DesignableTextField: UITextField {

    //Delegate when image/icon is tapped.
    private var myDelegate: DesignableTextFieldDelegate? {
        get { return delegate as? DesignableTextFieldDelegate }
    }

    @objc func buttonClicked(btn: UIButton){
        self.myDelegate?.textFieldIconClicked(btn: btn)
    }

    //Padding images on left
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += padding
        return textRect
    }

    //Padding images on Right
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= padding
        return textRect
    }

    @IBInspectable var padding: CGFloat = 0
    @IBInspectable var leadingImage: UIImage? { didSet { updateView() }}
    
   
    @IBInspectable var rtl: Bool = false { didSet { updateView() }}

    func updateView() {
        rightViewMode = .never
        rightView = nil
        leftViewMode = .never
        leftView = nil

        if let image = leadingImage {
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)

            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
        

            button.setTitleColor(UIColor.clear, for: .normal)
            button.addTarget(self, action: #selector(buttonClicked(btn:)), for: .touchDown)
            button.isUserInteractionEnabled = true

            if rtl {
                rightViewMode = .always
                rightView = button
            } else {
                leftViewMode = .always
                leftView = button
            }
        }

        // Placeholder text color
       
    }
}
class ResizeableTableView:UITableView {
    
    override var intrinsicContentSize: CGSize {
        return contentSize
    }
    override var contentSize: CGSize {
    didSet {
        self.invalidateIntrinsicContentSize()
        }
    }
    
}
protocol DesignableTextFieldDelegate: UITextFieldDelegate {
    func textFieldIconClicked(btn:UIButton)
}


