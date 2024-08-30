//
//  ContentView.swift
//  postApp
//
//  Created by Matt Wilkes on 30/08/2024.
//

import SwiftUI

//struct Response: Codable {
//    var results: [Result]
//}

struct Result: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        VStack{
            Text("Posts").font(.title)
            List(results, id: \.id) { item in
                VStack(alignment: .leading) {
                    Text(item.title).font(.headline).padding(.bottom)
                    Text(item.body)
                }
            }
            .task {
                await loadData()
            }
            
        }
                
        }
        func loadData() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("Invalid URL")
            return
        }
        do {
            //data from method tkes URL and returns a Data instance at that URL, belongs to URLSession class
            // returns a tuple, (data we want + metadata) (data, _) = (data, discard the response)
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode([Result].self, from: data) {
                results = decodedResponse
                print(decodedResponse)
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
