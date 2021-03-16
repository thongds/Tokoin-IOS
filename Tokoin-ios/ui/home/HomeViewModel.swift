//
//  TedMasterViewModel.swift
//  IeltsListenTool
//
//  Created by thongds on 1/15/21.
//  Copyright © 2021 thongds. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
class HomeViewModel {
    let homeRepository = HomeRepository()
    var articleListItem = PublishSubject<[ArticleItem]>()
    var error = PublishSubject<ErrorModel>()
    init() {
        homeRepository.requestHomeApi{(data,error) in
            
            if(data != nil){
                self.articleListItem.onNext(data!.articles)
            }
            
            if(error != nil){
                self.error.onNext(error!)
            }
        }
    }
    
}
