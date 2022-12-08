//
//  SecondViewController.swift
//  Animations
//
//  Created by Tadas Petrikas on 2022-12-08.
//

import UIKit

class SecondViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet private weak var someView: UIView!
    @IBOutlet private weak var someViewTopConstraint: NSLayoutConstraint!
    @IBOutlet private weak var someViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet private weak var someViewLeadingConstraint: NSLayoutConstraint!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        constraintAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    //MARK: - Private
    
    private func constraintAnimation() {
//        someViewTopConstraint.constant = 744
        someViewWidthConstraint.constant = self.view.frame.width * 0.7
//        someViewLeadingConstraint.constant = 200
        
        UIView.animate(withDuration: 3) {
            self.view.layoutIfNeeded()
        }
    }
    
    private func animateView() {
        firstAnimation()
    }
    
    private func firstAnimation() {
        UIView.animate(withDuration: 1) {
            self.someView.frame = CGRect(origin: CGPoint(x: 0, y: 744), size: CGSize(width: 75, height: 75))
        } completion: { _ in
            self.secondAnimation()
        }
    }
    
    private func secondAnimation() {
        UIView.animate(withDuration: 1) {
            self.someView.frame = CGRect(origin: CGPoint(x: 290, y: 744), size: CGSize(width: 50, height: 50))
        } completion: { _ in
            self.thirdAnimation()
        }
    }

    private func thirdAnimation() {
        UIView.animate(withDuration: 1) {
            self.someView.frame = CGRect(origin: CGPoint(x: 290, y: 0), size: CGSize(width: 25, height: 25))
        } completion: { _ in
            self.fourthAnimation()
        }
    }
    
    private func fourthAnimation() {
        UIView.animate(withDuration: 1) {
            self.someView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0, height: 0))
        }
    }
}
