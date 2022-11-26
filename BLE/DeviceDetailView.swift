//
//  TagDetailView.swift
//  BLE
//
//  Created by 田中大地 on 2022/11/23.
//

import SwiftUI
import CoreBluetooth

struct DeviceDetailView: View {
    @EnvironmentObject var manager: DeviceManager
    var device: Device
    var body: some View {
        VStack(alignment: .leading){
            Text(device.peripheral.name ?? "unnamed device")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(device.peripheral.identifier.description)
                .font(.subheadline)
                .padding(.bottom,50)
            HStack {
                DeviceButtonView(device: device, operation: .connect)
                    .padding()
                DeviceButtonView(device: device, operation: .disconect)
                    .padding()
            }
            Spacer()
       }
    }
}
