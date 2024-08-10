//
//  AlbumViewModel.swift
//  PhotoAlbumApp
//
//  Created by Kaustubh Kishor Gadakh on 10/08/24.
//

import Foundation

class AlbumViewModel: ObservableObject{
    @Published var albums: [Album] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let fetchData = FetchData()
    
    func fetchAlubums(){
        isLoading = true
        errorMessage = nil
        fetchData.fetchAlbums{[weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let albums):
                self?.albums = albums
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    }
}
