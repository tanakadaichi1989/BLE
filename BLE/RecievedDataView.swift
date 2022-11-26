//
//  RecievedDataView.swift
//  BLE
//
//  Created by 田中大地 on 2022/11/27.
//

import SwiftUI

struct RecievedDataView: View {
    var data: [Int]
    var body: some View {
        VStack(alignment: .center) {
            Text(getButtonEvent(data:data))
                .font(.title)
                .fontWeight(.black)
        }
        .padding()
    }
    
    private func getButtonEvent(data: [Int]) -> String {
        guard data.count == 4 else { return "" }
        switch data[2] {
        case 1: return "tapped."
        case 3: return "double tapped."
        default: return ""
        }
    }
}

struct RecievedDataView_Previews: PreviewProvider {
    static var previews: some View {
        RecievedDataView(data: [1,0,1,1])
    }
}
