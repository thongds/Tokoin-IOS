//
//  NewsListModel.swift
//  Tokoin-ios
//
//  Created by thongds on 16/03/2021.
//

import Foundation

struct NewsListModel : Codable{
    let status : String?
    let totalResults : Int?
    let articles : [ArticleItem]
}
struct Source : Codable{
    let id : String?
    let name : String?
}
struct ArticleItem : Codable{
    let source : Source?
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
    let content : String?
}
