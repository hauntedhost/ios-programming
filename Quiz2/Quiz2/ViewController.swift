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

  @IBAction func showAnswer(_ sender: UIButton) {
    UIView.animate(
      withDuration: 0.05,
      delay: 0,
      animations: {
        self.answerLabel.alpha = 0
      },
      completion: { _ in
        self.showAnswerButton.isEnabled = false
        self.answerLabel.text =
          self.questions[self.currentQuestionIndex].answer
        UIView.animate(
          withDuration: 0.25,
          delay: 0,
          animations: { self.answerLabel.alpha = 1 }
        )
      }
    )
  }

  @IBAction func showNextQuestion(_ sender: UIButton) {
    currentQuestionIndex += 1
    if currentQuestionIndex >= questions.count {
      currentQuestionIndex = 0
    }
    showCurrentQuestion()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    showCurrentQuestion()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  func showCurrentQuestion() {
    answerLabel.text = blankAnswerText
    UIView.animate(
      withDuration: 0.05,
      delay: 0,
      animations: {
        self.questionLabel.alpha = 0
      },
      completion: { _ in
        self.showAnswerButton.isEnabled = true
        self.questionLabel.text =
          self.questions[self.currentQuestionIndex].text
        UIView.animate(
          withDuration: 0.25,
          delay: 0,
          animations: { self.questionLabel.alpha = 1 }
        )
      }
    )
  }
}
