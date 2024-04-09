//
//  ledControl.swift
//  go
//
//  Created by e530 on 2023/5/10.
//

import SwiftUI
import CoreBluetooth

struct ledControl: View {
    @State private var isButton1On = false
    @State private var isButton2On = false
    @State private var isButton3On = false
    
    @State private var receivedData: String = ""
    @State private var updateCounter = 0 // 增加計數器屬性以強制重新渲染
    @Environment(\.presentationMode) var mode
    @State private var showAlert = false
    @State private var alertTitle = ""
    @State private var onOff = false
    @State private var isButtonOn = false
    @State private var currentGear = "0檔"
    
    @State private var buttonState: ButtonState = .start

    enum ButtonState {
        case start
        case stop
        case pause

        var buttonText: String {
            switch self {
            case .start: return "提拉按摩"
            case .stop: return "腿部舒緩"
            case .pause: return "揉捏放鬆"
            }
        }
    }

    // 定義藍芽連接物件
    var bluetoothManager = BluetoothManager()
    
    struct CustomButtonStyle: ButtonStyle {
        var foregroundColor: Color
        var backgroundColor: Color
        var cornerRadius: CGFloat
        
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(foregroundColor)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(backgroundColor)
                        .shadow(color: .gray, radius: 3, x: 0, y: 2)
                )
                .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
        }
    }

    func updateButtonState() {
            switch buttonState {
            case .start:
                buttonState = .stop
            case .stop:
                buttonState = .pause
            case .pause:
                buttonState = .start
            }
        }
    var body: some View {
        ScrollView {
            Button(action: {
                isButtonOn.toggle()
                bluetoothManager.toggleLED()
            }) {
                HStack(spacing: 10) {
                    Image("start")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("開 / 關")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        HStack {
                            Text("開")
                                .font(.subheadline)
                                .foregroundColor(isButtonOn ? .black : .gray)
                            Spacer()
                            Text("/")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Text("關")
                                .font(.subheadline)
                                .foregroundColor(isButtonOn ? .gray : .black)
                        }
                        .padding(5)
                        .background(isButtonOn ? Color.green : Color.red)
                        .cornerRadius(10)
                    }
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(Color(hex: "008080"))
                .foregroundColor(.white)
                .shadow(color: Color(hex: "00ffff").opacity(0.5), radius: 20, x: 0, y: 10)
                .cornerRadius(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: .gray, radius: 3, x: 0, y: 2)
                )
                .foregroundColor(isButtonOn ? .white : .black)
            }

            Spacer()

            Button(action: {
                isButton1On.toggle()
                bluetoothManager.toggleLED1()
            }) {
                HStack(spacing: 10) {
                    Image("start")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("開 / 關")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        HStack {
                            Text("開")
                                .font(.subheadline)
                                .foregroundColor(isButton1On ? .black : .gray)
                            Spacer()
                            Text("/")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Text("關")
                                .font(.subheadline)
                                .foregroundColor(isButton1On ? .gray : .black)
                        }
                        .padding(5)
                        .background(isButton1On ? Color.green : Color.red)
                        .cornerRadius(10)
                    }
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(Color(hex: "008080"))
                .foregroundColor(.white)
                .shadow(color: Color(hex: "00ffff").opacity(0.5), radius: 20, x: 0, y: 10)
                .cornerRadius(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: .gray, radius: 3, x: 0, y: 2)
                )
                .foregroundColor(isButton1On ? .white : .black)
            }

            
            Button(action: {
                isButton2On.toggle()
                bluetoothManager.toggleLED2()
            }) {
                HStack(spacing: 10) {
                    Image("start")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("開 / 關")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        HStack {
                            Text("開")
                                .font(.subheadline)
                                .foregroundColor(isButton2On ? .black : .gray)
                            Spacer()
                            Text("/")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Text("關")
                                .font(.subheadline)
                                .foregroundColor(isButton2On ? .gray : .black)
                        }
                        .padding(5)
                        .background(isButton2On ? Color.green : Color.red)
                        .cornerRadius(10)
                    }
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(Color(hex: "008080"))
                .foregroundColor(.white)
                .shadow(color: Color(hex: "00ffff").opacity(0.5), radius: 20, x: 0, y: 10)
                .cornerRadius(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: .gray, radius: 3, x: 0, y: 2)
                )
                .foregroundColor(isButton2On ? .white : .black)
            }

            Button(action: {
                isButton3On.toggle()
                bluetoothManager.toggleLED3()
            }) {
                HStack(spacing: 10) {
                    Image("start")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading, spacing: 5) {
                        Text("開 / 關")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        HStack {
                            Text("開")
                                .font(.subheadline)
                                .foregroundColor(isButton3On ? .black : .gray)
                            Spacer()
                            Text("/")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Text("關")
                                .font(.subheadline)
                                .foregroundColor(isButton3On ? .gray : .black)
                        }
                        .padding(5)
                        .background(isButton3On ? Color.green : Color.red)
                        .cornerRadius(10)
                    }
                }
                .padding(20)
                .frame(maxWidth: .infinity)
                .background(Color(hex: "008080"))
                .foregroundColor(.white)
                .shadow(color: Color(hex: "00ffff").opacity(0.5), radius: 20, x: 0, y: 10)
                .cornerRadius(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .shadow(color: .gray, radius: 3, x: 0, y: 2)
                )
                .foregroundColor(isButton3On ? .white : .black)
            }
            
            VStack(spacing: 20) {
                Spacer()
                Spacer()
                
                Text("目前檔位: \(currentGear)")
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "008080"))
                    .foregroundColor(.white)
                    .shadow(color: Color(hex: "00ffff").opacity(0.5), radius: 20, x: 0, y: 10)
                    .cornerRadius(10)
                    .foregroundColor(.black)
            }


        }
        .padding(30)
        .navigationTitle("產品功能")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.mode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left")
            Text("按摩槍介紹")
                .foregroundColor(.blue)
        }))
    }
}
        
        // 定義藍芽連接物件
class BluetoothManager: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    var currentGear: Int = 0
    // 定義藍芽相關屬性
    var centralManager: CBCentralManager!
    var peripheral: CBPeripheral!
    let LEDServiceUUID = CBUUID(string: "FFE0")
    let LEDCharacteristicUUID = CBUUID(string: "FFE1")
    var LEDCharacteristic: CBCharacteristic?
    var isLEDon = false
    var isFlashing = false
    var timer: Timer?
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            // 藍芽已開啟，掃描可用設備
            centralManager.scanForPeripherals(withServices: [LEDServiceUUID], options: nil)
        default:
            print("Bluetooth is not available.")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        // 找到HC-05模組，開始連接
        self.peripheral = peripheral
        centralManager.connect(peripheral, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        // 連接成功，設置藍芽相關屬性
        peripheral.delegate = self
        peripheral.discoverServices([LEDServiceUUID])
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        // 找到LED Service，開始搜尋LED Characteristic
        if let services = peripheral.services {
            for service in services {
                if service.uuid == LEDServiceUUID {
                    peripheral.discoverCharacteristics([LEDCharacteristicUUID], for: service)
                }
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        // 找到LED Characteristic，準備發送控制指令
        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                if characteristic.uuid == LEDCharacteristicUUID {
                    LEDCharacteristic = characteristic
                }
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let data = characteristic.value {
            // 將接收到的資料轉換為字串
            let message = String(data: data, encoding: .utf8)
            
            // 將接收到的資料轉換為整數陣列
            let bytes = [UInt8](data)
            
            // 在控制台上印出接收到的資料
            print("Received message: \(message ?? "")")
            print("Received bytes: \(bytes)")
            
            // 將接收到的資料存儲到屬性中
            
        }
    }
    
    func toggleLED() {
        if let characteristic = LEDCharacteristic {
            if characteristic.properties.contains(.writeWithoutResponse) {
                let data = isLEDon ? "101".data(using: .utf8)! : "010".data(using: .utf8)!
                peripheral.writeValue(data, for: characteristic, type: .withoutResponse)
                isLEDon = !isLEDon
            }
        }
    }
    
    func toggleLED1() {
        if let characteristic = LEDCharacteristic {
            if characteristic.properties.contains(.writeWithoutResponse) {
                let data = isLEDon ? "232".data(using: .utf8)! : "323".data(using: .utf8)!
                peripheral.writeValue(data, for: characteristic, type: .withoutResponse)
                isLEDon = !isLEDon
            }
        }
    }
    
    func toggleLED2() {
        if let characteristic = LEDCharacteristic {
            if characteristic.properties.contains(.writeWithoutResponse) {
                let data = isLEDon ? "4545".data(using: .utf8)! : "454".data(using: .utf8)!
                peripheral.writeValue(data, for: characteristic, type: .withoutResponse)
                isLEDon = !isLEDon
            }
        }
    }
    
    func toggleLED3() {
        if let characteristic = LEDCharacteristic {
            if characteristic.properties.contains(.writeWithoutResponse) {
                let data = isLEDon ? "676".data(using: .utf8)! : "767".data(using: .utf8)!
                peripheral.writeValue(data, for: characteristic, type: .withoutResponse)
                isLEDon = !isLEDon
            }
        }
    }
}



