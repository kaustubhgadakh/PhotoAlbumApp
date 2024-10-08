//
//  Album.swift
//  PhotoAlbumApp
//
//  Created by Kaustubh Kishor Gadakh on 10/08/24.
//

import Foundation

struct Album: Codable, Identifiable{
    let userId: Int
    let id: Int
    let title: String
}
