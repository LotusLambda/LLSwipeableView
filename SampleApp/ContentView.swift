import SwiftUI
import LLSwipableView

struct ContentView: View {
    @State var items = "This is a very long sentence, maybe even longer then the one before".map { (char) -> String in
        "\(char)"
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(items, id: \.self) { (item) in
                    SwipableView(content: {
                        HStack {
                            Image("image")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 75)
                                .clipped()
                            
                            Text(item)
                            
                            Spacer()
                        }
                    }, actionsContent: {
                        HStack(spacing: 0) {
                            Button(action: {
                                acceptItem(item: item)
                            }, label: {
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.white)
                                    .padding(20)
                                    .background(Color.purple)
                            })
                            
                            Button(action: {
                                removeItem(item: item)
                            }, label: {
                                Image(systemName: "xmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.white)
                                    .padding(20)
                                    .background(Color.orange)
                            })
                        }
                    }, actionContentPosition: .leading)
                    .frame(height: 75)
                }
                
                Spacer()
            }
        }
    }
    
    func acceptItem(item: String) {
        withAnimation(.spring()) {
            items.append(item + "\(items.count)")
        }
    }
    
    func removeItem(item: String) {
        withAnimation(.spring()) {
            items.removeAll { (string) -> Bool in
                string == item
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
