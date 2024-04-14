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
    
    var viewModel = BirthdayViewModel()
    var brthday: Birthday?
    
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
        
        _ = viewModel.birthday.subscribe(onNext: { birthday in
            self.brthday = birthday
        })
    }
    
    
    @IBAction func button(_ sender: Any) {
        createNewData()
    }

    @IBAction func buttonDelete(_ sender: Any) {
        deleteData()
    }
    
    func createNewData() {
        if let brtName = nameField.text, let brtDate = birthdayField.text {
            self.viewModel.loadDatas(name: brtName, date: brtDate)
        }
        nameLabel2.text = "Name: \(nameField.text!)"
        birthdayLabel2.text = "Birthday: \(birthdayField.text!)"
    }
    
    func deleteData() {
        viewModel.removeData()
        self.nameField.text = "Name: "
        self.birthdayField.text = "Birthday: "
    }
}
