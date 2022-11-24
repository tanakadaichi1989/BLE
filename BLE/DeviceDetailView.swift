//
//  TagDetailView.swift
//  BLE
//
//  Created by 田中大地 on 2022/11/23.
//

import SwiftUI
import CoreBluetooth

struct DeviceDetailView: View {
    var device: Device
    var body: some View {
        VStack(alignment: .leading){
            Text(device.peripheral.name ?? "unnamed device")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text(device.peripheral.identifier.description)
                .padding()
            Spacer()
       }
    }
}
