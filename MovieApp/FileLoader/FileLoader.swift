//
//  FileLoader.swift
//  TwitterParam
//
//  Created by M_Sugawara on 2020/03/14.
//  Copyright © 2020 sugawar. All rights reserved.
//

import Foundation

public enum FileLoaderError: Error {
    case invalidPath
}

public protocol FileLoaderProtocol {
    func loadFile(for resource: String, ofType type: String) throws -> Data
    func loadJSON<T: Decodable>(fileName: String) throws -> T
    func loadPlist<T: Decodable>(fileName: String) throws -> T
}

public class FileLoader: FileLoaderProtocol {

    private let bundle: Bundle
    private lazy var jsonDecorder = JSONDecoder()
    private lazy var plistDecorder = PropertyListDecoder()

    public convenience init() {
        self.init(bundle: .main)
    }

    public init(bundle: Bundle) {
        self.bundle = bundle
    }

    public func loadFile(for resource: String, ofType type: String) throws -> Data {

        guard let path = bundle.path(forResource: resource, ofType: type) else {
            throw FileLoaderError.invalidPath
        }
        do {
            let url = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
            return data
        } catch {
            throw error
        }
    }

    public func loadJSON<T: Decodable>(fileName: String) throws -> T {
        let data = try loadFile(for: fileName, ofType: "json")
        let jsonData = try jsonDecorder.decode(T.self, from: data)
        return jsonData
    }

    public func loadPlist<T: Decodable>(fileName: String) throws -> T {
        let data = try loadFile(for: fileName, ofType: "plist")
        let jsonData = try plistDecorder.decode(T.self, from: data)
        return jsonData
    }
}
