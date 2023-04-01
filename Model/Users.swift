//
//  Users.swift
//  Motton Challnge
//
//  Created by salah waleed on 01/04/2023.
//

import Foundation
 

// MARK: - UserdetaliseElement
struct UserdetaliseElement: Codable {
 
    var urls: Urls?
 
    var user: User?

    enum CodingKeys: String, CodingKey {
 
 
        case urls
 
        case user
    }
}

// MARK: - UserdetaliseLinks
 
 

// MARK: - User
struct User: Codable {
 
    var links: UserLinks?
    var profileImage: ProfileImage?
 

    enum CodingKeys: String, CodingKey {
 
        case links
        case profileImage = "profile_image"
 
    }
}

// MARK: - UserLinks
struct UserLinks: Codable {
    var linksSelf, html, photos, likes: String?
    var portfolio, following, followers: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html, photos, likes, portfolio, following, followers
    }
}

// MARK: - ProfileImage
struct ProfileImage: Codable {
    var small, medium, large: String?
}

 

 

 

// MARK: - Urls
struct Urls: Codable {
    var raw, full, regular, small: String?
    var thumb, smallS3: String?

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

 
typealias Userdetalis = [UserdetaliseElement]
 

 

 

 
 

 

  
 

 
