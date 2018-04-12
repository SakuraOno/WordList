//
//  QuestionViewController.swift
//  WordList
//
//  Created by 小野　櫻 on 2018/04/12.
//  Copyright © 2018年 小野　櫻. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var nextButton: UIButton!
    
    var isAnswered: Bool = false //回答したか・次の質問へ行くかの判定
    var wordArray: [Dictionary<String, String>] = [] //UserDefaultsからとる配列
    var shuffleWordArray: [Dictionary<String, String>] = [] //シャッフルされた配列
    
    var nowNumber: Int = 0 //現在の回答数
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
    }
    
    //Viewが現れた時に呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        //問題をシャッフルする
        shuffle()
        questionLabel.text = shuffleWordArray[nowNumber]["english"]
    }
    
    func shuffle() {
        while wordArray.count > 0 {
            let index = Int(arc4random_uniform(UInt32(wordArray.count)))
            shuffleWordArray.append(wordArray[index])
            wordArray.remove(at: index)
        }
    }
    
    @IBAction func nextButtonTapped (){
        //回答したか
        if isAnswered {
            //次の問題へ
            nowNumber += 1
            answerLabel.text = ""
            
            //次の問題を表示するか
            if nowNumber < shuffleWordArray.count {
                //次の問題を表示
                questionLabel.text = shuffleWordArray[nowNumber]["english"]
                //isAnsweredをfalseにする
                isAnswered = false
                //ボタンのタイトルを変更する。
                nextButton.setTitle("答えを表示", for: .normal)
            }else {
                self.performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        }else {
            //答えを表示する
            answerLabel.text = shuffleWordArray[nowNumber]["japanese"]
            //isAnsweredをtrueに
            isAnswered = true
            //ボタンのタイトルを変更
            nextButton.setTitle("次へ", for: .normal)
        }
    }
    
}

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

