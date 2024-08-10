//
//  FetchData.swift
//  PhotoAlbumApp
//
//  Created by Kaustubh Kishor Gadakh on 10/08/24.
//

import Foundation

class FetchData{
    
    func fetchAlbums(completion: @escaping(Result<[Album], Error>)-> Void){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums")else{ return }
        
        URLSession.shared.dataTask(with: url){data, _, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            do{
                let albums = try JSONDecoder().decode([Album].self, from: data!)
                DispatchQueue.main.async {
                    completion(.success(albums))
                }
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
    
    func fetchPhotos(for albumId: Int, completion: @escaping(Result<[Photo], Error>)-> Void){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/albums/\(albumId)/photos")else{ return }
        
        URLSession.shared.dataTask(with: url){data, _, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            do{
                let photos = try JSONDecoder().decode([Photo].self, from: data!)
                DispatchQueue.main.async {
                    completion(.success(photos))
                }
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
    
}
