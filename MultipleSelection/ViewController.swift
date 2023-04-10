//
//  ViewController.swift
//  MultipleSelection
//
//  Created by Lee chanwen on 4/7/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    @IBOutlet weak var scoreCount: UIProgressView!
    @IBOutlet weak var scoreValue: UILabel!
    @IBOutlet weak var questionCount: UIProgressView!
    @IBOutlet weak var questionValue: UILabel!
    @IBOutlet weak var seqLabel: UILabel!
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var nexrQuestion: UIButton!
    @IBOutlet weak var startTest: UIButton!
    
    // Random the questions sequence and creat the quesion sequence array
    var arr = Array(0...19).shuffled()
    lazy var sequenceArray = Array(arr)
    
    // Set question conten in "questions" aray
    let questions = [
        "1. The ode was original a ceremonial poem written to celebrate public occasions or exalted subjects. ",
        "2. Knowledge of the rate at which a ship is traveling through the water is important if the navigator need to estimate the time of arrival.",
        "3. The earth is the only planet with a large number of oxygen in its atmosphere. ",
        "4. Robert Frost was not well known as a poet until he reached the forties. ",
        "5. A painter who lived most of his life in the Middle West, Grant wood has called America's 'Painter of the Soil.' ",
        "6. While ancient times people simply painted inanimate objects, during the Renaissance the painting of 'still life' developed as an accepted art form. ",
        "7. The American frontiersman, politician, and soldier Davy crockett is one of the most popular of American hero. ",
        "8. Three months after they have been laid, crocodile eggs are ready hatched.",
        "9. Peas require rich soil, constant moistures, and a cool growing season to develop well. ",
        "10. A dolphin locates underwater objects in its path by doing a series of clicking and whistling sounds. ",
        "11. A desert area that has been without water for six years will still bloom when rain will come. ",
        "12. One of the essential features of the modern skyscraper is being the elevator. ",
        "13. A rabbit moves about by hopping on its hind legs, which are much longer and more strong than its front legs.",
        "14. The snowy egret is about the size of large crow. ",
        "15. During the Middle Ages, handwriting notices kept groups of nobles informed of important events. ",
        "16. The grape is the __________ , juicy fruit of a woody vine. ",
        "17. In the second half of the nineteenth century, textiles from the southwestern United state, particularly fabrics woven by the Navajo people, ___________ .",
        "18 . During adolescence many young people begin to question _______ held by their families. ",
        "19. In her writing, Elimor Wylie often dealt with her own personality as it was, rather than _________ . ",
        "20. Congress chartered the first Bank of the United States in 1791 to engage in general commercial banking and _________ as a fiscal agent of the federal government."
    ]
    
    // Set answers content in "answers" array
    let answers = [
        ["A. original","B. a ceremonial","C. written to","D. or"],
        ["A. Knowledge of","B. at which","C. through","D. need to"],
        ["A. the","B. number","C. oxygen","D. its"],
        ["A. as","B. a poet","C. reached","D. the"],
        ["A. A painter","B. most","C. his life","D. has called"],
        ["A. While ancient","B. during","C. of","D. develop as"],
        ["A. frontiersman","B. most","C. of","D. hero"],
        ["A. laid","B. crocodile","C. ready","D. hatched"],
        ["A. rich","B. moistures","C. season","D. well"],
        ["A. in","B. its","C. doing","D. whisting"],
        ["A. has been","B.  without water","C. bloom","D. will come"],
        ["A. essential","B.  modern skyscraper","C. is being","D. elevator"],
        ["A. moves about","B.  by happing","C. which are","D. more strong"],
        ["A. snowy","B. about","C. the size","D. of large crow"],
        ["A. During","B. handwriting","C. kept","D. informed of"],
        ["A. Skin","B. which is smooth","C. smooth skin","D. smooth-skinned"],
        ["A. began to be used as rugs","B. rugs began to be used ","C. as rugs began to be used","D. began to used them as rugs"],
        ["A. the values","B. of the values","C.  the values are","D. are the values"],
        ["A. as was defines by others","B. its definitions by others","C. other's definition ","D. as others defined it "],
        ["A. to act ","B. acting","C. that has acted","D. having acted"]
    ]
    
    // Set right answers in "rightAnswer" array
    let rightAnswer = [
        "1","4","2","4",
        "4","1","3","4",
        "2","4","4","3",
        "4","4","2","4",
        "1","1","4","1"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initial the page setting
       
        choice1.isEnabled = false
        choice2.isEnabled = false
        choice3.isEnabled = false
        choice4.isEnabled = false
        qLabel.isHidden = true
        seqLabel.isHidden = true
        questionLable.layer.cornerRadius = 20
        questionLable.clipsToBounds = true
        choice1.layer.cornerRadius = 10
        choice2.layer.cornerRadius = 10
        choice3.layer.cornerRadius = 10
        choice4.layer.cornerRadius = 10
        
//        var gradientLayer1 = CAGradientLayer()
//        gradientLayer1.frame = CGRect(x: 0, y: 0, width: 170, height: 40)
//        gradientLayer1.colors = [CGColor(red: 1, green: 1, blue: 1, alpha: 1), CGColor(red: 0, green: 0.5, blue: 0, alpha: 1)]
//        gradientLayer1.cornerRadius = 20
//        startTest.layer.addSublayer(gradientLayer1)
//        startTest.titleLabel?.text = "Start Test"
        
        startTest.backgroundColor = UIColor(cgColor: CGColor(red: 0, green: 1, blue: 0, alpha: 0.5))
        startTest.layer.cornerRadius = 17
        
        nexrQuestion.backgroundColor = UIColor(cgColor: CGColor(red: 1, green: 0, blue: 1, alpha: 0.5))
        nexrQuestion.layer.cornerRadius = 17
        
        
        
    // Do any additional setup after loading the view.
    }
    
    var sequenceNumber: Int = 0
    var scoreNumber: Int = 0
 
    
    // creat function to reset question buttons
    func questionReset() {
        
        choice1.layer.borderWidth = 2
        choice1.layer.borderColor = UIColor.black.cgColor
        choice2.layer.borderWidth = 2
        choice2.layer.borderColor = UIColor.black.cgColor
        choice3.layer.borderWidth = 2
        choice3.layer.borderColor = UIColor.black.cgColor
        choice4.layer.borderWidth = 2
        choice4.layer.borderColor = UIColor.black.cgColor
        
        choice1.isEnabled = true
        choice2.isEnabled = true
        choice3.isEnabled = true
        choice4.isEnabled = true
        nexrQuestion.isEnabled = true
        qLabel.isHidden = true
        
    }
    
    // Creat function to update 'UIProgress View' and Progress label
    func updateProgress (){
        
        scoreNumber = scoreNumber + 100 / questions.count
        scoreValue.text = " \(scoreNumber) "
        scoreCount.progress = Float(scoreNumber) / 100
        choice1.isEnabled = false
        choice2.isEnabled = false
        choice3.isEnabled = false
        choice4.isEnabled = false
        
        
    }
    
   // Inition question test and set the value of score and question count to zero
    @IBAction func startTest(_ sender: Any) {
        let qNumber = 0
        sequenceNumber = 0
        scoreNumber = 0
        setQuestion(QuestionNumber: qNumber)
        scoreValue.text = "\(scoreNumber)"
        scoreCount.progress = Float(scoreNumber)
        seqLabel.text = "\(sequenceArray[0]) , \(sequenceArray[1]), \(sequenceArray[2])"
        
        questionReset()
        
    }

//    func myArray() -> Array<Int>{
//        let arr = Array(0...19).shuffled()
//        return arr
//    }
//
    // Set the content of question and answers
    func setQuestion(QuestionNumber: Int)  {
        let questionNumber = sequenceArray [(QuestionNumber)]
        let qCount = QuestionNumber + 1

        questionLable.text = questions [(questionNumber)]
        choice1.setTitle(answers [(questionNumber)][0], for: .normal)
        choice2.setTitle(answers [(questionNumber)][1], for: .normal)
        choice3.setTitle(answers [(questionNumber)][2], for: .normal)
        choice4.setTitle(answers [(questionNumber)][3], for: .normal)

        seqLabel.text = "\(sequenceArray[0]) , \(sequenceArray[1]), \(sequenceArray[2])"
        
        questionValue.text = "\(qCount) / 20"
        questionCount.progress = Float(qCount) / 20

    }
    
    // Set board color of button to red for wrong answers, green for right answer
    func changeFrameColor (QuestionNumber: Int) {
        let number = sequenceArray[(QuestionNumber)]
        
        choice1.layer.borderWidth = 2
        choice1.layer.borderColor = UIColor.red.cgColor
        choice2.layer.borderWidth = 2
        choice2.layer.borderColor = UIColor.red.cgColor
        choice3.layer.borderWidth = 2
        choice3.layer.borderColor = UIColor.red.cgColor
        choice4.layer.borderWidth = 2
        choice4.layer.borderColor = UIColor.red.cgColor
        
        let answer = rightAnswer[number]
        
        if answer == "1" {
            choice1.layer.borderColor = UIColor.green.cgColor
        }
        if answer == "2" {
            choice2.layer.borderColor = UIColor.green.cgColor
        }
        if answer == "3" {
            choice3.layer.borderColor = UIColor.green.cgColor
        }
        if answer == "4" {
            choice4.layer.borderColor = UIColor.green.cgColor
        }
        
    }
    
    // If player push button 1
    @IBAction func choice1Push(_ sender: Any) {
        let qnumber = sequenceNumber
        let answerNumber = sequenceArray[(qnumber)]
        let answer = rightAnswer[answerNumber]
        changeFrameColor(QuestionNumber: qnumber)
        
        if answer == "1" {
            updateProgress()
        }
        if sequenceNumber >= (questions.count-1) {
            qLabel.text?.append("Score: \(scoreNumber)")
            qLabel.isHidden = false
        }
    }
    // If player push button 2
    @IBAction func choice2Push(_ sender: Any) {
        let qnumber = sequenceNumber
        let answerNumber = sequenceArray[(qnumber)]
        let answer = rightAnswer[answerNumber]
        changeFrameColor(QuestionNumber: qnumber)
        
        if answer == "2" {
            updateProgress()
        }
        if sequenceNumber >= (questions.count-1) {
            qLabel.text?.append("Score: \(scoreNumber)")
            qLabel.isHidden = false
        }
    }
    // If player push button 3
    @IBAction func choice3Push(_ sender: Any) {
        let qnumber = sequenceNumber
        let answerNumber = sequenceArray[(qnumber)]
        let answer = rightAnswer[answerNumber]
        changeFrameColor(QuestionNumber: qnumber)
    
        if answer == "3" {
            updateProgress()
        }
        if sequenceNumber >= (questions.count-1) {
            qLabel.text?.append("Score: \(scoreNumber)")
            qLabel.isHidden = false
        }
    }
    // If player push button 4
    @IBAction func choice4Push(_ sender: Any) {
        let qnumber = sequenceNumber
        let answerNumber = sequenceArray[(qnumber)]
        let answer = rightAnswer[answerNumber]
        changeFrameColor(QuestionNumber: qnumber)
        
        if answer == "4" {
            updateProgress()
        }
        if sequenceNumber >= (questions.count-1) {
            qLabel.text?.append("Score: \(scoreNumber)")
            qLabel.isHidden = false
        }
    }
    // If player the button 'Next Question'
    @IBAction func nextQuestion(_ sender: Any) {
        let qnumber = sequenceNumber
        sequenceNumber = qnumber + 1
        setQuestion(QuestionNumber: sequenceNumber)
        choice1.layer.borderWidth = 2
        choice1.layer.borderColor = UIColor.black.cgColor
        choice2.layer.borderWidth = 2
        choice2.layer.borderColor = UIColor.black.cgColor
        choice3.layer.borderWidth = 2
        choice3.layer.borderColor = UIColor.black.cgColor
        choice4.layer.borderWidth = 2
        choice4.layer.borderColor = UIColor.black.cgColor

        choice1.isEnabled = true
        choice2.isEnabled = true
        choice3.isEnabled = true
        choice4.isEnabled = true
        
        if sequenceNumber >= (questions.count - 1) {
            nexrQuestion.isEnabled = false
        }
    }

}

