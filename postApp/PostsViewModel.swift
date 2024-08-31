//
//  PostsViewModel.swift
//  postApp
//
//  Created by Matt Wilkes on 31/08/2024.
//

import Foundation
import SwiftUI

class PostsViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    
    func loadData() async {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
        print("Invalid URL")
        return
    }
    do {
        //data from method tkes URL and returns a Data instance at that URL, belongs to URLSession class
        // returns a tuple, (data we want + metadata) (data, _) = (data, discard the response)
        let (data, _) = try await URLSession.shared.data(from: url)
        if let decodedResponse = try? JSONDecoder().decode([Post].self, from: data) {
            posts = decodedResponse
            print(decodedResponse)
        }
    } catch {
        print("Invalid data")
    }
}
    
}

