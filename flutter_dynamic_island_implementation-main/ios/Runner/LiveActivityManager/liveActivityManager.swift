import ActivityKit
import Flutter
import Foundation

class LiveActivityManager {

  private var stopwatchActivity: Activity<StopwatchDIWidgetAttributes>? = nil

  func startLiveActivity(data: [String: Any]?, result: FlutterResult) {
    let attributes = StopwatchDIWidgetAttributes()
    

    if let info = data as? [String: Any] {
      let state = StopwatchDIWidgetAttributes.ContentState(
        homeScores: info["homeScores"] as? String ?? "",
        guestScores: info["guestScores"] as? String ?? "",
        homeImageURL: info["homeImageURL"] as? String ?? "",
        guestImageURL: info["guestImageURL"] as? String ?? "",
        homeImageURL_Small: info["homeImageURL_Small"] as? String ?? "",
        guestImageURL_Small: info["guestImageURL_Small"] as? String ?? "",
        matchTitle: info["matchTitle"] as? String ?? "",
        matchSubText: info["matchSubText"] as? String ?? "",
        leadingURL: info["leadingURL"] as? String ?? ""
      )
      stopwatchActivity = try? Activity<StopwatchDIWidgetAttributes>.request(
        attributes: attributes, contentState: state, pushType: nil)
    } else {
      result(FlutterError(code: "418", message: "Live activity didn't invoked", details: nil))
    }
  }

func updateLiveActivity(data: [String: Any]?, result: FlutterResult) {
  if let info = data as? [String: Any] {
    let updatedState = StopwatchDIWidgetAttributes.ContentState(
      homeScores: info["homeScores"] as? String ?? "",
        guestScores: info["guestScores"] as? String ?? "",
        homeImageURL: info["homeImageURL"] as? String ?? "",
        guestImageURL: info["guestImageURL"] as? String ?? "",
        homeImageURL_Small: info["homeImageURL_Small"] as? String ?? "",
        guestImageURL_Small: info["guestImageURL_Small"] as? String ?? "",
        matchTitle: info["matchTitle"] as? String ?? "",
        matchSubText: info["matchSubText"] as? String ?? "",
        leadingURL: info["leadingURL"] as? String ?? ""
    )

    Task {
      await stopwatchActivity?.update(using: updatedState)
    }
  } else {
    result(FlutterError(code: "418", message: "Live activity didn't updated", details: nil))
  }
}

func stopLiveActivity(result: FlutterResult) {
  do {
    Task {
      await stopwatchActivity?.end(using: nil, dismissalPolicy: .immediate)
    }
  } catch {
    result(FlutterError(code: "418", message: error.localizedDescription, details: nil))
  }
}
}
