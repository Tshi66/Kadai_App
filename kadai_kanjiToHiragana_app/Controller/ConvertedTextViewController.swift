//
//  ConvertedTextViewController.swift
//  kadai_kanjiToHiragana_app
//
//  Created by 渡辺崇博 on 2020/02/28.
//  Copyright © 2020 渡辺崇博. All rights reserved.
//

import UIKit
import Loaf

class ConvertedTextViewController: UIViewController {
    
    @IBOutlet weak var convertedTextLabel: UILabel!
    
    var convertedText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        convertedTextLabel.text = convertedText
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        showLoaf()
    }
    
    @IBAction func againButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }

}

private extension ConvertedTextViewController {
    
    func showLoaf(){
        let message = "文章の変換に成功しました！"
        Loaf(message, state: .success, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
    }
}
