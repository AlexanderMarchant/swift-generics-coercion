//
//  Protocols.swift
//  Testing
//
//  Created by Alex Marchant on 30/08/2022.
//

import Foundation

protocol ItemProtocol {
    var name: String { get }
}
protocol FolderProtocol: ItemProtocol {
    var numberOfChildren: Int { get }
}
protocol FileProtocol : ItemProtocol {
    var ext: String { get }
}

// MARK: Folder Classes

class SharedFolder: FolderProtocol
{
    // MARK: ItemProtocol Conformance
    var name: String
    
    // MARK: FolderProtocol Conformance
    var numberOfChildren: Int
    
    var shareId: UUID
    var sharedTo: [String]
    
    init(name: String, numberOfChildren: Int, shareId: UUID, sharedTo: [String])
    {
        self.name = name
        self.numberOfChildren = numberOfChildren
        self.shareId = shareId
        self.sharedTo = sharedTo
    }
}

class PrivateFolder: FolderProtocol
{
    // MARK: ItemProtocol Conformance
    var name: String
    
    // MARK: FolderProtocol Conformance
    var numberOfChildren: Int
    
    var password: String
    var isLocked: Bool
    
    init(name: String, numberOfChildren: Int, password: String, isLocked: Bool)
    {
        self.name = name
        self.numberOfChildren = numberOfChildren
        self.password = password
        self.isLocked = isLocked
    }
}


// MARK: File Classes

class TextFile: FileProtocol
{
    // MARK: ItemProtocol Conformance
    var name: String
    
    // MARK: FileProtocol Conformance
    var ext: String
    
    var text: String
    
    init(name: String, ext: String, text: String)
    {
        self.name = name
        self.ext = ext
        self.text = text
    }
}

class ImageFile: FileProtocol
{
    // MARK: ItemProtocol Conformance
    var name: String
    
    // MARK: FileProtocol Conformance
    var ext: String
    
    var imageData: Data
    
    init(name: String, ext: String, imageData: Data)
    {
        self.name = name
        self.ext = ext
        self.imageData = imageData
    }
}
