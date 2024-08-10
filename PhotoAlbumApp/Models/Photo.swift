//
//  Photo.swift
//  PhotoAlbumApp
//
//  Created by Kaustubh Kishor Gadakh on 10/08/24.
//

import Foundation

struct Photo: Codable, Identifiable{
    let id: Int
    let albumId: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
