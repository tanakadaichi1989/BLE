//
//  BLEApp.swift
//  BLE
//
//  Created by 田中大地 on 2022/11/21.
//

import SwiftUI
import CoreBluetooth

@main
struct BLEApp: App {
    @StateObject var viewModel: DeviceManager = DeviceManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
