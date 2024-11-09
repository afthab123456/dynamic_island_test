import ActivityKit
import WidgetKit
import SwiftUI

struct StopwatchDIWidgetAttributes: ActivityAttributes {
    public typealias stopwatchStatus = ContentState
    
    public struct ContentState: Codable, Hashable {
        var homeScores: String
        var guestScores: String
        var homeImageURL: String
        var guestImageURL: String
        var homeImageURL_Small: String
        var guestImageURL_Small: String
        var matchTitle: String
        var matchSubText: String
        var leadingURL: String
    }
}

struct StopwatchDIWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: StopwatchDIWidgetAttributes.self) { context in
            VStack {
                HStack {
                    if let imageUrl = URL(string: context.state.homeImageURL),
                       let imageData = try? Data(contentsOf: imageUrl),
                       let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 70)
                            .clipShape(Circle())
                    } else {
                        Text("").foregroundColor(.black)
                    }
                    Spacer().frame(width: 20)
                    Text(context.state.homeScores)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.black)
                    Spacer()
                    Text(context.state.guestScores)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.black)
                    Spacer().frame(width: 20)
                    if let imageUrl = URL(string: context.state.guestImageURL),
                       let imageData = try? Data(contentsOf: imageUrl),
                       let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 70)
                            .clipShape(Circle())
                    } else {
                        Text("").foregroundColor(.black)
                    }
                }
                VStack {
                    Text(context.state.matchTitle)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.black)
                    Spacer().frame(width: 10)
                    Text(context.state.matchSubText)
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    HStack {
                        if let imageUrl = URL(string: context.state.homeImageURL),
                           let imageData = try? Data(contentsOf: imageUrl),
                           let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 70)
                                .clipShape(Circle())
                        } else {
                            Text("").foregroundColor(.white)
                        }
                    }
                }
                DynamicIslandExpandedRegion(.trailing) {
                    HStack {
                        if let imageUrl = URL(string: context.state.guestImageURL),
                           let imageData = try? Data(contentsOf: imageUrl),
                           let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 70)
                                .clipShape(Circle())
                        } else {
                            Text("").foregroundColor(.white)
                        }
                    }
                }
                DynamicIslandExpandedRegion(.center) {
                    HStack {
                        Text(context.state.homeScores)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                        Spacer().frame(width: 80)
                        Text(context.state.guestScores)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                DynamicIslandExpandedRegion(.bottom) {
                    VStack {
                        Text(context.state.matchTitle)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white)
                        Spacer().frame(width: 10)
                        Text(context.state.matchSubText)
                            .font(.system(size: 10, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
            } compactLeading: {
                HStack {
                    if let imageUrl = URL(string: context.state.homeImageURL_Small),
                       let imageData = try? Data(contentsOf: imageUrl),
                       let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 25)
                            .clipShape(Circle())
                    } else {
                        Text("").foregroundColor(.white)
                    }
                    Text(context.state.homeScores)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                }
            } compactTrailing: {
                HStack {
                    Text(context.state.guestScores)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                    if let imageUrl = URL(string: context.state.guestImageURL_Small),
                       let imageData = try? Data(contentsOf: imageUrl),
                       let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 25)
                            .clipShape(Circle())
                    } else {
                        Text("").foregroundColor(.white)
                    }
                }
            } minimal: {
                if let imageUrl = URL(string: context.state.leadingURL),
                   let imageData = try? Data(contentsOf: imageUrl),
                   let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 25)
                        .clipShape(Circle())
                } else {
                    Text("").foregroundColor(.white)
                }
            }
        }
    }
}
