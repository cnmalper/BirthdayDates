//
//  BirthdayViewModel.swift
//  BirthdayDates
//
//  Created by Alper Canımoğlu on 13.04.2024.
//

import Foundation
import RxSwift

class BirthdayViewModel {
    
    var bRepo = BirthdayDaoRepository()
    var birthday = BehaviorSubject<Birthday?>(value: nil)

    init() {
        birthday = bRepo.birthday
    }
    
    func loadDatas(name: String, date: String) {
        bRepo.loadBirthdays(name: name, date: date)
    }
    
    func removeData() {
        bRepo.deleteBirthday()
    }
}
