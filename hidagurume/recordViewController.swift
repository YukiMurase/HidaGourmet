//
//  recordViewController.swift
//  hidagurume
//
//  Created by mc-mac22 on 2017/08/18.
//  Copyright © 2017年 ぐるめ. All rights reserved.
//

import UIKit

class recordViewController: UIViewController {
    @IBOutlet weak var ruikei: UILabel!
    @IBOutlet weak var maxmaisuu: UILabel!
    @IBOutlet weak var shougou7: UILabel!
    @IBOutlet weak var shougou6: UILabel!
    @IBOutlet weak var shougou5: UILabel!
    @IBOutlet weak var shougou4: UILabel!
    @IBOutlet weak var shougou3: UILabel!
    @IBOutlet weak var shougou2: UILabel!
    @IBOutlet weak var shougou1: UILabel!
    
    var getshougou = ["????","????","    ????","    ????","  ????","????","              ????"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if UserDefaults.standard.string(forKey: "shougou1") == nil {
            shougou1.text = "????"
        } else {
            shougou1.text = UserDefaults.standard.string(forKey: "shougou1")
        }
        if UserDefaults.standard.string(forKey: "shougou2") == nil {
            shougou2.text = "????"
        } else {
            shougou2.text = UserDefaults.standard.string(forKey: "shougou2")
        }
        if UserDefaults.standard.string(forKey: "shougou3") == nil {
            shougou3.text = "    ????"
        } else {
            shougou3.text = UserDefaults.standard.string(forKey: "shougou3")
        }
        if UserDefaults.standard.string(forKey: "shougou4") == nil {
            shougou4.text = "    ????"
        } else {
            shougou4.text = UserDefaults.standard.string(forKey: "shougou4")
        }
        if UserDefaults.standard.string(forKey: "shougou5") == nil {
            shougou5.text = "  ????"
        } else {
            shougou5.text = UserDefaults.standard.string(forKey: "shougou5")
        }
        if UserDefaults.standard.string(forKey: "shougou6") == nil {
            shougou6.text = "????"
        } else {
            shougou6.text = UserDefaults.standard.string(forKey: "shougou6")
        }
        if UserDefaults.standard.string(forKey: "shougou7") == nil {
            shougou7.text = "              ????"
        } else {
            shougou7.text = UserDefaults.standard.string(forKey: "shougou7")
        }
        
        maxmaisuu.text = "最大数：\(UserDefaults.standard.integer(forKey: "max"))皿"
        ruikei.text = "累計数：\(UserDefaults.standard.integer(forKey: "cumulative"))皿"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
