//
//  Login&RegisterRepository.swift
//  Tokoin-ios
//
//  Created by thongds on 17/03/2021.
//

import Foundation
import CoreData
import UIKit

class LoginAndRegisterRepository {
    private var fetchedRC: NSFetchedResultsController<UserEntry>!
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func createUser(userName : String,password : String,callback : @escaping(Bool) -> Void){
        let context =  appDelegate.persistentContainer.newBackgroundContext()
        let userEntry = UserEntry(context: context)
        userEntry.user_name = userName
        userEntry.password = password
        context.perform {
                do{
                    try context.save()
                    callback(true)
                }catch{
                    callback(false)
                }
        }
    }
    
    func getUser(userName : String,password : String,callback : @escaping((String?) -> Void)){
        let context =  appDelegate.persistentContainer.newBackgroundContext()
        let request = UserEntry.fetchRequest() as NSFetchRequest<UserEntry>
        context.perform {
            do{
               let result = try context.fetch(request)
               for item in result{
                    if item.user_name == userName && item.password == password{
                        callback(item.user_name ?? nil)
                        return
                    }
               }
                callback(nil)
            }catch let error as NSError{
                print("error fetch \(error.localizedRecoverySuggestion ?? "")")
                callback(nil)
            }
        }
        
    }
}
