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
        self.view
            .zz_backgroundColor(.red)
            .zz_alpha(0.5)
        
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
        
        
        ZZFile.createFolder(directory: <#T##ZZFile.Directory#>, folderName: <#T##String#>)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

