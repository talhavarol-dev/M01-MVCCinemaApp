//
//  MoviesModel.swift
//  M01Project
//
//  Created by Muhammet  on 16.05.2022.
//

import Foundation

struct DataModel: Codable {
    
    let results: [Result]
}

// MARK: - Result

struct Result: Codable {
    let id: Int
    let title: String
    let overview: String
    let poster_path: String
   
    //    let release_date: String

}
