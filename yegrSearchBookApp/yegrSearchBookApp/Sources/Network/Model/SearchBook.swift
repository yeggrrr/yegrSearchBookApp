//
//  SearchBook.swift
//  yegrSearchBookApp
//
//  Created by YJ on 5/9/24.
//

import Foundation

struct BookResult: Decodable {
    let meta: Meta
    let documents: [Document]
}

struct Meta: Decodable {
    let is_end: Bool
    let pageable_count: Int
    let total_count: Int
}

struct Document: Decodable {
    let authors: [String]
    let contents: String
    // let datetime: String
    let isbn: String
    let price: Int
    let publisher: String
    let sale_price: Int
    let status: String
    let thumbnail: String
    // let translators: [String]
    let url: String
}
