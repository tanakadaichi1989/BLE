//
//  TagDetailView.swift
//  BLE
//
//  Created by 田中大地 on 2022/11/23.
//

import SwiftUI
import CoreBluetooth

struct TagDetailView: View {
    var peripheral: CBPeripheral
    var body: some View {
        VStack(alignment: .leading){
            Text(peripheral.name ?? "unnamed device")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text(peripheral.identifier.description)
                .padding()
            Text(peripheral.state.rawValue.description)
                .padding()
            Spacer()
       }
    }
}
