//
//  PhotoDetailView.swift
//  PhotoAlbumApp
//
//  Created by Kaustubh Kishor Gadakh on 10/08/24.
//

import SwiftUI

struct PhotoDetailView: View {
    let photoUrl: String
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: photoUrl)){ image in
                image.resizable()
                    .scaledToFit()
            }placeholder: {
                ProgressView()
            }
        }
        .padding()
        .navigationTitle("Photo Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}
