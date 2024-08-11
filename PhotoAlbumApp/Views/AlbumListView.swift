//
//  AlbumListView.swift
//  PhotoAlbumApp
//
//  Created by Kaustubh Kishor Gadakh on 10/08/24.
//

import SwiftUI

struct AlbumListView: View {
    @StateObject private var viewModel = AlbumViewModel()
    
    var body: some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea()
            
            NavigationView{
                List(viewModel.albums){album in
                    NavigationLink(destination: PhotoListView(albumId: album.id)) {
                        Text("\(album.id).")
                            .padding(10)
                            .font(.headline)
                        Text(album.title)
                            .font(.subheadline)
                            
                    }
        
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Albums")
                .onAppear{
                    viewModel.fetchAlbums()
                }
            }
        }
    }
}

#Preview {
    AlbumListView()
}
