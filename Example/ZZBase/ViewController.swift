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
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

