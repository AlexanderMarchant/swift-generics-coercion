//
//  Protocols.swift
//  Testing
//
//  Created by Alex Marchant on 30/08/2022.
//

import Foundation

protocol ItemProtocol: Identifiable {
    var name: String { get }
}

class AnyItem: ItemProtocol
{
    // MARK: ItemProtocol Conformance
    var name: String
    
    init(name: String)
    {
        self.name = name
    }
}

class Folder: AnyItem {
    
    var numberOfChildren: Int
    
    init(name: String, numberOfChildren: Int)
    {
        self.numberOfChildren = numberOfChildren
        super.init(name: name)
    }
    
}

class File: AnyItem {
    
    var ext: String
    
    init(name: String, ext: String)
    {
        self.ext = ext
        super.init(name: name)
    }
}

@objc extension NSDictionary
{
    func stringForKey(_ key: String) -> String?
    {
        self[key] as? String
    }
}
extension NSDictionary: ItemProtocol
{
    var name: String {
        self.stringForKey("NAME")!
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
