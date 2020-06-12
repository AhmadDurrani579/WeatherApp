//
//  Response.swift
//

import Foundation

protocol Response: Codable {
    var cnt: Int? { get }

}


struct List : Decodable {
    var id: Int
    var name: String
    var country: String
}


