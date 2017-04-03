//
//  ViewController.swift
//  Quiz2
//
//  Created by sean on 4/3/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var questionLabel: UILabel!
  @IBOutlet var answerLabel: UILabel!
  @IBOutlet var showAnswerButton: UIButton!
  
  let blankAnswerText = "???"

  var currentQuestionIndex = 0

  let questions: [Question] = [
    Question(
      text: "what precisely is the meaning of life?",
      answer: "42 doye"
    ),
    Question(
      text: "what actually is a cat tho?",
      answer: "witchcraft obv"
    ),
    Question(
      text: "how many layers of irony are you on?",
      answer: "three, am i like a little baby?"
    ),
  ]
  
  func refreshText() {
    questionLabel.text = questions[currentQuestionIndex].text
    answerLabel.text = blankAnswerText
    showAnswerButton.isEnabled = true
  }
  
  @IBAction func showNextQuestion(_ sender: UIButton) {
    currentQuestionIndex += 1
    if currentQuestionIndex >= questions.count {
      currentQuestionIndex = 0
    }
    refreshText()
  }

  @IBAction func showAnswer(_ sender: UIButton) {
    answerLabel?.text = questions[currentQuestionIndex].answer
    showAnswerButton.isEnabled = false
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    refreshText()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

