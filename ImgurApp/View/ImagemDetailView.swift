//
//  ImagemDetailView.swift
//  ImgurApp
//
//  Created by Lucas Parreira on 21/06/21.
//

import SwiftUI

protocol ImageDownloader{
    func downloadImageData(completion: @escaping (Data?) -> Void)
}

class DefaltImageDownloader: ImageDownloader {
    let imagePath: String
    init (imagePath: String){
        self.imagePath = imagePath
    }
    
    func downloadImageData(completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: imagePath) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                completion(data)
            }
        }
        dataTask.resume()
    }
}


struct ImagemDetailView: View {
    @State var uiImage: UIImage?
    
    let placeholderImage: Image
    let imageDownloader: ImageDownloader
    
    init(placeholderImage: Image, imageDownloader: ImageDownloader){
        self.placeholderImage = placeholderImage
        self.imageDownloader = imageDownloader
    }
    
    var body: some View {
        if let uiImage = self.uiImage {
            Image(uiImage: uiImage)
                
        } else {
            placeholderImage
                .onAppear(perform: getImage)
        }
    }
    
    private func getImage(){
        imageDownloader.downloadImageData { imageData in
            guard let imageData = imageData,
                  let uiImage = UIImage(data: imageData)
            else {
                self.uiImage = nil
                return
            }
            
            DispatchQueue.main.async {
                self.uiImage = uiImage
            }
        }
    }
}

//struct ImagemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImagemDetailView()
//    }
//}
