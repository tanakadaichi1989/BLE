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
                .padding()
            Text(device.peripheral.identifier.description)
                .padding()
            Text("\(manager.tapCount.description) times tapped")
                .padding()
            connectButton
            disconnectButton
            Spacer()
       }
    }
    
    private var connectButton: some View {
        Button {
            manager.connect(perioheral: device.peripheral)
        } label: {
            Text("connect")
        }
        .padding()
        .buttonStyle(.borderedProminent)
    }
    
    private var disconnectButton: some View {
        Button {
            manager.disconnect(peripheral: device.peripheral)
        } label: {
            Text("disconnect")
        }
        .padding()
        .buttonStyle(.borderedProminent)
    }
}
