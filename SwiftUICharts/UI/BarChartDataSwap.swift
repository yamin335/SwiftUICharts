//
//  BarChartDataSwap.swift
//  SwiftUICharts
//
//  Created by Md. Yamin on 10.05.23.
//

import SwiftUI
import Charts

enum City {
    case erlangen
    case nurnberg
}

struct WorkerAttendance: Identifiable {
    let day: String
    let workers: Int
    var id: String {day}
}

let erlangenWarehouseData: [WorkerAttendance] = [
    .init(day: "2023-05-08".toDate().shortDay(), workers: 133),
    .init(day: "2023-05-09".toDate().shortDay(), workers: 122),
    .init(day: "2023-05-10".toDate().shortDay(), workers: 166),
    .init(day: "2023-05-11".toDate().shortDay(), workers: 111),
    .init(day: "2023-05-12".toDate().shortDay(), workers: 99),
    .init(day: "2023-05-13".toDate().shortDay(), workers: 133),
    .init(day: "2023-05-14".toDate().shortDay(), workers: 88)
]

let nurnbergWarehouseData: [WorkerAttendance] = [
    .init(day: "2023-05-08".toDate().shortDay(), workers: 188),
    .init(day: "2023-05-09".toDate().shortDay(), workers: 166),
    .init(day: "2023-05-10".toDate().shortDay(), workers: 177),
    .init(day: "2023-05-11".toDate().shortDay(), workers: 155),
    .init(day: "2023-05-12".toDate().shortDay(), workers: 144),
    .init(day: "2023-05-13".toDate().shortDay(), workers: 199),
    .init(day: "2023-05-14".toDate().shortDay(), workers: 222)
]

struct BarChartDataSwap: View {
    @State var city: City = .erlangen
    
    var workerAttendance: [WorkerAttendance] {
        switch city {
        case .erlangen:
            return erlangenWarehouseData
        case .nurnberg:
            return nurnbergWarehouseData
        }
    }
    
    var title: String {
        switch city {
        case .erlangen:
            return "Erlangen Warehouse"
        case .nurnberg:
            return "Nürnberg Warehouse"
        }
    }
    
    var body: some View {
        VStack {
            Picker("City", selection: $city.animation(.easeInOut)) {
                Text("Erlangen").tag(City.erlangen)
                Text("Nürnberg").tag(City.nurnberg)
            }
            .pickerStyle(.segmented)
            
            Chart(workerAttendance) { data in
                BarMark(
                    x: .value("Day", data.day),
                    y: .value("Attendance", data.workers)
                )
                .foregroundStyle(by: .value("Day", data.day))
                .symbol(by: .value("Day", data.day))
            }
            .padding(5)
        }
        .navigationTitle(title)
    }
}

struct BarChartDataSwap_Previews: PreviewProvider {
    static var previews: some View {
        BarChartDataSwap()
    }
}
