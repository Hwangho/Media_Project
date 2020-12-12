//
//  HomeInfo.swift
//  Media_Project
//
//  Created by 송황호 on 2020/12/11.
//

import Foundation

struct HomeInfo {
    let image: String
    let organize: String
    let name: String
    let date: String
    
    init(image: String, organize: String, name: String, date: String) {
        self.image = image
        self.organize = organize
        self.name = name
        self.date = date
    }
}
