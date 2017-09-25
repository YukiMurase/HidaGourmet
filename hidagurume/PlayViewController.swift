//
//  PlayViewController.swift
//  hidagurume
//
//  Created by mc-mac22 on 2017/08/18.
//  Copyright © 2017年 ぐるめ. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController ,UIGestureRecognizerDelegate{
    @IBOutlet weak var setumeiLabel2: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var foodTapView: UIView!
    @IBOutlet weak var moveimage1: UIImageView!
    @IBOutlet weak var dishcount: UILabel!
    @IBOutlet weak var countDownLabel: UILabel!
    
    let hinmei = ["飛騨牛ステーキ","牛肉カレー","だんご","五平餅","牛串","あゆ","牛まん","朴葉巻き","コロッケ","牛玉焼き","バーガー","すし","ソーセージ","豆腐ステーキ","ラーメン"]
    let tapsuu = [6,8,5,5,4,7,4,6,4,6,9,2,8,6,0]
    let swipesuu = [5,1,1,1,1,1,0,0,0,0,0,0,0,0,0]
    var ram = Int(arc4random_uniform(15))
    var moveTimer: Timer?
    var ramentype = 1
    
    // 変数の定義
    var countDownNumber = 0      // 残り時間
    var count = 0                // 食べた枚数
    var correct = 0             // 間違えずに食べきった皿の枚数
    var centerPoint : CGFloat?
    var testflg = true
    var counttap = 0
    var countswipe = 0
    var flg = 0                // 一段階目は０、二段階目は１
    var out = 0                // 違えたら１、正しい入力中は０
    var misoflg1 = 0           //　右にスワイプした回数
    var misoflg2 = 0           // 左にスワイプした回数
    var imagecount = 1
    
    // MARK: - 画面が表示される直前に毎回呼ばれる。(Pop遷移で戻ったときにも呼ばれる。)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        centerPoint = self.view.frame.size.width / 2 - self.foodTapView.frame.size.width / 2
        self.foodTapView.frame.origin.x = self.view.frame.size.width
        startGame()
    }
    
    
    func startGame() {
        //初期状態をセットします。
        countDownNumber = 60
        countDownLabel.text = "\(countDownNumber)秒"
        
        //開始のカウントダウン始めます
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(timer) in
            self.countDown(timer:timer)
        })
    }
    // カウントダウン
    func countDown(timer:Timer) {
        countDownNumber -= 1   // カウントダウン用の数字を1引く
        countDownLabel.text = "\(countDownNumber)秒"
        
//        if countDownNumber == 55 {
//            testflg = false
//            self.animateImage(target: foodTapView)
//        } else if countDownNumber == 50 {
//            testflg = false
//            self.animateImage(target: foodTapView)
//        }
        
        if countDownNumber == 0 {
            //タイマーを停止します
            timer.invalidate()
            self.performSegue(withIdentifier: "goResult", sender: self)
        }
        
        
    }
    
    func shori(suti :Int){
        switch suti {
        case 0:
            explainLabel.text = "下にスワイプでカット"
            setumeiLabel2.text = ""
            nameLabel.text = "飛騨牛ステーキ"
            imagecount = 1
            moveimage1.image = UIImage(named: "ステーキ\(imagecount).png")
            imagecount = swipesuu[0] + 1
            countswipe = 1
            break
        case 1:
            explainLabel.text = "上にスワイプで混ぜる"
            setumeiLabel2.text = ""
            nameLabel.text = "牛肉カレー"
            imagecount = 1
            moveimage1.image = UIImage(named: "飛騨牛カレー \(imagecount).png")
            break
        case 2:
            explainLabel.text = "タップで食べる"
            setumeiLabel2.text = ""
            nameLabel.text = "だんご"
            imagecount = 1
            moveimage1.image = UIImage(named: "団子\(imagecount).png")
            break
        case 3:
            explainLabel.text = "タップで食べる"
            setumeiLabel2.text = ""
            nameLabel.text = "五平餅"
            imagecount = 1
            moveimage1.image = UIImage(named: "五平餅\(imagecount).png")
            break
        case 4:
            explainLabel.text = "タップで食べる"
            setumeiLabel2.text = ""
            nameLabel.text = "牛串"
            imagecount = 1
            moveimage1.image = UIImage(named: "牛串\(imagecount).png")
            break
        case 5:
            explainLabel.text = "タップで食べる"
            setumeiLabel2.text = ""
            nameLabel.text = "あゆ"
            imagecount = 1
            moveimage1.image = UIImage(named: "あゆ\(imagecount).png")
            break
        case 6:
            explainLabel.text = "２本の指を広げるように"
            setumeiLabel2.text = "動かし分ける"
            nameLabel.text = "牛まん"
            imagecount = 1
            moveimage1.image = UIImage(named: "牛まん\(imagecount).png")
            break
        case 7:
            explainLabel.text = "左右交互にスワイプで"
            setumeiLabel2.text = "葉をどかす"
            nameLabel.text = "朴葉巻き"
            imagecount = 1
            moveimage1.image = UIImage(named: "朴葉巻き\(imagecount).png")
            break
        case 8:
            explainLabel.text = "タップで食べる"
            nameLabel.text = "コロッケ"
            setumeiLabel2.text = ""
            imagecount = 1
            moveimage1.image = UIImage(named: "コロッケ\(imagecount).png")
            break
        case 9:
            explainLabel.text = "タップで食べる"
            setumeiLabel2.text = ""
            nameLabel.text = "牛玉焼き"
            imagecount = 1
            moveimage1.image = UIImage(named: "ぎゅうたまやき\(imagecount).png")
            break
        case 10:
            explainLabel.text = "タップで食べる"
            setumeiLabel2.text = ""
            nameLabel.text = "バーガー"
            imagecount = 1
            moveimage1.image = UIImage(named: "飛騨牛バーガー\(imagecount).png")
            break
        case 11:
            explainLabel.text = "タップで食べる"
            setumeiLabel2.text = ""
            nameLabel.text = "すし"
            imagecount = 1
            moveimage1.image = UIImage(named: "寿司\(imagecount).png")
            break
        case 12:
            explainLabel.text = "タップで食べる"
            setumeiLabel2.text = ""
            nameLabel.text = "ソーセージ"
            imagecount = 1
            moveimage1.image = UIImage(named: "ソーセージ\(imagecount).png")
            break
        case 13:
            explainLabel.text = "タップで食べる"
            setumeiLabel2.text = ""
            nameLabel.text = "豆腐ステーキ"
            imagecount = 1
            moveimage1.image = UIImage(named: "豆腐ステーキ\(imagecount).png")
            break
        case 14:
            explainLabel.text = "長押しで食べる"
            setumeiLabel2.text = ""
            nameLabel.text = "ラーメン"
            moveimage1.image = UIImage(named: "ラーメン \(ramentype).png")
            ramentype = 1
            break
        default:
            break
        }
    }
    
    func animateImage(target:UIView){
        dishcount.text = String(count)
        // 画面1pt進むのにかかる時間の計算
        //let timePerSecond = 30.0 / view.bounds.size.width
        
        // 画像の位置から画面右までにかかる時間の計算
        //let remainTime = (view.bounds.size.width - target.frame.origin.x) * timePerSecond
        let remainTime = 1
        // アニメーション
        UIImageView.transition(with: target, duration: TimeInterval( remainTime), options: .curveLinear, animations: { () -> Void in
                // 画面左方向に移動
            if self.testflg {
                self.ram = Int(arc4random_uniform(15))
                self.shori(suti: Int(self.ram))
                target.frame.origin.x = self.centerPoint!
            } else {
                target.frame.origin.x = -(target.frame.size.width)
            }

        }, completion: { _ in
            
            if target.frame.origin.x < self.centerPoint! && self.testflg {
                target.frame.origin.x = self.centerPoint!
            }
            // 画面右まで行ったら、画面左に戻す
            
            
            // 再度アニメーションを起動
            if !self.testflg {
                target.frame.origin.x = self.view.frame.size.width
                self.testflg = true
                self.animateImage(target: target)
            }
            //self.animateImage(target: target)
        })
        //TODO: 画面の真ん中に来たらタイマーを止める
        
    }
    // 画面遷移する直前に呼ばれる
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue: UIStoryboardSegue, sender: AnyObject?).self; do {
            if segue.identifier == "goResult" {
                var resultViewController = segue.destination as! ResultViewController
                resultViewController.maisuu = self.count
            }
        }
    }

    @objc func tap(_ sender: UITapGestureRecognizer){
    //    print("タップ")
        if(ram >= 0 && ram <= 13){
            if(ram == 0 || ram == 6){
                if(flg == 1){
                    switch ram{
                    case 0:
                        imagecount = imagecount + 1
                        moveimage1.image = UIImage(named: "ステーキ\(imagecount).png")
                        break
                    case 6:
                        imagecount = imagecount + 1
                        moveimage1.image = UIImage(named: "牛まん\(imagecount).png")
                        break
                    default:
                        break
                    }
                    counttap = counttap + 1
                    if(counttap == tapsuu[ram]){
                        count = count + 1
                        testflg = false
                        self.animateImage(target: foodTapView)
                        flg = 0
                        if(out == 0){
                            correct = correct + 1
                            if(correct % 3 == 0 && correct != 0){
                                countDownNumber = countDownNumber  + 5
                            }
                        }else{
                            correct = 0
                            out = 0
                        }
                    }
                }else{
                    out = 1
                }
            }else if(ram == 7){
                if(misoflg1 == 1 && misoflg2 == 1){
                    imagecount = imagecount + 1
                    moveimage1.image = UIImage(named: "朴葉巻き\(imagecount).png")
                    if(imagecount == tapsuu[ram]){
                        count = count + 1
                        testflg = false
                        self.animateImage(target: foodTapView)
                        misoflg1 = 0
                        misoflg2 = 0
                        if(out == 0){
                            correct = correct + 1
                            if(correct % 3 == 0 && correct != 0){
                                countDownNumber = countDownNumber  + 5
                            }
                        }else{
                            correct = 0
                            out = 0
                        }
                    }
                }
            }else{
                switch ram{
                case 1:
                    imagecount = imagecount + 1
                    moveimage1.image = UIImage(named: "飛騨牛カレー \(imagecount).png")
                    break
                case 2:
                    imagecount = imagecount + 1
                    moveimage1.image = UIImage(named: "団子\(imagecount).png")
                    break
                case 3:
                    imagecount = imagecount + 1
                    moveimage1.image = UIImage(named: "五平餅\(imagecount).png")
                    break
                case 4:
                    imagecount = imagecount + 1
                    moveimage1.image = UIImage(named: "牛串\(imagecount).png")
                    break
                case 5:
                    imagecount = imagecount + 1
                    moveimage1.image = UIImage(named: "あゆ\(imagecount).png")
                    break
                case 8:
                    imagecount = imagecount + 1
                    moveimage1.image = UIImage(named: "コロッケ\(imagecount).png")
                    break
                case 9:
                    imagecount = imagecount + 1
                    moveimage1.image = UIImage(named: "ぎゅうたまやき\(imagecount).png")
                    break
                case 10:
                    imagecount = imagecount + 1
                    moveimage1.image = UIImage(named: "飛騨牛バーガー\(imagecount).png")
                    break
                case 11:
                    imagecount = imagecount + 1
                    moveimage1.image = UIImage(named: "寿司\(imagecount).png")
                    break
                case 12:
                    imagecount = imagecount + 1
                    moveimage1.image = UIImage(named: "ソーセージ\(imagecount).png")
                    break
                case 13:
                    imagecount = imagecount + 1
                    moveimage1.image = UIImage(named: "豆腐ステーキ\(imagecount).png")
                    break
                default:
                    break
                }
                counttap = counttap + 1
                if(counttap == tapsuu[ram]){
                    count = count + 1
                    testflg = false
                    self.animateImage(target: foodTapView)
                    counttap = 0
                    flg = 0
                    if(out == 0){
                        correct = correct + 1
                        if(correct % 3 == 0 && correct != 0){
                            countDownNumber = countDownNumber  + 5
                        }
                    }else{
                        correct = 0
                        out = 0
                    }
                }
            }
        }else{
            out = 1
        }
        
    }
    
    @IBAction func longPressGesture(sender: UILongPressGestureRecognizer){
        // 指が離れたことを検知
        if(ram == 14){
            
        if(sender.state == UIGestureRecognizerState.ended){
            print("hoge")
            // タイマーストップ
            moveTimer?.invalidate()
            
        }
        
        if(sender.state == UIGestureRecognizerState.began){
            print("start")
            moveTimer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true, block: { (timer) in
//                ラーメンが減っていく動作の関数
                self.eatramen(timer: timer)
            })
        }
        }else{
            out = 1
        }
    }

    // ラーメンが減っていく画像の変化の関数を作成
    func eatramen(timer:Timer){
        ramentype = ramentype + 1
        if(ramentype < 9){
        moveimage1.image = UIImage(named: "ラーメン \(ramentype).png")
        }else{
            count = count + 1
            testflg = false
            self.animateImage(target: foodTapView)
            misoflg1 = 0
            misoflg2 = 0
            if(out == 0){
                correct = correct + 1
                if(correct % 3 == 0 && correct != 0){
                    countDownNumber = countDownNumber  + 5
                }
            }else{
                correct = 0
                out = 0
            }
        }
    }
    
//    @objc func swipe(_ sender: UISwipeGestureRecognizer){
//        print("スワイプ")
//
//    }
    
    @objc func downswipe(_ sender: UISwipeGestureRecognizer){
    //    print("下")
        if(ram == 0 && flg == 0){
            countswipe = countswipe + 1
            moveimage1.image = UIImage(named: "ステーキ\(countswipe).png")
        }else{
            out = 1
        }
        if(countswipe - 1 == swipesuu[0]){
            flg = 1
            explainLabel.text = "タップで食べる"
        }
    }
    
    @objc func leftswipe(_ sender: UISwipeGestureRecognizer){
    //    print("左")
        if(ram >= 2 && ram <= 5){
            if(flg == 1){
                count = count + 1
                testflg = false
                self.animateImage(target: foodTapView)
                flg = 0
                if(out == 0){
                    correct = correct + 1
                    if(correct % 3 == 0 && correct != 0){
                        countDownNumber = countDownNumber  + 5
                    }
                }else{
                    correct = 0
                    out = 0
                }
            }
        }else if(ram == 7){
            if(misoflg1 == 1 && misoflg2 == 0){
                misoflg2 = misoflg2 + 1
                imagecount = imagecount + 1
                moveimage1.image = UIImage(named: "朴葉巻き\(imagecount).png")
                explainLabel.text = "タップで食べる"
                setumeiLabel2.text = ""
            }else{
                out = 1
            }
        }else{
            out = 1
        }
    }
    
    @objc func rightswipe(_ sender: UISwipeGestureRecognizer){
    //    print("右")
        if(ram == 7){
            if(misoflg1 == 0 && misoflg2 == 0){
                misoflg1 = misoflg1 + 1
                imagecount = imagecount + 1
                moveimage1.image = UIImage(named: "朴葉巻き\(imagecount).png")
            }else{
                out = 1
            }
        }else{
            out = 1
        }
    }
    
    @objc func upswipe(_ sender: UISwipeGestureRecognizer){
    //    print("上")
        if(ram == 1 && flg == 0){
            flg = 1
            explainLabel.text = "タップで食べる"
            imagecount = imagecount + 1
            moveimage1.image = UIImage(named: "飛騨牛カレー \(imagecount).png")
        }else{
            out = 1
        }
    }
    
    //ピンチ時の呼び出しメソッド
    @IBAction func pinchLabel(sender: UIPinchGestureRecognizer) {
        if(ram == 6 && flg == 0){
        // ピンチの動作
        if(sender.state == UIGestureRecognizerState.began ){
            //ピンチ開始時のアフィン変換をクラス変数に保持する。
            imagecount = imagecount + 1
            moveimage1.image = UIImage(named: "牛まん\(imagecount).png")
            explainLabel.text = "タップで食べる"
            flg = 1
        }
        }else{
            out = 1
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateImage(target: foodTapView)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tap(_:)))
        self.foodTapView.addGestureRecognizer(tapGesture)
        let downswipeGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.downswipe(_:)))
        let leftswipeGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.leftswipe(_:)))
        let rightswipeGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.rightswipe(_:)))
        let upswipeGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.upswipe(_:)))
        downswipeGesture.direction = .down
        leftswipeGesture.direction = .left
        rightswipeGesture.direction = .right
        upswipeGesture.direction = .up
        self.foodTapView.addGestureRecognizer(downswipeGesture)
        self.foodTapView.addGestureRecognizer(leftswipeGesture)
        self.foodTapView.addGestureRecognizer(rightswipeGesture)
        self.foodTapView.addGestureRecognizer(upswipeGesture)

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
