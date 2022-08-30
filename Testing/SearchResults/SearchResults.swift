//
//  SearchResults.swift
//  Testing
//
//  Created by Alex Marchant on 30/08/2022.
//

import Foundation

class SearchResults
{
    static func generateSearchResults() -> [AnySearchResult]
    {
        var results = [AnySearchResult]()
        
        results.append(
            AnySearchResult(
                SearchResult(
                    t: SharedFolder(name: "Shared", numberOfChildren: 5, shareId: UUID(), sharedTo: ["Alex", "Ernesto"])
                )
            )
        )
        
        results.append(
            AnySearchResult(
                SearchResult(
                    t: PrivateFolder(name: "Private", numberOfChildren: 5, password: "Testing", isLocked: true)
                )
            )
        )
        
        results.append(
            AnySearchResult(
                SearchResult(
                    t: TextFile(name: "Text", ext: "txt", text: "This is my text")
                )
            )
        )
        
        results.append(
            AnySearchResult(
                SearchResult(
                    t: ImageFile(name: "Image", ext: "png", imageData: Data())
                )
            )
        )
        
        return results
    }
}
