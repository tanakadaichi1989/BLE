//
//  ContentView.swift
//  BLE
//
//  Created by 田中大地 on 2022/11/21.
//

import SwiftUI
import CoreBluetooth

struct ContentView: View {
    @EnvironmentObject var manager: DeviceManager
    
    var body: some View {
        VStack {
            NavigationView {
                List(manager.devices,id:\.self){ device in
                    NavigationLink {
                        DeviceDetailView(device: device)
                    } label: {
                        DeviceListView(device: device)
                    }
                }
                .navigationTitle(Text("Peripherals"))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
