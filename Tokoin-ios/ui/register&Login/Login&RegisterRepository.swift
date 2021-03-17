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
}
