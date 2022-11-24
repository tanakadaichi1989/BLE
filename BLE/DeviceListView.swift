//
//  TagListView.swift
//  BLE
//
//  Created by 田中大地 on 2022/11/23.
//

import SwiftUI
import CoreBluetooth

struct DeviceListView: View {
    var device: Device
    var body: some View {
        VStack(alignment: .leading){
            Text(device.peripheral.name ?? "unnamed device")
                .fontWeight(.bold)
            Text("RSSI: \(device.rssi.description)")
                .fontWeight(.light)
        }
    }
}

