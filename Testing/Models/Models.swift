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

class Folder: ItemProtocol {
    
    var name: String
    
    var numberOfChildren: Int
    
    init(name: String, numberOfChildren: Int)
    {
        self.name = name
        self.numberOfChildren = numberOfChildren
    }
    
}
class File: ItemProtocol {
    
    // MARK: ItemProtocol Conformance
    var name: String
    
    // MARK: FileProtocol Conformance
    var ext: String
    
    init(name: String, ext: String)
    {
        self.name = name
        self.ext = ext
    }
}

// MARK: Folder Classes

class SharedFolder: Folder
{
    var shareId: UUID
    var sharedTo: [String]
    
    init(name: String, numberOfChildren: Int, shareId: UUID, sharedTo: [String])
    {
        self.shareId = shareId
        self.sharedTo = sharedTo
        super.init(name: name, numberOfChildren: numberOfChildren)
    }
}

class PrivateFolder: Folder
{
    var password: String
    var isLocked: Bool
    
    init(name: String, numberOfChildren: Int, password: String, isLocked: Bool)
    {
        self.password = password
        self.isLocked = isLocked
        super.init(name: name, numberOfChildren: numberOfChildren)
    }
}


// MARK: File Classes

class TextFile: File
{
    var text: String
    
    init(name: String, ext: String, text: String)
    {
        self.text = text
        super.init(name: name, ext: ext)
    }
}

class ImageFile: File
{
    var imageData: Data
    
    init(name: String, ext: String, imageData: Data)
    {
        self.imageData = imageData
        super.init(name: name, ext: ext)
    }
}
