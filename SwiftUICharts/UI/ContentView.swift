//
//  ContentView.swift
//  SwiftUICharts
//
//  Created by Md. Yamin on 08.05.23.
//

import SwiftUI

struct MenuButton: View {
    let icon: String
    let label: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color("blue2"))
            
            Text(label)
                .foregroundColor(Color("textColor3"))
                .font(.system(size: 20))
        }
        .padding(10)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 5, style: .circular).fill(Color("gray4")))
    }
}

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    SimpleBarChart()
                } label: {
                    MenuButton(icon: "chart.bar.xaxis", label: "Bar chart")
                }
                
                NavigationLink {
                    BarChartDataSwap()
                } label: {
                    MenuButton(icon: "arrow.left.arrow.right.square", label: "Bar chart data swap")
                }
                
                NavigationLink {
                    CombinedBarChart()
                } label: {
                    MenuButton(icon: "arrow.triangle.merge", label: "Combined bar chart")
                }
                
                NavigationLink {
                    PointChart()
                } label: {
                    MenuButton(icon: "chart.dots.scatter", label: "Point chart")
                }
                Spacer()
            }
            .navigationTitle("SwiftUI Charts")
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
