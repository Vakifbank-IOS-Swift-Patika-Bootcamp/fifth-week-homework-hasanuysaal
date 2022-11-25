//
//  Character.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 23.11.2022.
//

import Foundation

struct SerieCharacter: Codable {
    let id: Int
    let name: String
    let birthday: String
    let nickname: String
    let status: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name = "name"
        case birthday = "birthday"
        case nickname = "nickname"
        case status = "status"
        case imageUrl = "img"
    }
}
