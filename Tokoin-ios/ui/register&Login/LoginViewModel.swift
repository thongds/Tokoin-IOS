//
//  LoginViewModel.swift
//  Tokoin-ios
//
//  Created by thongds on 17/03/2021.
//

import Foundation
import RxSwift
class LoginViewModel {
    let repository = LoginAndRegisterRepository()
    var error = PublishSubject<ErrorModel>()
    var userName = PublishSubject<String>()
    func login(userName : String,password : String){
        repository.getUser(userName: userName, password: password){userName in
            if(userName == nil){
                self.error.onNext(ErrorModel(httpCode: 404, message: "User and password aren't correct"))
            }else{
                self.userName.onNext(userName!)
            }
        }
    }
}
