//
//  ContentView.swift
//  postApp
//
//  Created by Matt Wilkes on 30/08/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = PostsViewModel()
    
    var body: some View {
        VStack{
            Text("Posts").font(.title)
            List(viewModel.posts, id: \.id) { item in
                VStack(alignment: .leading, spacing: 10.0) {
                        Text(item.title)
                            .font(.headline)
                            .padding(.bottom)
                        Text(item.body)
                            
                    }
                    .padding()
            }
            .listRowSpacing(10)
            // task is preferred over onAppear going forward
            .task {
                await viewModel.loadData()
            }
        }        
        }
}

#Preview {
    ContentView()
}
