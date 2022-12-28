//
//  ChartDetailView.swift
//  BigProjectAStoreIpadOS
//
//  Created by kimminho on 2022/12/28.
//

/*
 작성자 : 김민호
 더미데이터로 현재 차트분석 띄워주고 있음
 */

import SwiftUI

struct Statistics: Identifiable,Hashable {
    var id: String
    var title: String
    var titleDetail: String?
    var count: String
    var CompareLastWeek: String?
    var increaseTrendImage: String?
    var increaseTrend: String?
}


struct ChartDetailView: View {
    //목록을 1부터 1000까지 만듬
//    let data = Array(1...12).map { "목록 \($0)"}
    let data: [Statistics] = [
        Statistics(id: "", title: "어제 결제 금액", count: "1.1 천만원",CompareLastWeek: "지난주 (화) 대비", increaseTrendImage: "chart.line.uptrend.xyaxis",increaseTrend: "118.1%"),
        Statistics(id: "", title: "어제 결제건수", count: "59",CompareLastWeek: "지난주 (화) 대비", increaseTrendImage: "chart.line.uptrend.xyaxis",increaseTrend: "90.3%"),
        Statistics(id: "", title: "어제 결제 상품수량", count: "81",CompareLastWeek: "지난주 (화) 대비", increaseTrendImage: "chart.line.uptrend.xyaxis",increaseTrend: "118.1%"),
        Statistics(id: "", title: "어제 최고 결제 금액 카테고리", titleDetail:"매트리스", count: "3.8백만원", increaseTrend: "35.2%"),
        Statistics(id: "", title: "어제 최고 결제 수량 카테고리", titleDetail:"매트리스", count: "40", increaseTrend: "49.4%"),
        Statistics(id: "", title: "어제 최고 결제 기여 채널", titleDetail:"네이버쇼핑-검색", count: "3.4백만원", increaseTrend: "50.2%"),
        Statistics(id: "", title: "어제 유입수",count: "2448", CompareLastWeek: "지난주 (화) 대비", increaseTrendImage: "chart.line.uptrend.xyaxis", increaseTrend: "50.2%"),
        Statistics(id: "", title: "어제 최고 유입 채널", titleDetail:"네이버쇼핑-검색", count: "1,007", increaseTrend: "41.1%"),
        Statistics(id: "", title: "어제 유입당 결제율", count: "1.53%",CompareLastWeek: "지난주 (화) 대비", increaseTrendImage: "chart.line.uptrend.xyaxis",increaseTrend: "0.54%p"),
        Statistics(id: "", title: "어제 최고 유입당 결제율 채널", titleDetail:"네이버쇼핑-검색", count: "2.33%"),
        Statistics(id: "", title: "어제 환불 금액", count: "65.5만원",CompareLastWeek: "지난주 (화) 대비", increaseTrendImage: "chart.line.uptrend.xyaxis",increaseTrend: "134.8%"),
        Statistics(id: "", title: "어제 환불 수량", count: "5",CompareLastWeek: "지난주 (화) 대비", increaseTrendImage: "chart.line.uptrend.xyaxis",increaseTrend: "150%"),
        
        
        
    ]
    
    //화면을 그리드형식으로 꽉채워줌
    let columns = [
        GridItem(.flexible(maximum:300)),
        GridItem(.flexible(maximum:300)),
        GridItem(.flexible(maximum:300))
//        GridItem(.flexible())
    ]
    
    var body: some View {
            LazyVGrid(columns: columns,  spacing: 20) {
                ForEach(data, id: \.self) { statistics in
                 //VStack으로 도형추가
                    VStack {
                       ZStack {
                           Rectangle()
                               .fill(Color.white)
                               .frame(height: 200)
                               .shadow(radius: 6)
                               .padding(5)
                           VStack {
                               Text(statistics.title)
                                   .foregroundColor(.gray)
                                   .opacity(0.8)
                                   .padding(2)
                               if let a = statistics.titleDetail {
                                   Text(a)
                                       .font(.title3)
                                       .padding(2)
                               }
                               Text(statistics.count)
                                   .font(.title)
                                   .fontWeight(.bold)
                                   .padding(2)
                               HStack {
                                   Text(statistics.CompareLastWeek ?? "")
                                       .foregroundColor(.gray)
                                       .opacity(0.8)
                                   Image(systemName: statistics.increaseTrendImage ?? "")
                                       .foregroundStyle(.green)
                                   Text(statistics.increaseTrend ?? "")
                                       .foregroundStyle(.green)
                               }

                           }.frame(minWidth:100,maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
                       }

                    }
                        
                }
            }
            .padding(.horizontal)
    }
}

struct ChartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChartDetailView()
    }
}
