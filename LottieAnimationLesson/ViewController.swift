//
//  ViewController.swift
//  LottieAnimationLesson
//
//  Created by UrataHiroki on 2021/10/16.
//

import UIKit
import Lottie

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
            button.addTarget(self, action: #selector(showLottie), for: .touchDown)
            return button
        }()
        view.addSubview(animationStartButton)
        
    }
    
    @objc func showLottie(sender:UIButton){
        
        let animationView = AnimationView()
        animationView.showLottieAnimation(viewBackgroundColor: .clear, playAnimationName: "Lottie01", selectContentMode: .scaleToFill, selectLoopMode: .loop, animatoinTime: 5, targetView: view, afterProseccing:{
            
            sender.isEnabled = false
        }())
    }

}

extension AnimationView{
    
    func showLottieAnimation(viewBackgroundColor:UIColor,playAnimationName:String,selectContentMode:UIView.ContentMode,selectLoopMode:LottieLoopMode,animatoinTime: Double,targetView:UIView,afterProseccing: Void?){
        
        let lottieAnimationView = AnimationView()
        
        lottieAnimationView.frame = CGRect(x: targetView.frame.maxX / 6, y: targetView.frame.maxY / 4, width: targetView.frame.width - targetView.frame.maxX / 3, height: targetView.frame.width - targetView.frame.maxX / 3)
        lottieAnimationView.backgroundColor = viewBackgroundColor
        lottieAnimationView.animation = Animation.named(playAnimationName)
        lottieAnimationView.contentMode = selectContentMode
        lottieAnimationView.loopMode = selectLoopMode
        lottieAnimationView.play()
        targetView.addSubview(lottieAnimationView)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animatoinTime) {
            
//            if afterProseccing != nil{
                

           // }
            
            lottieAnimationView.removeFromSuperview()
            lottieAnimationView.stop()
            afterProseccing
        }
    }
}
