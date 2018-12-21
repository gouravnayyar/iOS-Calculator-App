//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Gourav Nayyar on 18/12/18.
//  Copyright © 2018 Gourav Nayyar. All rights reserved.
//

import UIKit

// 12 + 16
// previousNumber (12)
// numberOnScreen (16)
// isPerformingOperation BOOL true/false
// operation + - / *
// tag (what is pressed on the screen)


class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!

    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var isPerformingOperation = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.text = ""
    }

    @IBAction func numberPressed(_ sender: Any) {

        guard let tag = (sender as? UIButton)?.tag else {
            // Logs
            return
        }

        if isPerformingOperation == true {
            isPerformingOperation = false
            resultLabel.text = String(tag-1)
        } else if let text = resultLabel.text {
            resultLabel.text = text + String(tag - 1)
        }

        if let resultText = resultLabel.text, let numOnScreen = Double(resultText) {
            numberOnScreen = numOnScreen
        }

    }

    @IBAction func operatorPressed(_ sender: Any) {

        let tag = (sender as! UIButton).tag

        /*clear button - 16 */
        if tag == 16 {
            resultLabel.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0

            return
        }

        /* operation +(14) -(13) /(11) x(12)  = (15)*/

        if (tag == 11 || tag == 12 || tag == 13 || tag == 14) {
            operation = tag
            isPerformingOperation = true
            previousNumber = Double(resultLabel.text!)!

            if tag == 11 {
                resultLabel.text = "/"
            } else if tag == 12 {
                resultLabel.text = "*"
            } else if tag == 13 {
                resultLabel.text = "-"
            } else if tag == 14 {
                resultLabel.text = "+"
            }
        }


         if tag == 15 {
            /* = / + - */
            // operation (tag)
            if operation == 11 {
                resultLabel.text = String(previousNumber / numberOnScreen)

            } else if operation == 12 {
                resultLabel.text = String(previousNumber * numberOnScreen)

            } else if operation == 13 {
                resultLabel.text = String(previousNumber - numberOnScreen)

            } else if operation == 14 {
                resultLabel.text = String(previousNumber + numberOnScreen)
            }
        }
    }
}

