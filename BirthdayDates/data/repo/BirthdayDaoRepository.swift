//
//  BirthdayDaoRepository.swift
//  BirthdayDates
//
//  Created by Alper Canımoğlu on 13.04.2024.
//

import Foundation
import RxSwift

class BirthdayDaoRepository {
    
    var birthday = BehaviorSubject<Birthday?>(value: nil)
    
    func loadBirthdays(name: String, date: String) {
        
        let brt1 = Birthday(name: name, birthday: date)
        
        UserDefaults.standard.set(brt1.name, forKey: "name")
        UserDefaults.standard.set(brt1.birthday, forKey: "birthday")
        
        birthday.onNext(brt1)
    }
    
    func deleteBirthday() {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
        }
        
        if (storedBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
        }
    }
}
