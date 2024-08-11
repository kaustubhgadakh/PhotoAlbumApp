//
//  PhotoViewModel.swift
//  PhotoAlbumApp
//
//  Created by Kaustubh Kishor Gadakh on 10/08/24.
//

import Foundation

class PhotoViewModel: ObservableObject{
    @Published var photos: [Photo] = []
    
    func fetchPhotos(for albumId: Int){
        guard let url = URL(string: "http://jsonplaceholder.typicode.com/albums/\(albumId)/photos")else{
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url){data, _, _ in
            if let data = data{
                let photos = try? JSONDecoder().decode([Photo].self, from: data)
                DispatchQueue.main.async {
                    self.photos = photos ?? []
                }
                print([photos!])
            }
        }.resume()
    }
}
