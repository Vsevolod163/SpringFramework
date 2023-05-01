//
//  ViewController.swift
//  SpringFramework
//
//  Created by Vsevolod Lashin on 01.05.2023.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {

    @IBOutlet var coreAnimationView: UIView!
    @IBOutlet var springAnimationView: SpringView!
    
    private var animationStarted = false

    @IBAction func runCoreAnimation(_ sender: UIButton) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: [.autoreverse, .repeat]) { [unowned self] in
                if !animationStarted {
                    coreAnimationView.frame.origin.x -= 40
                    animationStarted.toggle()
                }
            }

        sender.pulsate()
    }
    
    @IBAction func runSpringButton(_ sender: SpringButton) {
        springAnimationView.animation = "shake"
        springAnimationView.curve = "easeInOut"
        springAnimationView.force = 2
        springAnimationView.animate()
        
        sender.animation = "pop"
        sender.duration = 2
        sender.animate()
    }
}

