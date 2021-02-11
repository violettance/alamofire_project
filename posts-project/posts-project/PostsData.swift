// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let postsData = try? newJSONDecoder().decode(PostsData.self, from: jsonData)

import Foundation

// MARK: - PostsDatum
struct PostsDatum: Codable {
    let userID, id: Int
    var title: String
    var body: String
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id
        case title
        case body
    }
}

typealias PostsData = [PostsDatum]
var item: PostsData? = []
