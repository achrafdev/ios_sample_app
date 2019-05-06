//
//  ViewController.swift
//  abdennadherAchraf
//
//  Created by ESPRIT on 11/28/18.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var EmploisContainer: UIView!
    @IBOutlet weak var PersonnesContainer: UIView!
    @IBOutlet weak var segmented: UISegmentedControl!
    
    
    @IBAction func switchCont(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.EmploisContainer.alpha = 1
                self.PersonnesContainer.alpha = 0
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.PersonnesContainer.alpha = 1
                self.EmploisContainer.alpha = 0
            })
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.EmploisContainer.alpha = 1
        self.PersonnesContainer.alpha = 0
    }


}

