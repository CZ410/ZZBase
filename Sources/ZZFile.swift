//
//  ZZFile.swift
//  ZZBase
//
//  Created by Czz on 2023/6/26.
//

import Foundation

public struct ZZFile {
    public struct Directory: Equatable {
        public var rawValue: String

        public init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        public static let documents = Directory(rawValue: "/Documents")
        public static let library = Directory(rawValue: "/Library")
        public static let caches = Directory(rawValue: "/Library/Caches")
        public static let temp = Directory(rawValue: "/tmp")
        public static let bundle = Directory(rawValue: "/bundle")
    }
    
    /// 获取文件夹路径
    /// - Parameter directory: 文件夹类型(当bundle时 为空)
    /// - Returns: 文件夹路径
    @discardableResult
    public static func path(for directory: Directory, intermediates: String = "") -> String{
        return filePath(for: directory, intermediates: intermediates, filename: "")
    }
    
    /// 获取文件路径
    /// - Parameters:
    ///   - directory: 文件夹类型
    ///   - intermediates: 中间路径
    ///   - filename: 文件名（带后缀；如：xxx.png）
    /// - Returns: 文件路径
    @discardableResult
    public static func filePath(for directory: Directory, intermediates: String = "", filename: String) -> String{
        if directory == .bundle {
            return Bundle.main.path(forResource: filename, ofType: nil) ?? ""
        }
        var dir = NSHomeDirectory().appending(directory.rawValue).appending(intermediates)
        if dir.zz_last != "/"{ dir.append("/") }
        dir.append(filename)
        return dir
    }
}


/// MARK: - 文件操作
public extension ZZFile{

    /// 创建文件夹。 如果文件路径已经存在，就不在创建 直接返回True
    /// - Parameters:
    ///   - directory: 文件夹主路径
    ///   - folderName: 文件夹名
    ///   - intermediates: 是否创建中间目录
    ///   - attributes: 属性
    ///   - isDirectory: 判断路径是否为目录 ObjCBool
    /// - Returns: 是否创建成功
    static func create(directory: Directory, folderName: String, intermediates: Bool = true, attributes: [FileAttributeKey: Any]? = nil, isDirectory: UnsafeMutablePointer<ObjCBool>? = nil) -> Bool {
        let filePath = path(for: directory).appending("/\(folderName)")
        return createDirectory(to: filePath, intermediates: intermediates, attributes: attributes, isDirectory: isDirectory)
    }
    
    /// 创建文件夹。 如果文件路径已经存在，就不在创建 直接返回True
    /// - Parameters:
    ///   - filePath: 文件夹路径
    ///   - intermediates: 是否创建中间目录
    ///   - attributes: 属性
    ///   - isDirectory: 判断路径是否为目录 ObjCBool
    /// - Returns: 是否创建成功
    static func createDirectory(to filePath: String, intermediates: Bool = true, attributes: [FileAttributeKey: Any]? = nil, isDirectory: UnsafeMutablePointer<ObjCBool>? = nil) -> Bool{
        let isExists = self.exists(path: filePath, isDirectory: isDirectory)
        /// 如果文件路径已经存在，就不在创建 直接返回
        if isExists { return true }
        let  fileManager = FileManager.default
        do {
            try fileManager.createDirectory(atPath: filePath, withIntermediateDirectories: intermediates, attributes: attributes)
            return true
        } catch {
            return false
        }
    }
    
    /// 创建一个文件，并自动创建文件夹路径。
    /// - 如果文件存在则更新，若文件不存在进行创建并写入。
    /// - Parameters:
    ///   - filePath: 文件路径
    ///   - contents: 文件内容
    ///   - isUpdataData:  是否更新文件内容，默认：true（如果文件存在则更新，若文件不存在进行创建并写入，更新文件内容失败返回False）
    ///   - attributes: 文件属性
    /// - Returns: 是否创建成功
    static func createFile(to filePath: String, contents: Data? = nil, isUpdataData: Bool = true, attributes: [FileAttributeKey: Any]? = nil) -> Bool{
        let isExists = self.exists(path: filePath)
        /// 如果文件路径已经存在，就不在创建 直接返回
        if isExists {
            if let data = contents, isUpdataData {
               return write(to: filePath, content: data)
            }
            return true
        }
        guard let fileName = filePath.components(separatedBy: "/").last else {
            return false
        }
        let directory = filePath.replacingOccurrences(of: fileName, with: "")
        guard createDirectory(to: directory) else {
            return false
        }
        let fileManager = FileManager.default
        return fileManager.createFile(atPath: filePath, contents: contents, attributes: attributes)
    }

    /// 写入文件
    /// - Parameters:
    ///   - filePath: 文件路径
    ///   - content: 内容
    ///   - options: 默认先创建一个临时文件，直到文件内容写入成功再导入到目标文件里。 如果为NO，则直接写入目标文件里。
    /// - Returns: 是否成功
    static func write(to filePath: String, content: Data, options: Data.WritingOptions = []) -> Bool {
        let url = URL(fileURLWithPath: filePath)
        do {
            try content.write(to: url, options: options)
            return true
        } catch {
            return false
        }
    }

    /// 读取文件内容
    /// - Parameter filePath: 文件路径
    /// - Returns: 内容 Data
    static func read(_ filePath: String) -> Data? {
        let fileContents = FileManager.default.contents(atPath: filePath)
        if fileContents?.isEmpty == false {
            return fileContents
        } else {
            return nil
        }
    }

    /// 删除文件
    /// - Parameter filePath: 文件路径
    /// - Returns: 是否删除成功
    static func delete(_ filePath: String) -> Bool {
        do {
            try FileManager.default.removeItem(atPath: filePath)
            return true
        } catch {
            return false
        }
    }

    /// 重命名文件
    /// - Parameters:
    ///   - fromPath: 文件原始路径
    ///   - toPath: 文件新路径
    /// - Returns: 是否重命名文件成功
    static func rename(from fromPath: String, to toPath: String) -> Bool {
        return move(from: fromPath, to: toPath)
    }

    /// 移动文件
    /// - Parameters:
    ///   - fromPath: 文件原始路径
    ///   - toPath: 文件新路径
    /// - Returns: 是否移动文件成功
    static func move(from fromPath: String, to toPath: String) -> Bool {
        do {
            try FileManager.default.moveItem(atPath: fromPath, toPath: toPath)
            return true
        } catch {
            return false
        }
    }

    /// 拷贝文件
    /// - Parameters:
    ///   - fromPath: 文件原始路径
    ///   - toPath: 文件新路径
    /// - Returns: 是否拷贝文件成功
    static func copy(from fromPath: String, to toPath: String) -> Bool {
        do {
            try FileManager.default.copyItem(atPath: fromPath, toPath: toPath)
            return true
        } catch {
            return false
        }
    }

    /// 文件是否可写
    /// - Parameter path: 文件路径
    /// - Returns: 是否可写
    static func isWritable(at path: String) -> Bool {
        return FileManager.default.isWritableFile(atPath: path)
    }

    /// 文件是否可读
    /// - Parameter path: 文件路径
    /// - Returns: 是否可读
    static func isReadable(at path: String) -> Bool {
        return FileManager.default.isReadableFile(atPath: path)
    }

    /// 文件/文件夹 是否存在
    /// - Parameter path: 文件路径
    /// - Parameter isDirectory: 该是为nil时候调用FileManager.default.fileExists(atPath: path)，否则调用FileManager.default.fileExists(atPath: path, isDirectory: isDirectory)
    /// - Returns: 是否存在
    static func exists(path: String, isDirectory: UnsafeMutablePointer<ObjCBool>? = nil) -> Bool {
        return isDirectory == nil ? FileManager.default.fileExists(atPath: path) : FileManager.default.fileExists(atPath: path, isDirectory: isDirectory)
    }
    
    /// 文件是否存在
    /// - Parameter url: 文件路径
    /// - Parameter isDirectory: 该是为nil时候调用FileManager.default.fileExists(atPath: path)，否则调用FileManager.default.fileExists(atPath: path, isDirectory: isDirectory)
    /// - Returns: 是否存在
    static func exists(url: URL, isDirectory: UnsafeMutablePointer<ObjCBool>? = nil) -> Bool{
        var path: String = ""
        if #available(iOS 16.0, *) {
            path = url.path()
        } else {
            path = url.path
        }
        return exists(path: path, isDirectory: isDirectory)
    }
    
    /// 获取文件列表
    /// - Parameter folderPath: 文件夹路径
    /// - Returns: 文件列表
    static func filePathList(folderPath: String) -> [String] {
        let fileManager = FileManager.default
        let fileList = try? fileManager.contentsOfDirectory(atPath: folderPath)
        return fileList ?? []
    }
}
