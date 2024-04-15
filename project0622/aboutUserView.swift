import SwiftUI
import Firebase

struct UserRecord: Identifiable {
    let id: String
    let age: String
    let height: String
    let weight: String
    let timestamp: String
}

struct aboutUserView: View {
    @State private var records = [UserRecord]()
    @State private var age = ""
    @State private var height = ""
    @State private var weight = ""

    var body: some View {
        VStack {
            Text("關於使用者")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.bottom, 20)
            
            VStack(alignment: .leading) {
                Text("年齡:  \(age)")
                Text("身高:  \(height) cm")
                Text("體重:  \(weight) kg")
            }
            .font(.title)
            .padding(.horizontal)

            VStack {
                TextField("輸入你的年齡", text: $age)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                
                TextField("輸入你的身高(cm)", text: $height)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                
                TextField("輸入你的體重(kg)", text: $weight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            .padding()

            HStack {
                Button(action: {
                    let ref = Database.database().reference()
                    let now = Date()
                    let formatter = DateFormatter()
                    formatter.timeZone = TimeZone.current
                    formatter.dateFormat = "yyyy-MM-dd HH:mm"
                    let timestamp = formatter.string(from: now)

                    ref.child("UserInfo").childByAutoId().setValue(["age": self.age, "height": self.height, "weight": self.weight, "timestamp": timestamp]) { (error, _) in
                        if let error = error {
                            print("數據儲存失敗：", error)
                        } else {
                            print("數據已經成功儲存。")
                        }
                    }
                }) {
                    Text("儲存")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    let ref = Database.database().reference().child("UserInfo")
                    self.records.removeAll()
                    ref.removeValue { error, _ in
                        if let error = error {
                            print("刪除失敗：", error)
                        } else {
                            print("數據已經成功清除。")
                        }
                    }
                }) {
                    Text("清除")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }

            List(records) { record in
                VStack(alignment: .leading) {
                    Text("時間: \(record.timestamp)")
                    Text("年齡: \(record.age)")
                    Text("身高: \(record.height) cm")
                    Text("體重: \(record.weight) kg")
                }
            }.onAppear {
                let ref = Database.database().reference().child("UserInfo")

                ref.observe(.childAdded, with: { (snapshot) in
                    if let data = snapshot.value as? [String: String],
                        let age = data["age"],
                        let height = data["height"],
                        let weight = data["weight"],
                        let timestamp = data["timestamp"] {
                            self.records.append(UserRecord(id: snapshot.key, age: age, height: height, weight: weight, timestamp: timestamp))
                    }
                })
            }

            Spacer()
        }
    }
}

struct aboutUserView_Previews: PreviewProvider {
    static var previews: some View {
        aboutUserView()
    }
}
