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
        NavigationView{
            List(viewModel.albums){album in
                
                NavigationLink(destination: PhotoListView(albumId: album.id)) {
                    Text(album.title)
                }
    
            }
            .navigationTitle("Albums")
            .onAppear{
                viewModel.fetchAlbums()
            }
        }
    }
}

#Preview {
    AlbumListView()
}
