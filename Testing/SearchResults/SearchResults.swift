//
//  SearchResults.swift
//  Testing
//
//  Created by Alex Marchant on 30/08/2022.
//

import Foundation

class SearchResults
{
    static func generateSearchResults<T: ItemProtocol>() -> [SearchResult<T>]
    {
        var results = [SearchResult<T>]()
        
        // MARK: Don't think this will work, believe a crash will occur due to casting to 'T'
        results.append(
            SearchResult<T>(
                t: SharedFolder(name: "Shared", numberOfChildren: 5, shareId: UUID(), sharedTo: ["Alex", "Ernesto"]) as! T
            )
        )
        
        results.append(
            SearchResult<T>(
                t: PrivateFolder(name: "Private", numberOfChildren: 5, password: "Testing", isLocked: true) as! T
            )
        )
        
        results.append(
            SearchResult<T>(
                t: TextFile(name: "Text", ext: "txt", text: "This is my text") as! T
            )
        )
        
        results.append(
            SearchResult<T>(
                t: ImageFile(name: "Image", ext: "png", imageData: Data()) as! T
            )
        )
        
        
//        results.append(contentsOf: [
//            SearchResult(t: SharedFolder(name: "Shared", numberOfChildren: 5, shareId: UUID(), sharedTo: ["Alex", "Ernesto"])),
//            SearchResult(t: PrivateFolder(name: "Private", numberOfChildren: 5, password: "Testing", isLocked: true)),
//            SearchResult(t: TextFile(name: "Text", ext: "txt", text: "This is my text")),
//            SearchResult(t: ImageFile(name: "Image", ext: "png", imageData: Data()))
//        ])
        
        return results
    }
}
