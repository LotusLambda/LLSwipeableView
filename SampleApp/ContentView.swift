import SwiftUI
import SwipableView

struct ContentView: View {
    let items = [
        "Hello",
        "World"
    ]
    
    var body: some View {
        VStack {
            ForEach(items, id: \.self) { (item) in
                SwipableView(content: {
                    Button(action: {
                        print("Pressed!")
                    }, label: {
                        Text(item)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color.orange)
                    })
                }, actionsContent: {
                    HStack(spacing: 0) {
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "trash")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                                .padding(20)
                                .background(Color.purple)
                        })
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "trash")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(.white)
                                .padding(20)
                                .background(Color.orange)
                        })
                    }
                }, actionContentPosition: .leading)
                .frame(height: 70)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
