//
//  ContentView.swift
//  Testing
//
//  Created by Alex Marchant on 30/08/2022.
//

import SwiftUI

class SearchResult<T: ItemProtocol> {
    var t: T

    init(t: T) {
        self.t = t
    }
}

struct ContentView: View {
    
    @State var searchResults = [SearchResult<AnyItem>]()
    
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
                        if let folder = (result.t as? Folder)
                        {
                            Text("Children: \(folder.numberOfChildren)")
                        }
                        else if let file = (result.t as? File)
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
        
        Button("Clear Results", action: { self.searchResults = [SearchResult]() })
        
    }
    
    func getSearchResults()
    {
        self.searchResults = SearchResults.generateSearchResults()
    }
    
    func handleTap<T: ItemProtocol>(result: SearchResult<T>)
    {
        if let folder = result.t as? Folder
        {
            print("I am a folder: \(folder.numberOfChildren)")
        }
        else if let file = result.t as? File
        {
            print("I am a file: \(file.ext)")
        }
        else
        {
            print("I am something else: \(result.t.name)")
        }
        
        getItemType(result)
    }
    
    func getItemType<T: ItemProtocol>(_ result: SearchResult<T>)
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
