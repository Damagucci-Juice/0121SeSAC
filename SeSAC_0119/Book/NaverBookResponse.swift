//
//  NaverBookResponse.swift
//  SeSAC_0119
//
//  Created by Gucci on 1/21/26.
//
import Foundation

struct Book: Decodable {
    let documents: [BookInfo]
    let meta: BookMeta
}

struct BookInfo: Decodable {
    let title: String
    let authors: [String]
    let contents: String
    let thumbnail: String
    let url: String
}

struct BookMeta: Decodable {
    let isEnd: Bool
    let pagableCount: Int
    let totalCount: Int

    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pagableCount = "pageable_count"
        case totalCount = "total_count"
    }
}
