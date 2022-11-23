//
//  Quotes.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 23.11.2022.
//

import Foundation

struct Quotes: Codable{
    let id: Int
    let quote: String
    let author: String
    let series: String
    
    enum CodingKeys: String, CodingKey{
        case id = "quote_id"
        case quote = "quote"
        case author = "author"
        case series = "series"
    }
}
