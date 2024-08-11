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
        ZStack{
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea()
            
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], content: {
                    ForEach(viewModel.photos) { photo in
                        NavigationLink(destination: PhotoDetailView(photoUrl: photo.url, photoTitle: photo.title)) {
                            AsyncImage(url: URL(string: photo.thumbnailUrl)){ image in
                                image.resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 100, maxHeight: 100)
                                    .cornerRadius(2)
                                    .shadow(radius: 5)
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
}
