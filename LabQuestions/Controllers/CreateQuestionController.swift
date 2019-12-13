//
//  CreateQuestionController.swift
//  LabQuestions
//
//  Created by Alex Paul on 12/11/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateQuestionController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var labPickerView: UIPickerView!
    
    
    // data for our picker view
    private var labs = ["Concurrency", "Comic", "Parsing JSON - Weather, Color, User", "Image and Error Handling", "StocksPeople", "Intro to Unit testing - Jokes, Star Wars, Trivia"].sorted() // ascending by default a -z
    
    // labName will be the current selected row in the picker view
    private var labName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // configure the picker view
        labPickerView.dataSource = self
        labPickerView.delegate = self
        
        // variable to track the current selected lab in the picker view
        labName = labs.first // default lab is the first row in the picker view
        
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // we want to change the color and border width of the text view
        // experiment with shadows on views
        // every view had a CALayer - Core Animation
        
        // semantic colors are new to iOS13
        // semamtic colors adapt to light or dark mode
        // CG - core graphics
        questionTextView.layer.borderColor = UIColor.systemGray.cgColor
        questionTextView.layer.borderWidth = 1
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func createQuestion(_ sender: UIBarButtonItem) {
        // 3 required parameters to create a PostedQuestion
        guard let questionTitle = titleTextField.text,
    }
    
}

extension CreateQuestionController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      return  labs.count
    }
    
}


extension CreateQuestionController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return labs[row]
    }
    
    
    
    
    
}
