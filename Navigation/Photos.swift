//
//  Photos.swift
//  Navigation
//
//  Created by Vladislav Barinov on 31.03.2022.
//

import Foundation

struct Photo {

    let imageName: String

    static func getPhoto() -> [Photo] {

        var photoArray = [

            Photo(imageName: "1.jpeg"),
            Photo(imageName: "2.jpeg"),
            Photo(imageName: "3.jpeg"),
            Photo(imageName: "4.jpeg"),
            Photo(imageName: "5.jpeg"),
            Photo(imageName: "6.jpeg"),
            Photo(imageName: "7.jpeg"),
            Photo(imageName: "8.jpeg"),
            Photo(imageName: "9.jpeg"),
            Photo(imageName: "10.jpeg"),
            Photo(imageName: "11.jpeg"),
            Photo(imageName: "12.jpeg"),
            Photo(imageName: "13.jpeg"),
            Photo(imageName: "14.jpeg"),
            Photo(imageName: "15.jpeg"),
            Photo(imageName: "16.jpeg"),
            Photo(imageName: "17.jpeg"),
            Photo(imageName: "18.jpeg"),
            Photo(imageName: "19.jpeg"),
            Photo(imageName: "20.jpeg")
        ]
        return photoArray
    }
}
