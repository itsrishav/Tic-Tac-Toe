//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Rishav Pandey on 13/12/16.
//  Copyright © 2016 AviaBird. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 1 for nought, 2 for cross
    var whichPlayer = 1
    var result = false
    var position = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombination = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 6, 8], [0, 4, 8], [2, 4, 6]]
    @IBOutlet var retryButton: UIButton!
    @IBOutlet var label: UILabel!
    
    @IBAction func retryPressed(_ sender: AnyObject) {
        position = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        whichPlayer = 1
        result = false
        retryButton.isHidden = true
        label.isHidden = true
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
    }
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        let positionTaken = sender.tag - 1
        if position[positionTaken] == 0 && !result {
            position[positionTaken] = whichPlayer
            if whichPlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                whichPlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                whichPlayer = 1
            }
            for var winner in winningCombination {
                if position[winner[0]] != 0 && position[winner[0]] == position[winner[1]] && position[winner[1]] == position[winner[2]] {
                    label.isHidden = false
                    retryButton.isHidden = false
                    UIView.animate(withDuration: 1, animations: {
                        self.label.center = CGPoint(x: self.label.center.x + 500, y: self.label.center.y)
                        self.retryButton.center = CGPoint(x: self.retryButton.center.x - 500, y: self.retryButton.center.y)
                        if self.whichPlayer == 1 {
                            self.label.text = "Cross Won"
                        } else {
                            self.label.text = "Nought Won"
                        }
                    })
                    result = true
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        retryButton.isHidden = true
        label.center = CGPoint(x: label.center.x - 500, y: label.center.y)
        retryButton.center = CGPoint(x: retryButton.center.x + 500, y: retryButton.center.y)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

