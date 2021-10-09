//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 임준식 on 2021/09/23.
//

import UIKit
class ListViewController : UITableViewController {
    
    // 튜플 아이템으로 구성된 데이터 세트
    var dataset = [
        ("다크 나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2008-09-04", 8.95, "darknight.jpeg"),
        ("호우 시절", "때를 알고 내리는 좋은 비", "2009-10-08", 7.31, "rain.jpeg"),
        ("말할 수 없는 비밀", "여기서 너까지 다섯 걸음", "2015-05-07", 9.19, "secret.jpeg")
    ]
    
    // 테이블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO] ()
        for (title, desc, opendate, rating, thumbnail) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            mvo.thumbnail = thumbnail
            
            datalist.append(mvo)
        }
        return datalist
    }()

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 주어진 행에 맞는 데이터 소스를 읽어온다.
        let row = self.list[indexPath.row]
        // 테이블 셀 객체를 직접 생성하는 대신 큐로부터 가져옴
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
 
        /*
        // 영화 제목이 표시될 레이블을 title 변수로 받음
        let title = cell.viewWithTag(101) as? UILabel
        // 영화 요약이 표시될 레이블을 desc 변수로 받음
        let desc = cell.viewWithTag(102) as? UILabel
        // 영화 개봉일이 표시될 레이블을 opendate 변수로 받음
        let opendate = cell.viewWithTag(103) as? UILabel
        // 영화 별점이 표시될 레이블을 rating 변수로 받음
        let rating = cell.viewWithTag(104) as? UILabel
        
        // 데이터 소스에 저장될 값을 각 레이블 변수에 할당
        title?.text = row.title
        desc?.text = row.description
        opendate?.text = row.opendate
        rating?.text = "\(row.rating!)"
        */
        
        // 데이터 소스에 저장된 값을 각 아울렛 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        cell.thumbnail.image = UIImage(named: row.thumbnail!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
    
    override func viewDidLoad() {
        // 1. 호핀 API 호출을 위한 URI를 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=1&count=10&genreId=&order=releasedateasc"
        let apiURI: URL! = URL(string: url)
        
        // 2. REST API를 호출
        let apidata = try! Data(contentsOf: apiURI)
        
        // 3. 데이터 전송 결과를 로그로 출력 (반드시 필요한 코드는 아님)
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result=\(log)")
    }
}
