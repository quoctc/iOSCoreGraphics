//
//  ViewController.swift
//  iOSCoreGraphics
//
//  Created by Quoc Tran on 2/11/18.
//  Copyright © 2018 Panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counterView.counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushButtonPressed(_ button: PushButton) {
        if button.isAddButton {
            guard counterView.counter < CounterView.Constants.numberOfGlasses else {
                return
            }
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
    }

}

