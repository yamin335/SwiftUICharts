//
//  LineChart.swift
//  SwiftUICharts
//
//  Created by Md. Yamin on 10.05.23.
//

import SwiftUI
import Charts

struct LineChart: View {
    @State var showPoint: Bool = true
    var body: some View {
        VStack {
            Toggle("Show point mark", isOn: $showPoint.animation(.easeOut))
                .toggleStyle(SwitchToggleStyle(tint: Color("blue2")))
            
            Chart(cityWiseAttendance) { warehouse in
                ForEach(warehouse.workerAttendance) { attendance in
                    if showPoint {
                        LineMark(
                            x: .value("Day", attendance.day),
                            y: .value("Attendance", attendance.workers)
                        )
                        .foregroundStyle(by: .value("City", warehouse.city))
                        .symbol(by: .value("City", warehouse.city))
                    } else {
                        LineMark(
                            x: .value("Day", attendance.day),
                            y: .value("Attendance", attendance.workers)
                        )
                        .foregroundStyle(by: .value("City", warehouse.city))
                    }
                }
            }
        }
        .navigationTitle("Line chart")
        .padding(8)
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart()
    }
}
