//
//  User.swift
//  Autolayout
//
//  Created by sole on 2022/04/27.
//

import UIKit

enum Section {
    case main
}

struct User: Hashable {
    
    let identifier = UUID()
    let profileImage: UIImage
    let name: String
    let description: String
    var isExpand: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.identifier == rhs.identifier && lhs.isExpand == rhs.isExpand
    }
    
    static func getTestData() -> [User] {
        
        let data = [
            User(profileImage: UIImage(systemName: "person.fill.questionmark")!, name: "one", description: "short Text", isExpand: false),
            User(profileImage: UIImage(systemName: "person.fill.questionmark")!, name: "two", description: "로렘 입숨(lorem ipsum; 줄여서 립숨, lipsum)은 출판이나 그래픽 디자인 분야에서 폰트, 타이포그래피, 레이아웃 같은 그래픽 요소나 시각적 연출을 보여줄 때 사용하는 표준 채우기 텍스트로, 최종 결과물에 들어가는 실제적인 문장 내용이 채워지기 전에 시각 디자인 프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.", isExpand: false),
            User(profileImage: UIImage(systemName: "person.fill.questionmark")!, name: "three", description: "short Text", isExpand: false),
            User(profileImage: UIImage(systemName: "person.fill.questionmark")!, name: "four", description: "로렘 입숨은 전통 라틴어와 닮은 점 때문에 종종 호기심을 유발하기도 하지만 그 이상의 의미를 담지는 않는다. 문서에서 텍스트가 보이면 사람들은 전체적인 프레젠테이션보다는 텍스트에 담긴 뜻에 집중하는 경향이 있어서 출판사들은 서체나 디자인을 보일 때는 프레젠테이션 자체에 초점을 맞추기 위해 로렘 입숨을 사용한다.", isExpand: false),
            User(profileImage: UIImage(systemName: "person.fill.questionmark")!, name: "five", description: "short Text", isExpand: false),
            User(profileImage: UIImage(systemName: "person.fill.questionmark")!, name: "six", description: "로렘 입숨(lorem ipsum; 줄여서 립숨, lipsum)은 출판이나 그래픽 디자인 분야에서 폰트, 타이포그래피, 레이아웃 같은 그래픽 요소나 시각적 연출을 보여줄 때 사용하는 표준 채우기 텍스트로, 최종 결과물에 들어가는 실제적인 문장 내용이 채워지기 전에 시각 디자인 프로젝트 모형의 채움 글로도 이용된다. 이런 용도로 사용할 때 로렘 입숨을 그리킹(greeking)이라고도 부르며, 때로 로렘 입숨은 공간만 차지하는 무언가를 지칭하는 용어로도 사용된다.", isExpand: false),
            User(profileImage: UIImage(systemName: "person.fill.questionmark")!, name: "seven", description: "short Text", isExpand: false),
            User(profileImage: UIImage(systemName: "person.fill.questionmark")!, name: "eight", description: "로렘 입숨은 전통 라틴어와 닮은 점 때문에 종종 호기심을 유발하기도 하지만 그 이상의 의미를 담지는 않는다. 문서에서 텍스트가 보이면 사람들은 전체적인 프레젠테이션보다는 텍스트에 담긴 뜻에 집중하는 경향이 있어서 출판사들은 서체나 디자인을 보일 때는 프레젠테이션 자체에 초점을 맞추기 위해 로렘 입숨을 사용한다.", isExpand: false),
            User(profileImage: UIImage(systemName: "person.fill.questionmark")!, name: "nine", description: "short Text", isExpand: false)
        ]
        return data
    }
}
