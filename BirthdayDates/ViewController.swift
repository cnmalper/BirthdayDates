//
//  ViewController.swift
//  BirthdayDates
//
//  Created by Alper Canımoğlu on 18.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var birthdayField: UITextField!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var birthdayLabel2: UILabel!
    @IBOutlet weak var birtdayImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // Casting -> as? or as!
        
        if let newName = storedName as? String {
            nameLabel2.text = "Name: \(newName)"
        }
        if let newBirthday = storedBirthday as? String{
            birthdayLabel2.text = "Birthday: \(newBirthday)"
        }
    }
    
    
    @IBAction func button(_ sender: Any) {
        
        UserDefaults.standard.set(nameField.text!, forKey: "name")
        UserDefaults.standard.set(birthdayField.text!, forKey: "birthday")
        // UserDefaults.standard.synchronize() => We don't use it anymore.
        
        nameLabel2.text = "Name: \(nameField.text!)"
        birthdayLabel2.text = "Birthday: \(birthdayField.text!)"
        
        
        
    }

    @IBAction func buttonDelete(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel2.text = "Name: "
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel2.text = "Birthday: "
            
        }
        
        
        
    }
}
