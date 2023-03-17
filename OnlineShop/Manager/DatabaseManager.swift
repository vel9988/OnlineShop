//
//  DatabaseManager.swift
//  OnlineShop
//
//  Created by Dmitryi Velko on 13.03.2023.
//

import Foundation
import UIKit
import Combine
import CoreData

enum DatabaseError: Error {
    case failedToAddUser
    case failedToRetrieveUser

}

final class DatabaseManager {
    static let shared = DatabaseManager()
    
    func collectionUsers(add userApp: UserApp) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let user = User(context: context)
        
        user.firstName = userApp.firstName
        user.lastName = userApp.lastName
        user.email = userApp.email
        user.password = userApp.password
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(DatabaseError.failedToAddUser.localizedDescription)
            }
        }
        
    }
    
    func isRegisterUserFrom(email: String) -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return true }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)

        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                return true
            }
        } catch {
            print(error)
        }
        return false
    }

   
}
