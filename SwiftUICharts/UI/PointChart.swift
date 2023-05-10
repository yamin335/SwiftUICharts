//
//  PointChart.swift
//  SwiftUICharts
//
//  Created by Md. Yamin on 10.05.23.
//

import SwiftUI
import Charts

struct PointChart: View {
    var body: some View {
        Chart(cityWiseAttendance) { warehouse in
            ForEach(warehouse.workerAttendance) { attendance in
                PointMark(
                    x: .value("Day", attendance.day),
                    y: .value("Attendance", attendance.workers)
                )
                .foregroundStyle(by: .value("City", warehouse.city))
                .symbol(by: .value("City", warehouse.city))
            }
        }
        .navigationTitle("Point chart")
        .padding(5)
    }
}

struct PointChart_Previews: PreviewProvider {
    static var previews: some View {
        PointChart()
    }
}
