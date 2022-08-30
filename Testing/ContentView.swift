//
//  ContentView.swift
//  Testing
//
//  Created by Alex Marchant on 30/08/2022.
//

import SwiftUI

class SearchResult<T> {
    var t: T

    init(t: T) {
        self.t = t
    }
}

struct AnySearchResult {
    private let _t: () -> ItemProtocol

    var t: ItemProtocol { return _t() }

    init<T: ItemProtocol>(_ base: SearchResult<T>) {
        _t = { base.t }
    }
}

struct ContentView: View {
    
    @State var searchResults = [AnySearchResult]()
    
    var body: some View {
        
        Button("Get Search Results", action: { getSearchResults() })
        
        ScrollView
        {
            VStack(spacing: 25)
            {
                ForEach(searchResults, id: \.t.name) { result in
                    VStack(spacing: 5)
                    {
                        Text(result.t.name)
                        if let folder = (result.t as? FolderProtocol)
                        {
                            Text("Children: \(folder.numberOfChildren)")
                        }
                        else if let file = (result.t as? FileProtocol)
                        {
                            Text("Extension: \(file.ext)")
                        }
                    }
                    .onTapGesture {
                        self.handleTap(result: result)
                    }
                }
            }
        }
        
        Button("Clear Results", action: { self.searchResults = [AnySearchResult]() })
        
    }
    
    func getSearchResults()
    {
        self.searchResults = SearchResults.generateSearchResults()
    }
    
    func handleTap(result: AnySearchResult)
    {
        if let folder = result.t as? FolderProtocol
        {
            print("I am a folder: \(folder.numberOfChildren)")
        }
        else if let file = result.t as? FileProtocol
        {
            print("I am a file: \(file.ext)")
        }
        else
        {
            print("I am something else: \(result.t.name)")
        }
        
        getItemType(result)
    }
    
    func getItemType(_ result: AnySearchResult)
    {
        if let sharedFolder = result.t as? SharedFolder
        {
            print("SharedFolder: \(sharedFolder.sharedTo)")
        }
        else if let privateFolder = result.t as? PrivateFolder
        {
            print("PrivateFolder: \(privateFolder.password)")
        }
        else if let textFile = result.t as? TextFile
        {
            print("TextFile: \(textFile.text)")
        }
        else if let imageFile = result.t as? ImageFile
        {
            print("ImageFile: \(imageFile.imageData.count)")
        }
        else
        {
            print("I am something else")
        }
    }
    
}
