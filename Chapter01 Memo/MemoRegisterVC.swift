//
//  MemoRegisterVC.swift
//  Chapter01 Memo
//
//  Created by Ju young Jung on 2017. 10. 20..
//  Copyright © 2017년 solbat. All rights reserved.
//

import UIKit

class MemoRegisterVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    var subject: String!
    

    @IBOutlet weak var contents: UITextView!
    @IBOutlet weak var preview: UIImageView!
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        guard self.contents.text?.isEmpty == false else {
            // 내용을 입력하지 않았을 경우
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        // 정상 실행 구문
        let data = MemoData()
        print(self.subject)
        data.title = self.subject
        data.contents = self.contents.text
        data.image = self.preview.image
        data.regdate = Date()
        print(data);
        // 앱 델리게이트 객체를 읽어온 다음 memoList 배열에 Memodata 객체를 추가한다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.memoList.append(data)
        
        // 작성품 화면을 종료하고 이전화면으로 되돌아간다.
        _ = self.navigationController?.popViewController(animated: true)
        
        
        
    }
    
    @IBAction func pick(_ sender: UIBarButtonItem) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        self.present(picker, animated: false, completion: nil)
           
    }
    
    // 이미지 선택했을때 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // 선택된 이미지를 미리보기에 표기합니다.
        self.preview.image = info[UIImagePickerControllerEditedImage] as? UIImage
        
        // 이미지 피커 컨트롤러를 닫습니다.
        picker.dismiss(animated: false, completion: nil)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let content = textView.text as NSString
        let length = ( (content.length > 15) ? 15 : content.length )
        self.subject = content.substring(with: NSRange(location: 0, length: length))
        
        //네비게이션 타이틀에 표시한다.
        self.navigationItem.title = subject
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.contents.delegate = self
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
