//
//  ViewController.swift
//  RandomPhoto
//
//  Created by andaç üner on 17.08.2022.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()

    private let button: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Change Photo", for: .normal)
        button.setTitleColor(.red , for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemPink,
        .systemGray,
        .systemBlue,
        .systemRed,
        .systemPurple,
        .systemYellow,
        .systemGreen,
        .systemOrange,
        .systemGray5,
        .systemMint,
        .systemBrown
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        view.addSubview(imageView)
        imageView.frame  = CGRect(x: 0,
                                  y: 0,
                                  width: 350,
                                  height: 350)
        imageView.center = view.center
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
            
    @objc func didTapButton() {
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    
    
    
    
        override func viewDidLayoutSubviews(){
            
            super.viewDidLayoutSubviews()
            
            view.addSubview(button)
            button.frame = CGRect(x: 25,
                                  y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                                  width: view.frame.size.width-50,
                                  height:50)
            
        }
    
    func getRandomPhoto (){
        
        let  urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
    
    
}

