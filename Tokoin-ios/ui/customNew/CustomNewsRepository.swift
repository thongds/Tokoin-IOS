//
//  CustomNewsReponse.swift
//  Tokoin-ios
//
//  Created by thongds on 17/03/2021.
//

import Foundation
import Alamofire
class CustomNewsRepository {
    func requestHomeApi(category : String,from : String,callback : @escaping(NewsListModel?,ErrorModel?) -> Void){
        let homeRequestUrl = AppConfig.baseUrl+"/v2/everything?sortBy=popularity"
        let params = ["q" : category,"from" : from, "apiKey" : AppConfig.apiKey]
        AF.request(homeRequestUrl,method: .get, parameters: params).responseJSON{json in
            switch(json.result){
            case .success(_):
                let value = json.data
                let decoder = JSONDecoder()
                switch json.response?.statusCode {
                case 200:
                    let categoryData = try? decoder.decode(NewsListModel.self, from: value!)
                    if categoryData == nil{
                        callback(nil,ErrorModel(httpCode: 500, message: "Unknow error!"))
                    }
                    callback(categoryData,nil)
                    break
                default:
                    break
                }
            break
            case .failure(let error) :
                callback(nil,ErrorModel(httpCode: 500, message: error.errorDescription ?? "Unknow error!"))
                break
            }
            
        }
    }
}
