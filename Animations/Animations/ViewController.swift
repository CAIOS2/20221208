//
//  ViewController.swift
//  Animations
//
//  Created by Tadas Petrikas on 2022-12-08.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets

    @IBOutlet private weak var someView: UIView!
    
    //MARK: - Properties
    
    private var animator: UIViewPropertyAnimator?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        configureAnimator()
    }
    
    private func configureAnimator() {
        animator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut) {
            self.someView.center.x = self.view.frame.width
        
            //Same implementation in different ways
            
            // #1st
//            let transform = CGAffineTransform(rotationAngle: 3.14)
//            let scaledTransform = transform.scaledBy(x: 0.001, y: 0.001)
//            self.someView.transform = scaledTransform
            
            // #2nd
            self.someView.transform = CGAffineTransform(rotationAngle: 3.14).scaledBy(x: 0.001, y: 0.001)
        }
    }

    //MARK: - Actions
    
    @IBAction private func animateButtonTapped(_ sender: Any) {
        
        UIView.animate(withDuration: 1) {
            self.someView.center.x = self.view.frame.width
            self.someView.transform = CGAffineTransform(rotationAngle: 3.14).scaledBy(x: 0.001, y: 0.001)
        }
        
        
        // #1. Animation example
        
//        UIView.animate(withDuration: 3, delay: 0, options: [.autoreverse]) {
//            self.someView.frame = CGRect(x: 200, y: 400, width: 500, height: 300)
//            self.someView.backgroundColor = .green
//            self.someView.alpha = 0.5
//        }
        
        // #2. Animator example
        
//        animator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut) {
//            self.someView.center.x = self.view.frame.width
        
            //Same implementation in different ways
            
            // #1st
//            let transform = CGAffineTransform(rotationAngle: 3.14)
//            let scaledTransform = transform.scaledBy(x: 0.001, y: 0.001)
//            self.someView.transform = scaledTransform
            
            // #2nd
//            self.someView.transform = CGAffineTransform(rotationAngle: 3.14).scaledBy(x: 0.001, y: 0.001)
//        }
        
    }
    
    @IBAction private func sliderValueChanged(_ sender: UISlider) {
        animator?.fractionComplete = CGFloat(sender.value)
    }
}

