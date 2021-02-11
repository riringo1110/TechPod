//
//  ViewController.swift
//  TechPod
//
//  Created by Ririko Nagaishi on 2021/02/11.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //storyboardで使うtableviewを宣言
    @IBOutlet var table: UITableView!
    
    //曲名を入れるための配列
    var songNameArray = [String]()
    //曲のファイル名を入れるための配列
    var fileNameArray = [String]()
    //音楽かの画像を入れるための配列
    var imageNameArray = [String]()
    
    //音楽を再生するための変数
    var audioPlayer : AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テーブルビューのデータソースメソッドはviewControllerクラスに書くよ、という設定
        table.dataSource = self
        
        //テーブルびゅーのデリゲートメソッドはviewControllerメソッドに書くよ、という宣言
        table.delegate = self
        
        //songNameArrayに曲名を入れていく
        songNameArray = ["カノン", "エリーゼのために", "G線上のアリア"]
        
        //fileaNameArrayにファイル名を入れていく
        fileNameArray = ["cannon", "elise", "aria"]
        
        //imageNameArrayに曲の画像を入れていく
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg"]
    }
    
    //セルの数を設定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //セルの数をsongNameArrayの数にする
        return songNameArray.count
    }
    //ID付きのセルを取得して、セル付属のtextLableに「テスト」と表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //セルにsongNameArrayの曲名を表示
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        //cellに音楽家の写真を表示
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        return cell!
    }
    //cellが押された時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました!")
        
        //音楽フィルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource:
                                        fileNameArray[indexPath.row], ofType:"mp3")!)
        //音楽再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        //音楽再生
        audioPlayer.play()
    }
    
}

