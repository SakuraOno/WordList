//
//  ViewController.swift
//  WordList
//
//  Created by 小野　櫻 on 2018/04/12.
//  Copyright © 2018年 小野　櫻. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(sender: UIStoryboardSegue) {
        
    }
    
    @IBAction func startButtonTapped() {
        let saveData = UserDefaults.standard
        if let wordArray = saveData.array(forKey: "WORD") {
            if wordArray.count > 0{
                self.performSegue(withIdentifier: "toQuestionView", sender: nil)
            }
        }
        
        let alert = UIAlertController(
            title: "単語",
            message: "まずは「単語一覧」をタップして単語登録してください」",
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
