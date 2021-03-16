//
//  ErrorModel.swift
//  Tokoin-ios
//
//  Created by thongds on 17/03/2021.
//

import Foundation

struct ErrorModel : Decodable {
    let httpCode : Int
    let message : String
}
