//
//  Post.swift
//  Navigation
//
//  Created by Vladislav Barinov on 04.03.2022.
//

import Foundation

struct Post {
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int

    static func getData() -> [Post] {
        var postArray = [Post]()

        let firstPost = Post(author: "Bob Marley", description: "Robert Nesta Marley OM (6 February 1945 – 11 May 1981) was a Jamaican singer, songwriter, and musician. Considered one of the pioneers of reggae, his musical career was marked by fusing elements of reggae, ska, and rocksteady, as well as his distinctive vocal and songwriting style", image: "bob.jpeg", likes: 2512, views: 62346)
        let secondPost = Post(author: "Serj Tankian", description: "Serj Tankian (Armenian: Սերժ Թանգեան, [ˈsɛɾʒ tʰɑnˈkjɑn]; born August 21, 1967) is an Armenian-American singer, musician, songwriter, record producer, and political activist. He is best known as the lead vocalist, primary lyricist, keyboardist, and occasional rhythm guitarist of heavy metal band System of a Down, which was formed in 1994.", image: "serj.jpeg", likes: 412, views: 125346)
        let thirdPost = Post(author: "Chester Bennington", description: "Chester Charles Bennington (March 20, 1976 – July 20, 2017) was an American singer, songwriter, and occasional actor. He was best known as the lead vocalist of Linkin Park, but was also the lead vocalist of the bands Grey Daze, Dead by Sunrise, and Stone Temple Pilots.", image: "ches.jpeg", likes: 7812, views: 102346)
        let fourthPost = Post(author: "Victor Coy", description: "Viktor Robertovich Tsoi (Russian: Ви́ктор Ро́бертович Цой; IPA: [ˈvʲikt̪ər ˈrobʲɪrt̪əvʲɪtɕ ˈtsoi̯]; 21 June 1962 – 15 August 1990) was a Soviet and Russian singer and songwriter who co-founded Kino, one of the most popular and musically influential bands in the history of Russian/Soviet music.", image: "coy.jpeg", likes: 2512, views: 62346)

        postArray = [firstPost, secondPost, thirdPost, fourthPost]

        return postArray
    }
}
