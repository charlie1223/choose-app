//
//  QuizModel.swift
//  QuizApp
//
//  Created by 邱奕軒 on 2023/3/15.
//

import Foundation

protocol QuizProtocol {
    func questionsRetrieved(_ questions:[Question])
}

class QuizModel {
    var delegate: QuizProtocol?
    // 宣告 delegate 屬性（將是 ViewController）
    
    /*
     抓題目的方法。
     若要利用 background thread 從網路抓題目，不知道要花多久，所以不能用 return 的方式傳資料給 ViewController。
     所以要用 delegate 屬性，搭配自訂 Protocol 的方法傳資料給 ViewController。
     
     在此我只實現如何抓本地 JSON file。
     若要抓遠端 JSON ，只需再寫一個新方法，並在 getQuestions() 呼叫它即可。
     */
    
    func getQuestions() {
        getLocalJsonFile()
    }
    
    func getLocalJsonFile() {
        guard let path = Bundle.main.path(forResource: "QuestionData", ofType: "json") else {
            print("Cannot find json file.")
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            // 用 JSON Decoder 物件把 data decode 成 Question 陣列
            let array = try JSONDecoder().decode([Question].self, from: data)
            
            // delegate 使用 questionRetrieved() 方法得到題目、顯示題目
            delegate?.questionsRetrieved(array)
        }
        catch {
            print("無法從 url 取得 data，或解碼失敗")
        }
    }
}
