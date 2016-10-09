//
//  OptionViewController.swift
//  HLSettingsView
//
//  Created by Hanjie Liu on 10/3/16.
//  Copyright © 2016 Hanjie Liu. All rights reserved.
//

import UIKit

class OptionViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var buttonLeft: UIButton!
    @IBOutlet weak var buttonTop: UIButton!
    @IBOutlet weak var buttonRight: UIButton!
    @IBOutlet weak var buttonBottom: UIButton!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.delegate = self
        view.addGestureRecognizer(tap)
        
        setupButton(button: buttonLeft)
        setupButton(button: buttonRight)
        setupButton(button: buttonTop)
        setupButton(button: buttonBottom)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        //animate constriants
        leftConstraint.constant = 60
        rightConstraint.constant = 60
        topConstraint.constant = 60
        bottomConstraint.constant = 60
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()

            }, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        leftConstraint.constant = 5
        rightConstraint.constant = 5
        topConstraint.constant = 5
        bottomConstraint.constant = 5
    }
    
    func handleTap(sender: UITapGestureRecognizer? = nil){
        self.dismiss(animated: false, completion: nil)
    }
    
    func setupButton(button: UIButton){
        button.backgroundColor = UIColor(colorLiteralRed: 0, green: 153/255, blue: 1, alpha: 1)
        button.layer.cornerRadius = 30//buttonTop.bounds.height / 2
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 0.5, height: 2.0)
        button.layer.shadowRadius = 2.0
        button.layer.shadowOpacity = 0.6
    }

}
