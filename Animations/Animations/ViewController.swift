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
    @IBOutlet private weak var button: UIButton!
    
    @IBOutlet private var slider: UIView!
    
    //MARK: - Properties
    
    private var animator: UIViewPropertyAnimator?
    
    private var shapeLayer: CAShapeLayer?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureAnimator()
    }
    
    private func simpleAnimation() {
        UIView.animate(withDuration: 3, delay: 0, options: [.autoreverse]) {
            self.someView.frame = CGRect(x: 200, y: 400, width: 500, height: 300)
            self.someView.backgroundColor = .green
            self.someView.alpha = 0.5
        }
    }
    
    private func transformAnimation() {
        UIView.animate(withDuration: 1) {
            self.someView.center.x = self.view.frame.width
            self.someView.transform = CGAffineTransform(rotationAngle: 3.14).scaledBy(x: 0.001, y: 0.001)
            
        }
        
    }
        private func animatorAnimation() {
//            animator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut) {
    //            self.someView.center.x = self.view.frame.width
            
                //Same implementation in different ways
                
                // #1st
    //            let transform = CGAffineTransform(rotationAngle: 3.14)
    //            let scaledTransform = transform.scaledBy(x: 0.001, y: 0.001)
    //            self.someView.transform = scaledTransform
                
                // #2nd
    //            self.someView.transform = CGAffineTransform(rotationAngle: 3.14).scaledBy(x: 0.001, y: 0.001)
//            }
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
    
    private func animateWithKeyFrames() {
        let startPosition = someView.frame.origin
        
        UIView.animateKeyframes(withDuration: 5, delay: 0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.someView.frame.origin = CGPoint(x: 0, y: 100)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.someView.frame.origin = CGPoint(x: 220, y: 200)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.someView.center = self.view.center
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.25) {
                self.someView.frame.origin = startPosition
            }

        }
    }

    //MARK: - Actions
    
    @IBAction private func animateButtonTapped(_ sender: Any) {
//        simpleAnimation()
//        transformAnimation()
        animateWithKeyFrames()
    }
    
    @IBAction private func sliderValueChanged(_ sender: UISlider) {
        animator?.fractionComplete = CGFloat(sender.value)
    }
}

