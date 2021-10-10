//
//  MovieVO.swift
//  MyMovieChart
//
//  Created by 임준식 on 2021/09/23.
//

import Foundation
import UIKit

class MovieVO {
    var thumbnail: String? // 영화 섬네일 이미지 주소
    var title: String? // 영화 제목
    var description: String? // 영화 설명
    var detail: String? // 상세 정보
    var opendate: String? // 개봉일
    var rating: Double? // 평점
    
    // 영화 썸네일 이미지를 담을 UIImage 객체 추가
    var thumbnailImage: UIImage?
}
