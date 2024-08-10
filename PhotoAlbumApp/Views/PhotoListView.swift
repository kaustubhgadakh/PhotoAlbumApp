//
//  PhotoListView.swift
//  PhotoAlbumApp
//
//  Created by Kaustubh Kishor Gadakh on 10/08/24.
//

import SwiftUI

struct PhotoListView: View {
    let albumId: Int
    @StateObject private var viewModel = PhotoViewModel()
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], content: {
                ForEach(viewModel.photos) { photo in
                    NavigationLink(destination: PhotoDetailView(photoUrl: photo.url)) {
                        AsyncImage(url: URL(string: photo.thumbnailUrl)){ image in
                            image.resizable()
                                .scaledToFit()
                                .frame(maxWidth: 100, maxHeight: 100)
                        
                        }placeholder:{
                            ProgressView()
                        }
                    }
                }
                .padding()
            })
            .navigationTitle("Photos")
            .onAppear{
                viewModel.fetchPhotos(for: albumId)
            }
        }
    }
}
