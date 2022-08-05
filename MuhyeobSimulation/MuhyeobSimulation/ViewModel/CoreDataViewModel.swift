//
//  CoreDataViewModel.swift
//  MuhyeobSimulation
//
//  Created by Hyeonsoo Kim on 2022/08/04.
//

import SwiftUI

class CoreDataViewModel: ObservableObject {
    
    let manager = PersistenceController.shared
    
    func addLifeHistory(user: User) {
        let life = Life(context: manager.viewContext)
        life.userName = user.userName
        life.userClass = user.userClass.rawValue
        life.userHealth = user.userHealth
        life.userExternal = user.userExternal
        life.userInternal = user.userInternal
        life.userPower = user.userPower
        life.userMoney = Int64(user.userMoney)
        life.userPopularity = Int64(user.userPopularity)
        life.userUnderstanding = Int64(user.userUndestanding)
        life.collectedItems = user.collectedItems
        life.collectedTitles = user.collectedTitles
        manager.saveContext()
    }
    
    func deleteLifeHistory(life: Life) {
        manager.viewContext.delete(life)
        manager.saveContext()
    }
    
    func addTitle(titleName: String) {
        let title = Title(context: manager.viewContext)
        title.titleName = titleName
        manager.saveContext()
    }
}
