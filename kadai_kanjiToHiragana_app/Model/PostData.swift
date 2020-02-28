//
//  PostData.swift
//  kadai_kanjiToHiragana_app
//
//  Created by 渡辺崇博 on 2020/02/28.
//  Copyright © 2020 渡辺崇博. All rights reserved.
//

import Foundation

struct PostData: Codable {
    var app_id:String
    var request_id: String
    var sentence: String
    var output_type: String
}
