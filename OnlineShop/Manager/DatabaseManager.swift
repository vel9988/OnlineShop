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
    
    func collectionUsers(add userApp: UserApp) -> AnyPublisher<User, Error> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return Fail(error: NSError(domain: "Error", code: 0)).eraseToAnyPublisher()
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let user = User(context: context)
        
        user.firstName = userApp.firstName
        user.lastName = userApp.lastName
        user.email = userApp.email
        user.password = userApp.password
        
        do {
            try context.save()
        } catch {
            print(DatabaseError.failedToAddUser.localizedDescription)
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return Future<User, Error> { promise in
            return promise(.success(user))
        }
        .eraseToAnyPublisher()
    }
    
    func collectionUsers(retrieve email: String, password: String) -> AnyPublisher<User, Error> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return Fail(error: NSError(domain: "Error", code: 0)).eraseToAnyPublisher()
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email, password)
        
        return Future<User, Error> { promise in
            do {
                let users = try context.fetch(fetchRequest)
                if let user = users.first {
                    promise(.success(user))
                } else {
                    promise(.failure(NSError(domain: "User not found", code: 404, userInfo: nil)))
                }
            } catch {
                promise(.failure(error))
            }
        }.eraseToAnyPublisher()
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

