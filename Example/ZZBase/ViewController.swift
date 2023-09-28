//
//  ViewController.swift
//  ZZBase
//
//  Created by czz_8023 on 02/07/2023.
//  Copyright (c) 2023 czz_8023. All rights reserved.
//

import UIKit
import ZZBase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.view
//            .zz_backgroundColor(.red)
//            .zz_alpha(0.5)
        
        ZZLog(zz_file_bundle("testImgage", type: "png"))
        ZZLog(zz_file_documents("123.png"))
        
        ZZLog(ZZFile.path(for: .documents))
        ZZLog(ZZFile.path(for: .library))
        ZZLog(ZZFile.path(for: .caches))
        ZZLog(ZZFile.path(for: .temp))
        ZZLog(ZZFile.path(for: .bundle))
        
        
        ZZLog(ZZFile.filePath(for: .documents, filename: "123.png"))
        ZZLog(ZZFile.filePath(for: .library, filename: "123.png"))
        ZZLog(ZZFile.filePath(for: .caches, filename: "123.png"))
        ZZLog(ZZFile.filePath(for: .temp, filename: "123.png"))
        ZZLog(ZZFile.filePath(for: .bundle, filename: "testImgage.png"))


//        ZZFile.create(directory: .bundle, folderName: "fjdlsa")

        var file1 = ZZFile.filePath(for: .documents, intermediates: "/PDF", filename: "1234.pdf")

        var isDir: ObjCBool = false
        var file2 = ZZFile.filePath(for: .documents, intermediates: "/PDF2", filename: "")

//        let file1Create = ZZFile.createDirectory(to: file1)
//        let file2Create = ZZFile.createDirectory(to: file2, isDirectory: &isDir)
//
//        ZZLog("file1Create \(file1Create)   file2Create \(file2Create)   \(isDir.boolValue)")


        let textData = "hello world aaaaaaa111dd 66".data(using: .utf8)

        let createFile1 = "\(file1)/12345.txt"

        let file1Create1 = ZZFile.createFile(to: createFile1, contents: textData)
        ZZLog("file1Create1  \(file1Create1)")

        let createFile2 = "\(file1)/123456.txt"
        let file1Create2 = ZZFile.createFile(to: createFile2, contents: textData, isUpdataData: false)
        ZZLog("file1Create1  \(file1Create2)")



        var inset = UIEdgeInsets()
        inset.zz_left = 10
        inset.zz_left(10)
        inset.zz_right(20)
        ZZLog("inset is \(inset)")



        let button = UIButton().zz_backgroundColor(.yellow)
        button.zz_hitEdgeInset(.zz_all(10))
        button.frame = .zz_only(x:10, y: 100, width: 100, height: 100)
        view.addSubview(button)

//        button.zz_dottedBorder(corners: .allCorners, radii: 10, color: .black, lineDashPattern: [5, 2])

//        button.zz_addGradient(form: .orange, to: .blue)
//
//        button.zz_addGradient(form: .systemPink, to: .systemTeal)

        button.zz_shadow(color: .blue, radius: 10, bgColor: .white).zz_backgroundColor(.clear)

        button.zz_addBlock(for: .touchUpInside) { sender in
            if button.zz_width < 300 {
                button.zz_width += 10
            }else {
                button.zz_width -= 10
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

