//
//  HomeViewController.swift
//  kadai_kanjiToHiragana_app
//
//  Created by 渡辺崇博 on 2020/02/28.
//  Copyright © 2020 渡辺崇博. All rights reserved.
//

import UIKit
import Loaf

class HomeViewController: UIViewController {
    
    @IBOutlet weak var convertTextField: UITextField!
    
    private var convertedText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        convertTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let nextVC = segue.destination as! ConvertedTextViewController
        nextVC.convertedText = convertedText
    }
    
    
    @IBAction func convertButton(_ sender: Any) {
        
        validateText()
        
        convertText(convertTextForApi: convertTextField.text!)
    }
}

private extension HomeViewController {
    
    func convertText(convertTextForApi: String) {
        
        var request = URLRequest(url: URL(string: "https://labs.goo.ne.jp/api/hiragana")!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let postData = PostData(app_id: "07d209288aeb89a804a0ffc2f46a8ba6a66d9cf70a5e4c7e7deaedf7ee906703", request_id: "record003", sentence: convertTextForApi, output_type: "hiragana")
        guard let uploadData = try? JSONEncoder().encode(postData) else {
            print("json生成に失敗しました")
            return
        }
        
        request.httpBody = uploadData
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { (data, response, error) in
            
            if let error = error {
                print ("error: \(error)")
                return
            }
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                    print ("server error")
                    return
            }
            
            guard let data = data, let jsonData = try? JSONDecoder().decode(Rubi.self, from: data) else {
                print("json変換に失敗しました")
                return
            }
            
            DispatchQueue.main.async {
                self.convertedText = jsonData.converted
                self.performSegue(withIdentifier: "segue", sender: nil)
                
            }
        }
        
        task.resume()
    }
    
    func validateText(){
        
        //空文字を削除
        convertTextField.text? = trimEmpty(string: self.convertTextField.text!)
        
        //入力されていなかったら、エラーアラート表示。
        if convertTextField.text?.isEmpty == true {
            
            showLoaf()
        }
    }
    
    func trimEmpty(string: String) -> String{
        
        return string.trimmingCharacters(in: .whitespaces)
    }
    
    func showLoaf(){
        let message = "文章を入力して下さい！"
        Loaf(message, state: .error, location: .top, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
    }
}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

