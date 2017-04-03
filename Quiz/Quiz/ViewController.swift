//
//  ViewController.swift
//  Quiz
//
//  Created by sean on 4/3/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var questionLabel: UILabel! = nil
  @IBOutlet var answerLabel: UILabel! = nil
  
  let blankAnswerLabel = "???"
  var currentQuestionIndex: Int = 0

  let questions: [String] = [
    "what exactly is a cat?",
    "but do you even lift bro?",
    "how many layers of irony are you on?",
  ]

  let answers: [String] = [
    "witchcraft obv",
    "<*>",
    "three, am i like a little baby?",
  ]

  @IBAction func showNextQuestion(_ sender: UIButton) {
    currentQuestionIndex += 1
    if currentQuestionIndex == questions.count {
      currentQuestionIndex = 0
    }
    refreshView()
  }

  @IBAction func showAnswer(_ sender: UIButton) {
    answerLabel.text = answers[currentQuestionIndex]
  }

  private func refreshView() {
    questionLabel.text = questions[currentQuestionIndex]
    answerLabel.text = blankAnswerLabel
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    refreshView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

