//
//  SimpleBarChart.swift
//  SwiftUICharts
//
//  Created by Md. Yamin on 09.05.23.
//

import SwiftUI
import Charts

struct Snacks: Identifiable {
    let id = UUID()
    let name: String
    let stock: Int
}

var lastItemNumber = 3

struct SimpleBarChart: View {
    @State var store: [Snacks] = [
        Snacks(name: "Item-1", stock: 500),
        Snacks(name: "Item-2", stock: 150),
        Snacks(name: "Item-3", stock: 700)
    ]
    
    var body: some View {
        VStack {
            Chart(store) { snack in
                if store.count < 6 {
                    BarMark(
                        x: .value("Name", snack.name),
                        y: .value("Stock", snack.stock)
                    )
                } else {
                    BarMark(
                        x: .value("Stock", snack.stock),
                        y: .value("Name", snack.name)
                    )
                }
            }.padding(5)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    withAnimation {
                        lastItemNumber += 1
                        store.append(Snacks(name: "Item-\(lastItemNumber)", stock: Int.random(in: 100..<1000)))
                    }
                }) {
                    HStack {
                        Image(systemName: "plus")
                        Text("Add new item")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 6)
                    .background(
                        RoundedRectangle(cornerRadius: 5, style: .circular)
                            .stroke(.blue, lineWidth: 1)
                    )
                }
            }
        }
    }
}

struct SimpleBarChart_Previews: PreviewProvider {
    static var previews: some View {
        SimpleBarChart()
    }
}
