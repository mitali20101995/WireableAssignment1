//
//  DefinitionViewController.swift
//  FIFA2019
//
//  Created by Siddharth Trivedi on 2019-07-04.
//  Copyright © 2019 Mitali Ahir. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController, {
    @IBOutlet weak var lblDefinition: UILabel!
    var colour = "red"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblDefinition.text = colour
    }
    

    
}