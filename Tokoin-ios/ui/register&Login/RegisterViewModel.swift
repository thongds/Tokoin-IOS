//
//  RegisterViewModel.swift
//  Tokoin-ios
//
//  Created by thongds on 17/03/2021.
//

import Foundation
import RxSwift
class RegisterViewModel {
    let repository = LoginAndRegisterRepository()
    var error = PublishSubject<ErrorModel>()
    var success = PublishSubject<Bool>()
    func createUser(userName : String,password : String,confirmPassword : String){
        if(password.trimmingCharacters(in: .whitespaces).isEmpty || userName.trimmingCharacters(in: .whitespaces).isEmpty){
            self.error.onNext(ErrorModel(httpCode: 403, message: "fields can't empty"))
            return
        }
        if(password != confirmPassword){
            self.error.onNext(ErrorModel(httpCode: 403, message: "password isn't match"))
            return
        }
        repository.createUser(userName: userName, password: password){success in
            if(!success){
                self.error.onNext(ErrorModel(httpCode: 403, message: "User already exits"))
            }else{
                self.success.onNext(true)
            }
        }
    }
}
