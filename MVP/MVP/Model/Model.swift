//
//  Model.swift
//  MVP
//
//  Created by Huong Nguyen on 21/05/2021.
//

import Foundation

struct Flick: Codable {
    var photos: Photo?
}

struct Photo: Codable {
    var photo: [PhotoAttribute]
}

struct PhotoAttribute: Codable {
    var id: String?
    var owner: String?
    var secret: String?
    var server: String?
    var farm: Int?
    var title: String?
    var ispublic: Int?
    var isfriend: Int?
    var isfamily: Int?
    var views: String?
    var date_faved: String?
    var url_c: String?
    var height_c: Int?
    var width_c: Int?
}

struct PhotoParam: Codable {
    var method: String?
    var api_key: String?
    var user_id: String?
    var extras: String?
    var per_page: Int?
    var page: Int?
    var format: String?
    var nojsoncallback: Int?
}
