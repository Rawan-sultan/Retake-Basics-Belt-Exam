//
//  ViewController.swift
//  Heads Up
//
//  Created by 라완 💕 on 07/05/1444 AH.
//

import UIKit

class ViewController: UIViewController {
    // MARK: variables
    var sccore: Int = 0

    var newCardWord: [String] = []
    var index: Int = 0
    var counter: Int = 60
        var time = Timer()
    // MARK: IBOutlet
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var skipOut: UIButton!
    @IBOutlet weak var cardOut: UIButton!
    @IBOutlet weak var restart: UIButton!
    
    // MARK: new card button to apper new word and the score will incremented by 1
    @IBAction func newCard() {

            self.word.text = words.wordData.randomElement()
            newCardWord.append(self.word.text!)
            index += 1
            score.text = "Score: \(sccore)"
            sccore += 1
        }
        
    // MARK: skip button to skip word and the score will not incremented
    @IBAction func skipButton(_ sender: UIButton) {
    
           word.text = words.wordData.randomElement()
        }
    
    // MARK: if sccore = 10 the game will end
    func finalResult(){
            result.isHidden = false
            skipOut.isHidden = true
            cardOut.isHidden = true
            word.isHidden = true
            restart.isHidden = false
            newCardWord.removeLast()
            result.text = "\(newCardWord.joined(separator: "\n"))"
    
       
    }
    // MARK: restart the game
    @IBAction func restart(_ sender: UIButton) {
        
    }
    
    // MARK: struct for words
    struct words {
        static var wordData = ["share","amusement park","delay","asleep","pig","elephant","ladybug","bunt"]
        
    }
    // MARK: Count Down Timer
    @objc func update() {
        counter -= 1
        timer.text = "00:\(counter)"
        
        if counter == 0{
            finalResult()
            time.invalidate()
           timer.isHidden = true
       }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        result.isHidden = true
        restart.isHidden = true
        time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
    }


}


