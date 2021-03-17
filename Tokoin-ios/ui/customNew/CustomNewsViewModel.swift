//
//  CustomNewsViewModel.swift
//  Tokoin-ios
//
//  Created by thongds on 17/03/2021.
//

import Foundation
import RxSwift
import RxCocoa
class CustomNewsViewModel {
    let customNewsRepository = CustomNewsRepository()
    var articleListItem = PublishSubject<[ArticleItem]>()
    var error = PublishSubject<ErrorModel>()
    func requestNewsByCategory(category : String){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-mm-dd"
        let from = formatter.string(from: Date())
        customNewsRepository.requestHomeApi(category: category, from: from){ data , err in
            if(data != nil){
                self.articleListItem.onNext(data!.articles)
            }
            if(err != nil){
                self.error.onNext(err!)
            }
        }
    }
    
}
