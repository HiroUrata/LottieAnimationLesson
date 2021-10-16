//
//  ViewController.swift
//  LottieAnimationLesson
//
//  Created by UrataHiroki on 2021/10/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let viewBackImage = {() -> UIImageView in
            
            let imageView = UIImageView(frame: CGRect(x: view.frame.minX, y: view.frame.minY, width: view.frame.width, height: view.frame.height))
            imageView.image = UIImage(named: "haikei01")
            imageView.contentMode = .scaleToFill
             return imageView
        }()
        view.addSubview(viewBackImage)
        
        let animationStartButton = {() -> UIButton in
            
            let button = UIButton(frame: CGRect(x: view.frame.maxX / 4, y: view.frame.maxX / 3, width: view.frame.width / 2, height: view.frame.height / 20))
            button.setTitle("Start", for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            button.titleLabel?.textColor = .white
            button.backgroundColor = .systemGreen
            button.layer.cornerRadius = 15.0
            button.layer.shadowOffset = CGSize(width: 5, height: 5)
            button.layer.shadowRadius = 5.0
            button.layer.shadowOpacity = 0.8
            return button
        }()
        view.addSubview(animationStartButton)
    }


}

