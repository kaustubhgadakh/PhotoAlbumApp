//
//  PhotoDetailView.swift
//  PhotoAlbumApp
//
//  Created by Kaustubh Kishor Gadakh on 10/08/24.
//

import SwiftUI

struct PhotoDetailView: View {
    let photoUrl: String
    let photoTitle: String
    
    var body: some View {
        ZStack{
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea()
            
            VStack{
                AsyncImage(url: URL(string: photoUrl)){ image in
                    image.resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .shadow(radius: 10)
                    
                    Text(photoTitle)
                        .font(.headline)
                        .padding()
                        .multilineTextAlignment(.center)
                        
                }placeholder: {
                    ProgressView()
                }
            }
            .padding()
            .navigationTitle("Photo Detail")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
