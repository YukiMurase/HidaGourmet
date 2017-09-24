//
//  ResultViewController.swift
//  hidagurume
//
//  Created by mc-mac22 on 2017/08/18.
//  Copyright © 2017年 ぐるめ. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var shougoulabel: UILabel!
    @IBAction func backButtonPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func retryButtonPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var resultgoukei: UILabel!
    @IBOutlet weak var resultmaisuu: UILabel!
    
    var maisuu = 0
    var cumulative = 0
    var oldValue = 0
    var max = 0                  // 今までの最高枚数

    override func viewDidLoad() {
        super.viewDidLoad()

        oldValue = UserDefaults.standard.integer(forKey: "cumulative") // これまで獲得した枚数
        cumulative = maisuu + oldValue
        resultmaisuu.text = "今回の記録：\(maisuu)皿"
        resultgoukei.text = "累計：\(cumulative)皿"
        
        if (max < maisuu){
            max = maisuu
        }
        UserDefaults.standard.set(max, forKey: "max")
        
        UserDefaults.standard.set(cumulative, forKey: "cumulative") // 累計獲得数保存
        // Do any additional setup after loading the view.
        
        if (maisuu == 0){
        UserDefaults.standard.set("絶食", forKey: "shougou1")
            shougoulabel.text = "             称号：絶食"
        }else if (maisuu <= 10){
        UserDefaults.standard.set("少食", forKey: "shougou2")
            shougoulabel.text = "             称号：少食"
        }else if (maisuu <= 20){
        UserDefaults.standard.set("一般女性", forKey: "shougou3")
            shougoulabel.text = "        称号：一般女性"
        }else if (maisuu <= 30){
        UserDefaults.standard.set("一般男性", forKey: "shougou4")
            shougoulabel.text = "        称号：一般男性"
        }else if (maisuu <= 40){
        UserDefaults.standard.set("大食い", forKey: "shougou5")
            shougoulabel.text = "          称号：大食い"
        }else if (maisuu <= 50){
        UserDefaults.standard.set("力士", forKey: "shougou6")
            shougoulabel.text = "            称号：力士"
        }else if (maisuu <= 60){
        UserDefaults.standard.set("フードファイター", forKey: "shougou7")
            shougoulabel.text = " 称号：フードファイター"
        }
        
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
