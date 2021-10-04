//
//  MovieCell.swift
//  MyMovieChart
//
//  Created by 임준식 on 2021/10/03.
//

import Foundation
import UIKit

class MovieCell : UITableViewCell{
    
    @IBOutlet var title: UILabel! // 영화 제목
    @IBOutlet var desc: UILabel! // 영화 설명
    @IBOutlet var opendate: UILabel! // 개봉일
    @IBOutlet var rating: UILabel! // 평점
    
}
