import SwiftUI
import FirebaseDatabaseInternal
import CoreBluetooth
import SwiftUICharts

class BluetoothManagerr: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    weak var delegate: BluetoothManagerDelegate?
    var centralManager: CBCentralManager!
    var peripheral: CBPeripheral?
    let EMGServiceUUID = CBUUID(string: "FFE0")
    let EMGCharacteristicUUID = CBUUID(string: "FFE1")
    var EMGCharacteristic: CBCharacteristic?
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            centralManager.scanForPeripherals(withServices: [EMGServiceUUID], options: nil)
        default:
            print("藍牙不可用。")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        self.peripheral = peripheral
        centralManager.connect(peripheral, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.delegate = self
        peripheral.discoverServices([EMGServiceUUID])
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let services = peripheral.services {
            for service in services {
                if service.uuid == EMGServiceUUID {
                    peripheral.discoverCharacteristics([EMGCharacteristicUUID], for: service)
                }
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                print("Characteristic UUID: \(characteristic.uuid)")
                print("Service UUID: \(service.uuid)")
                if characteristic.uuid == EMGCharacteristicUUID {
                    EMGCharacteristic = characteristic
                    peripheral.setNotifyValue(true, for: characteristic)
                }
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let data = characteristic.value, let emgString = String(data: data, encoding: .utf8) {
            delegate?.didReceiveEMGString(emgString)
            // 將收到的 EMG 值寫入 Firebase
            let ref = Database.database().reference()
            ref.child("emgValues").childByAutoId().setValue(emgString)
        }
    }
}

protocol BluetoothManagerDelegate: AnyObject {
    func didReceiveEMGString(_ emgString: String)
}

class AnalysisViewModel: ObservableObject, BluetoothManagerDelegate {
    @Published var emgValues: [(timeStamp: Date, value: String)] = []
    @Published var isCapturing: Bool = false
    
    private var bluetoothManager: BluetoothManagerr
    
    init() {
        bluetoothManager = BluetoothManagerr()
        bluetoothManager.delegate = self
    }
    
    func didReceiveEMGString(_ emgString: String) {
        if isCapturing {
            DispatchQueue.main.async {
                let timeStamp = Date()
                self.emgValues.append((timeStamp, emgString))
                
                // 只保留最新的數據
                if self.emgValues.count > 100 {
                    self.emgValues.removeFirst(self.emgValues.count - 100)
                }
            }
        }
    }
    
    func startCapture() {
        emgValues = []
        isCapturing = true
    }
    
    func stopCapture() {
        isCapturing = false
    }
}


struct AnalysisView: View {
    @StateObject private var viewModel: AnalysisViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: AnalysisViewModel())
    }
    
    var body: some View {
        VStack {
            VStack {
                Button(action: {
                    viewModel.startCapture()
                }, label: {
                    Text("開始擷取 EMG 值")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                .padding()
                
                LineView(data: viewModel.emgValues.sorted(by: { $0.timeStamp < $1.timeStamp }).prefix(100).map { Double($0.value) ?? 0 },
                         title: "EMG 折線圖",
                         style: ChartStyle(backgroundColor: .white, accentColor: .blue, gradientColor: GradientColor(start: .blue, end: .white), textColor: .black, legendTextColor: .blue, dropShadowColor: .blue))
                    .frame(height: 300)
                    .padding()
                    
                Spacer()
                Text("正在擷取 EMG 值：\(viewModel.isCapturing ? "是" : "否")")
                    .font(.headline)
                    .padding()
                
                // 登出按鈕
                Button(action: {
                    // 在這裡處理登出操作
                    viewModel.stopCapture() // 停止擷取 EMG 值
                    // 其他需要處理的登出操作...
                }) {
                    Text("登出")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
            Spacer()
        }
    }
}


struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
    }
}
