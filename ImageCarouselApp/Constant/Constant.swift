//
//  Constant.swift
//  ImageCarouselApp
//

import Foundation

struct CarouselImage {
    var imageName: String?
}

struct ProfileName {
    var name: String?
}

func getCarouselImages() -> [CarouselImage] {
    return [CarouselImage(imageName: "image 1"),
            CarouselImage(imageName: "image 2"),
            CarouselImage(imageName: "image 3"),
            CarouselImage(imageName: "image 4"),
            CarouselImage(imageName: "image 5"),
            CarouselImage(imageName: "image 6"),
            CarouselImage(imageName: "image 7"),
            CarouselImage(imageName: "image 8"),
            CarouselImage(imageName: "image 9"),
            CarouselImage(imageName: "image 10"),
            CarouselImage(imageName: "image 11"),
            CarouselImage(imageName: "image 12")]
}

func getProfileNames() -> [ProfileName] {
    return [ProfileName(name: "Harry Brooks"),
            ProfileName(name: "Ross Rachel"),
            ProfileName(name: "Bruce Edwards"),
            ProfileName(name: "Cook Christopher"),
            ProfileName(name: "Carolyn Perez"),
            ProfileName(name: "Morgan Thomas"),
            ProfileName(name: "Albert Baker"),
            ProfileName(name: "Walker Sara"),
            ProfileName(name: "Randy Moore"),
            ProfileName(name: "Reed Chris"),
            ProfileName(name: "Larry Bailey"),
            ProfileName(name: "Barnes Roger"),
            ProfileName(name: "Lois Johnson"),
            ProfileName(name: "Wilson Marilyn"),
            ProfileName(name: "Jesse Thompson"),
            ProfileName(name: "Campbell Anthony"),
            ProfileName(name: "Ernest Evans"),
            ProfileName(name: "Rogers Julie Hall"),
            ProfileName(name: "Theresa Paula"),
            ProfileName(name: "Patterson Phillips"),
            ProfileName(name: "Theresa Annie"),
            ProfileName(name: "Patterson Hernandez"),
            ProfileName(name: "Henry Dorothy"),
            ProfileName(name: "Simmons Murphy"),
            ProfileName(name: "Michelle Alice"),
            ProfileName(name: "Perry Howard"),
            ProfileName(name: "Frank Torres"),
            ProfileName(name: "Butler Jacqueline"),
            ProfileName(name: "Shirley Joseph"),
            ProfileName(name: "Jack Jacqueline")]
}
