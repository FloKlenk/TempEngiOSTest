//
//
//import SwiftUI
//import Charts
//
//struct AlterTest: View {
//    let selectionOptions = ["Maximum", "Minimum", "Zweite Zahl"]
//    @State private var selection = 0 // Default-Selection ist Maximum.
//    @State private var dataset1 = [1, 2, 3, 4, 5]
//    @State private var dataset2 = [1, 2, 3, 4, 5]
//    @State private var sensor1_x = [27, 23, 9, 19, 24]
//    @State private var sensor1_y = [45, 22, 5, 12, 43]
//    @State private var sensor1_z = [32, 1, 41, 17, 48]
//    @State private var sensor2_x = [19, 11, 17, 8, 40]
//    @State private var sensor2_y = [14, 16, 19, 49, 42]
//    @State private var sensor2_z = [46, 11, 16, 42, 47]
//    @State private var original_dataset = [1, 2, 3, 4, 5]
//    @State private var selectedOperation = 0
//    @State public var average = 0.0
//    @State private var result = ""
//    @State private var selectedData1 = 0
//    @State private var selectedData2 = 0
//    @State var showGraphs = false
//
//    var body: some View {
//        VStack {
//            Group{
//                Text("2 Sensoren")
//                    .font(.title)
//                Text("Operationen")
//                    .font(.title)
//            }
//
//            Group{
//                Picker(selection: $selectedData1, label: Text("Daten auswählen")) {
//                    Text("sensor1_x").tag(0)
//                    Text("sensor1_y").tag(1)
//                    Text("sensor1_z").tag(2)
//                    Text("sensor2_x").tag(3)
//                    Text("sensor2_y").tag(4)
//                    Text("sensor2_z").tag(5)
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .padding(.horizontal, 20)
//
//                Button(action: {
//                    switch selectedData1 {
//                    case 0:
//                        // Verwenden Sie sensor1_x-Daten
//                        dataset1 = sensor1_x
//                    case 1:
//                        // Verwenden Sie sensor1_y-Daten
//                        dataset1 = sensor1_y
//                    case 2:
//                        // Verwenden Sie sensor1_z-Daten
//                        dataset1 = sensor1_z
//                    case 3:
//                        // Verwenden Sie sensor2_x-Daten
//                        dataset1 = sensor2_x
//                    case 4:
//                        // Verwenden Sie sensor2_y-Daten
//                        dataset1 = sensor2_y
//                    case 5:
//                        // Verwenden Sie sensor2_z-Daten
//                        dataset1 = sensor2_z
//                    default:
//                        break
//                    }
//                }) {
//                    Text("Daten anzeigen")
//                }
//
//                Picker(selection: $selectedData2, label: Text("Daten auswählen")) {
//                    Text("sensor1_x").tag(0)
//                    Text("sensor1_y").tag(1)
//                    Text("sensor1_z").tag(2)
//                    Text("sensor2_x").tag(3)
//                    Text("sensor2_y").tag(4)
//                    Text("sensor2_z").tag(5)
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .padding(.horizontal, 20)
//
//                Button(action: {
//                    switch selectedData2 {
//                    case 0:
//                        // Verwenden Sie sensor1_x-Daten
//                        dataset2 = sensor1_x
//                    case 1:
//                        // Verwenden Sie sensor1_y-Daten
//                        dataset2 = sensor1_y
//                    case 2:
//                        // Verwenden Sie sensor1_z-Daten
//                        dataset2 = sensor1_z
//                    case 3:
//                        // Verwenden Sie sensor2_x-Daten
//                        dataset2 = sensor2_x
//                    case 4:
//                        // Verwenden Sie sensor2_y-Daten
//                        dataset2 = sensor2_y
//                    case 5:
//                        // Verwenden Sie sensor2_z-Daten
//                        dataset2 = sensor2_z
//                    default:
//                        break
//                    }
//                }) {
//                    Text("Daten anzeigen")
//                }
//
//                Text(result)
//                    .padding(.top, 20)
//
//                Text("Die Daten von dataset1 sind: \(dataset1.map(String.init).joined(separator: ", "))")
//                Text("Die Daten von dataset2 sind: \(dataset2.map(String.init).joined(separator: ", "))")
//            }
//
//            Picker(selection: $selectedOperation, label: Text("Operationen")) {
//                Text("Addiere dataset1 und dataset2").tag(0)
//                Text("Durchschnitt berechnen").tag(1)
//                Text("Daten integrieren").tag(2)
//                Text("Original-Datensatz").tag(3)
//            }
//            .pickerStyle(SegmentedPickerStyle())
//            .padding(.horizontal, 20)
//
//            Button(action: {
//                switch selectedOperation {
//                case 0:
//                    let sum = zip(dataset1, dataset2).map(+)
//                    result = "Ergebnis der Addition: \(sum.map(String.init).joined(separator: ", "))"
//                case 1:
//                    average = Operations.calculateAverage(dataset1)
//                    result = "Durchschnitt: \(average)"
//                case 2:
//                    dataset1 = Operations.integrateData(dataset1)
//                case 3:
//                    dataset1 = Operations.resetToOriginalData(original_dataset)
//                default:
//                    break
//                }
//            }) {
//                Text("Berechnen")
//            }
//
//            Text("Die Markierung ist bei: \(selection == 0 ? dataset1.max() ?? 0 : dataset1.min() ?? 0)")
//
//            Picker(selection: $selection, label: Text("Markierung auswählen")) {
//                ForEach(0..<selectionOptions.count) { index in
//                    Text(selectionOptions[index]).tag(index)
//                }
//            }
//            .pickerStyle(SegmentedPickerStyle())
//
//            Group {
//                Button("Graph anzeigen") {
//                    // Beim Klicken auf den Button wird der Graph und das markierte Maximum/Minimum in einem anderen View angezeigt.
//                    let graphView = GraphView(data1: dataset1, data2: dataset2, selection: selection, average: average)
//                    let hostingController = UIHostingController(rootView: graphView)
//                    UIApplication.shared.windows.first?.rootViewController?.present(hostingController, animated: true)
//                }
//            }
//        }
//    }
//}
//
//struct GraphViewContainer: View {
//    let dataPoints1: [Int] = [0, 30, 60, 40, 70, 50, 100]
//    let dataPoints2: [Int] = [50, 80, 20, 90, 30, 70, 40]
//
//    var body: some View {
//        VStack {
//            GraphView(data1: dataPoints1, data2: dataPoints2, selection: 0, average: 20)
//        }
//    }
//}
//
//struct GraphView: View {
//    let data1: [Int]
//    let data2: [Int]
//    let selection: Int
//    let average: Double
//
//    var body: some View {
//        VStack {
//            Text("Graph")
//            Text("Durchschnitt: \(average)")
//            LineChartView(data1: data1, data2: data2, selection: selection, average: average)
//                .frame(height: 300)
//            HStack {
//                Text("Sekunden")
//                    .font(.footnote)
//                Spacer()
//                Text("m/s")
//                    .font(.footnote)
//            }
//            .padding(.horizontal)
//        }
//    }
//}
//
//struct LineChartView: View {
//    let data1: [Int]
//    let data2: [Int]
//    let selection: Int
//    let average: Double
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                Path { path in
//                    let xStep = geometry.size.width / CGFloat(data1.count - 1)
//                    let yStep = geometry.size.height / CGFloat((data1 + data2).max() ?? 1)
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    for (index, value) in (data1 + data2).enumerated() {
//                        path.addLine(to: CGPoint(x: CGFloat(index) * xStep, y: geometry.size.height - CGFloat(value) * yStep))
//                    }
//                }
//                .stroke(Color.blue, lineWidth: 2)
//                .overlay(circleOverlay(for: geometry))
//
//                VStack {
//                    ForEach(0..<6) { index in
//                        HStack {
//                            Spacer()
//                                .font(.footnote)
//                        }
//                        .frame(height: geometry.size.height / 6)
//                    }
//                }
//                VStack {
//                    HStack {
//                        Spacer()
//                        Text("0")
//                            .font(.footnote)
//                    }
//                    Spacer()
//                }
//            }
//            .padding(.horizontal)
//        }
//    }
//
//    private func circleOverlay(for geometry: GeometryProxy) -> some View {
//        let maxOrMinValue = selection == 0 ? (data1 + data2).max() ?? 0 : (data1 + data2).min() ?? 0
//        let xPosition = CGFloat((data1 + data2).firstIndex(of: maxOrMinValue) ?? 0) * geometry.size.width / CGFloat((data1 + data2).count - 1)
//        let yPosition = geometry.size.height - CGFloat(maxOrMinValue) * geometry.size.height / CGFloat((data1 + data2).max() ?? 1)
//
//        return Circle()
//            .fill(Color.red)
//            .frame(width: 10, height: 10)
//            .position(CGPoint(x: xPosition, y: yPosition))
//    }
//}
//
//struct Operations {
//    static func multiplyByTwo(_ data: [Int]) -> [Int] {
//        return data.map { $0 * 2 }
//    }
//
//    static func calculateAverage(_ data: [Int]) -> Double {
//        let sum = data.reduce(0, +)
//        return Double(sum) / Double(data.count)
//    }
//
//    static func integrateData(_ data: [Int]) -> [Int] {
//        var integratedData = [Int]()
//        var sum = 0
//        for value in data {
//            sum += value
//            integratedData.append(sum)
//        }
//        return integratedData
//    }
//
//    static func resetToOriginalData(_ data: [Int]) -> [Int] {
//        return data
//    }
//}
//
//struct AlterTest_Previews: PreviewProvider {
//    static var previews: some View {
//        AlterTest()
//    }
//}
