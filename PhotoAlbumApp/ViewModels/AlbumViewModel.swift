//
//  AlbumViewModel.swift
//  PhotoAlbumApp
//
//  Created by Kaustubh Kishor Gadakh on 10/08/24.
//

import Foundation

class AlbumViewModel: ObservableObject{
    @Published var albums: [Album] = []
    
    func fetchAlbums(){
        guard let url = URL(string: "http://jsonplaceholder.typicode.com/albums")else{
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url){data, _, _ in
            if let data = data{
                let albums = try? JSONDecoder().decode([Album].self, from: data)
                DispatchQueue.main.async {
                    self.albums = albums ?? []
                    
                }
                print([albums!])
            }
        }.resume()
    }
}
