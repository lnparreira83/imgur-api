//
//  ContentView.swift
//  ImgurApp
//
//  Created by Lucas Parreira on 19/06/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var vm = FeedViewModel()
    let column = [
        GridItem(spacing:0)
    ]
   
    var body: some View {
                    ScrollView{
                        LazyVGrid(columns:column){
                            ForEach(vm.posts, id: \.id){ post in
                                    WebImage(url: URL(string: post.link))
                                        .resizable()
                                        
                        }
                            .padding(.leading, 5)
                            .padding(.trailing,5)
                    }
                        
                }
                
            }
               
        }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
