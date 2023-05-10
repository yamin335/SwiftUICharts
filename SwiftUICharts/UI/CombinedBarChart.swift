//
//  CombinedBarChart.swift
//  SwiftUICharts
//
//  Created by Md. Yamin on 10.05.23.
//

import SwiftUI
import Charts

struct WarehouseAttendance: Identifiable {
    let city: String
    let workerAttendance: [WorkerAttendance]
    
    var id: String {city}
}

let cityWiseAttendance: [WarehouseAttendance] = [
    .init(city: "Erlangen", workerAttendance: erlangenWarehouseData),
    .init(city: "Nürnberg", workerAttendance: nurnbergWarehouseData)
]

struct CombinedBarChart: View {
    var body: some View {
        Chart(cityWiseAttendance) { warehouse in
            ForEach(warehouse.workerAttendance) { attendance in
                BarMark(
                    x: .value("Day", attendance.day),
                    y: .value("Attendance", attendance.workers)
                )
                .foregroundStyle(by: .value("City", warehouse.city))
                .symbol(by: .value("City", warehouse.city))
            }
        }
        .navigationTitle("Combined bar chart")
        .padding(5)
    }
}

struct CombinedBarChart_Previews: PreviewProvider {
    static var previews: some View {
        CombinedBarChart()
    }
}
