import SwiftUI

public struct SwipeableView<Content: View, ActionsContent: View>: View {
    let content: () -> Content
    let actionsContent: () -> ActionsContent
    
    @State var contentOffset: Double = 0
    @State var actionsContentSize: Double = 0
    @State var areActionsVisible = false
    var actionContentPosition: ActionContentPosition = .trailing
    var animation: Animation = .spring()

    public init(@ViewBuilder content: @escaping () -> Content, @ViewBuilder actionsContent: @escaping () -> ActionsContent, actionContentPosition: ActionContentPosition = .trailing, animation: Animation = .spring()) {
        self.content = content
        self.actionsContent = actionsContent
        self.actionContentPosition = actionContentPosition
        self.animation = animation
    }

    public var body: some View {
        GeometryReader(content: { proxy in
            ZStack {
                content()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .offset(CGSize(width: contentOffset, height: 0))
                    .disabled(abs(contentOffset) > 0)
                
                HStack {
                    if actionContentPosition == .trailing {
                        Spacer()
                    }
                    
                    actionsContent()
                        .background(
                            GeometryReader { geometryProxy in
                                Color.clear
                                    .preference(key: OffsetPreferenceKey.self, value: geometryProxy.size.width)
                            }
                        )
                        .onPreferenceChange(OffsetPreferenceKey.self, perform: { value in
                            actionsContentSize = Double(value)
                        })
                        .offset(x: _offset(), y: 0)
                    
                    if actionContentPosition == .leading {
                        Spacer()
                    }
                }
            }
            .animation(animation)
            .simultaneousGesture(
                DragGesture(minimumDistance: 1, coordinateSpace: CoordinateSpace.local)
                    .onChanged({ (value) in
                        let offset = Double(value.translation.width)
                        if offset > 0 && abs(offset) <= actionsContentSize
                           {
                            self.contentOffset = 0
                            return
                        }
                        
                        if offset < 0 && abs(offset) <= actionsContentSize {
                            self.contentOffset = 0
                            return
                        }
                        
                        self.contentOffset = Double(value.translation.width)
                    })
                    .onEnded({ (value) in
                        if !areActionsVisible {
                            switch actionContentPosition {
                            case .leading:
                                if abs(self.contentOffset) > self.actionsContentSize * 0.66 {
                                    self.contentOffset = self.actionsContentSize
                                    self.areActionsVisible = true
                                } else {
                                    self.contentOffset = .zero
                                    self.areActionsVisible = false
                                }
                            case .trailing:
                                if abs(self.contentOffset) > self.actionsContentSize {
                                    self.contentOffset = -self.actionsContentSize
                                    self.areActionsVisible = true
                                } else {
                                    self.contentOffset = .zero
                                    self.areActionsVisible = false
                                }
                            }
                            
                        } else {
                            switch actionContentPosition {
                            case .leading:
                                if abs(self.contentOffset) > self.actionsContentSize {
                                    self.contentOffset = self.actionsContentSize
                                    self.areActionsVisible = true
                                } else {
                                    self.contentOffset = .zero
                                    self.areActionsVisible = false
                                }
                            case .trailing:
                                print(abs(self.contentOffset), self.actionsContentSize)
                                if self.contentOffset < self.actionsContentSize {
                                    self.contentOffset = -self.actionsContentSize
                                    self.areActionsVisible = true
                                } else {
                                    self.contentOffset = .zero
                                    self.areActionsVisible = false
                                }
                            }
                        }
                    })
                )
        })
    }
    
    private func _offset() -> CGFloat {
        switch actionContentPosition {
        case .leading:
            return -CGFloat(actionsContentSize) + CGFloat(contentOffset)
        case .trailing:
            return CGFloat(contentOffset) + CGFloat(actionsContentSize)
        }
    }
}

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}
