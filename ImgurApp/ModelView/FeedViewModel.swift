//
//  FeedModelView.swift
//  ImgurApp
//
//  Created by Lucas Parreira on 20/06/21.
//

import Foundation
import Combine

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    let publisher = GenericPublisher()
    var cancellable: Cancellable?

    init() {
        fetchData()
    }
    
    func fetchData(section: GallerySection = .hot) {
        posts = []
        let endpoint = GalleryEndpoint.list(category: section, sort: .viral, window: .month, page: 12)
        guard let published: AnyPublisher<Gallery, Error> = try? publisher.publish(endpoint: endpoint) else {
            return
        }
        
        cancellable = published
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: print("finished")
                case .failure(let error): print("error \(error)")
                }
            } receiveValue: { gallery in
                self.posts = gallery.data
            }
    }
}
