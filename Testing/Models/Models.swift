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
protocol FolderProtocol: ItemProtocol {
    var numberOfChildren: Int { get }
}
protocol FileProtocol: ItemProtocol {
    var ext: String { get }
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

class Folder: AnyItem, FolderProtocol {
    
    var numberOfChildren: Int
    
    convenience init<T: FolderProtocol>(_ base: T)
    {
        self.init(name: base.name, numberOfChildren: base.numberOfChildren)
    }
    
    init(name: String, numberOfChildren: Int)
    {
        self.numberOfChildren = numberOfChildren
        super.init(name: name)
    }
    
}

class File: AnyItem, FileProtocol {
    
    var ext: String
    
    convenience init<T: FileProtocol>(_ base: T)
    {
        self.init(name: base.name, ext: base.ext)
    }
    
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
extension NSDictionary: FolderProtocol
{
    var numberOfChildren: Int {
        Int(self.stringForKey("NUMBER_OF_CHILDREN")!)!
    }
}
extension NSDictionary: FileProtocol
{
    var ext: String {
        self.stringForKey("EXT")!
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
