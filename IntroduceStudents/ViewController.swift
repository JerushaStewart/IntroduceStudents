//
//  ViewController.swift
//  IntroduceStudents
//
//  Created by Jerusha Stewart on 8/24/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var morePetsStepper: UIStepper!
    
    @IBOutlet weak var IntroduceSelf: UIButton!
    @IBAction func stepperDidChange(_ sender: UIStepper) {
         
         numberOfPetsLabel.text = "\(Int(sender.value))"
     }
    

    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        // Use optional binding to safely unwrap optionals
        guard let firstName = firstNameTextField.text, !firstName.isEmpty,
              let lastName = lastNameTextField.text, !lastName.isEmpty,
              let schoolName = schoolNameTextField.text, !schoolName.isEmpty,
              let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex),
              let numberOfPets = numberOfPetsLabel.text else {
            print("Please complete all fields.")
            return
        } 
        
        // Creating a variable of type string, that holds an introduction. The introduction interpolates the values from the text fields provided.
        // Using triple quotes to format the string across multiple lines
        let introduction = """
        My name is \(firstName) \(lastName) and I attend \(schoolName).
        I am currently in my \(year) year and I own \(numberOfPets) dogs.
        It is \(morePetsSwitch.isOn) that I want more pets.
        """ 
        
        // Creates the alert where we pass in our message, which our introduction.
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        
        // A way to dismiss the box once it pops up
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
        
        // Passing this action to the alert controller so it can be dismissed
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

 
}


