import SwiftUI

struct MeasureView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.displayScale) var displayScale

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                let frame = geometry.frame(in: .global)
                Text(frame.size.debugDescription)
                    .frame(
                        width: frame.size.width,
                        height: frame.size.height
                    )
            }
            .foregroundColor(Color.red)
            .border(Color.red, width: 2)
            .ignoresSafeArea()

            GeometryReader { geometry in
                let frame = geometry.frame(in: .global)
                ZStack {
                    Text(geometry.safeAreaInsets.top.description)
                        .frame(
                            width: geometry.frame(in: .global).size.width,
                            height: frame.size.height,
                            alignment: .top
                        )

                    Text(geometry.safeAreaInsets.bottom.description)
                        .frame(
                            width: geometry.frame(in: .global).size.width,
                            height: frame.size.height,
                            alignment: .bottom
                        )

                    Text(geometry.safeAreaInsets.leading.description)
                        .frame(
                            width: geometry.frame(in: .global).size.width,
                            height: frame.size.height,
                            alignment: .leading
                        )

                    Text(geometry.safeAreaInsets.trailing.description)
                        .frame(
                            width: geometry.frame(in: .global).size.width,
                            height: frame.size.height,
                            alignment: .trailing
                        )

                    VStack {
                        if let horizontalSizeClass {
                            Text("H: " + String(describing: horizontalSizeClass))
                        }
                        if let verticalSizeClass {
                            Text("V: " + String(describing: verticalSizeClass))
                        }
                        Text("Scale: " + displayScale.description)
                    }
                    .frame(
                        width: geometry.frame(in: .global).size.width,
                        height: frame.size.height / 2,
                        alignment: .bottom
                    )
                    .foregroundColor(Color.primary)
                }
            }
            .foregroundColor(Color.green)
            .border(Color.green)
        }
    }
}

struct MeasureView_Previews: PreviewProvider {
    static var previews: some View {
        let devices = ["iPhone 14 Pro", "iPhone 14 Pro Max", "iPhone SE (2nd generation)"]
        ForEach(devices, id: \.self) { device in
            ForEach([true, false], id: \.self) { isPortrait in
                MeasureView()
                    .previewDisplayName("\(device) (\(isPortrait ? "portrait" : "landscape")")
                    .previewDevice(PreviewDevice(rawValue: device))
                    .previewInterfaceOrientation(isPortrait ? .portrait : .landscapeRight)
            }
        }
    }
}
