//
//  ConvertedTextViewController.swift
//  kadai_kanjiToHiragana_app
//
//  Created by 渡辺崇博 on 2020/02/28.
//  Copyright © 2020 渡辺崇博. All rights reserved.
//

import UIKit

class ConvertedTextViewController: UIViewController {
    
    @IBOutlet weak var convertedTextLabel: UILabel!
    
    var convertedText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        convertedTextLabel.text = convertedText
    }
    
    @IBAction func againButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}

