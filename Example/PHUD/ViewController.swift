//
//  ViewController.swift
//  PHUD
//
//  Created by tangshimi on 05/24/2021.
//  Copyright (c) 2021 tangshimi. All rights reserved.
//

import UIKit
import PHUD
import PKHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        PHUD.show(.labeledSuccess(title: "成功了"))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

