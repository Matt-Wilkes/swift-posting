//
//  postsAPI.swift
//  postApp
//
//  Created by Matt Wilkes on 30/08/2024.
//

import Foundation
import SwiftUI

struct Post: Codable, Identifiable {
    var userId: Int
    var id: Int
//    let id = UUID() only necessary if an ID isn't sent in the response
    var title: String
    var body: String
}

