//
//  URL+ZZ.swift
//  Pods
//
//  Created by 陈钟 on 2026/2/3.
//

import AVFoundation
import Foundation

public extension URL{
    func zz_path(percentEncoded: Bool = true) -> String{
        var path: String = ""
        if #available(iOS 16.0, *) {
            path = self.path(percentEncoded: percentEncoded)
        } else {
            path = self.path
        }
        return path
    }

    @available(iOS 14.0, *)
    var zz_utType: UTType?{
        let ext = self.pathExtension
        guard !ext.isEmpty else { return nil }
        return UTType(filenameExtension: ext)
    }

    /// 获取文件大小
    func zz_fileSize() -> (isFile: Bool, fileSize: Int64?) {
        guard self.isFileURL else {
            return (false, nil)
        }

        do {
            let values = try self.resourceValues(forKeys: [
                .isRegularFileKey,
                .fileSizeKey
            ])

            let isFile = values.isRegularFile ?? false
            let fileSize = values.fileSize.map { Int64($0) }

            return (isFile, fileSize)
        } catch {
            return (false, nil)
        }
    }
}
