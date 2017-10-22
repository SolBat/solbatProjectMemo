//
//  MemoListVC.swift
//  Chapter01 Memo
//
//  Created by Ju young Jung on 2017. 10. 20..
//  Copyright © 2017년 solbat. All rights reserved.
//

import UIKit

class MemoListVC: UITableViewController {

    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    // 이 메소드는 테이블 뷰의 셀의 개수를 결정하는 메소드입니다.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegate.memoList.count
        
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 1. memoList 데이터에서 주어진 행에 맞는 데이터를 꺼낸다.
        let row = self.appDelegate.memoList[indexPath.row]
        
        // 2. 이미지 속성이 비었을 경우 MemoCell 아니면 memoCellWithImage
        let cellId = row.image == nil ? "MemoCell" : "MemoCellWithImage"
        
        // 3. 재사용 큐로부터 프로토타입 셀의 인스턴스를 전달 받는다.
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
        
        // 4. 내용 구성
        cell.subject?.text = row.title
        cell.contents?.text = row.contents
        cell.img?.image = row.image
        
        // 5. Date 타입의 날짜 포맷변경
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-mm-dd HH:mm:ss"
        
        cell.regdate?.text = formatter.string(from: row.regdate!)

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 1. moemoList 배열에서 선택된 행에 맞는 데이터를 꺼낸다.
        let row = self.appDelegate.memoList[indexPath.row]
        
        // 2. 상세화면의 인스턴스를 생성한다.
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as? MemoDetailViewVC else {
            return
        }
        
        vc.param = row
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    // 스크린에 뷰 컨트롤러가 나타날 때마다 호출되는 메소드
    override func viewWillAppear(_ animated: Bool) {
        // 테이블 데이터를 다시 읽어들인다. 이에 따라 행을 구성하는 로직이 다시 실행 될 것이다.
        self.tableView.reloadData()
        
        
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
