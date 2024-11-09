class DynamicIslandDataModel {
  final String homeScores;
  final String guestScores;
  final String homeImageURL;
  final String guestImageURL;
  final String homeImageURL_Small;
  final String guestImageURL_Small;
  final String matchTitle;
  final String matchSubText;
  final String leadingURL;

  DynamicIslandDataModel({
    required this.homeScores,
    required this.guestScores,    
    required this.homeImageURL,
    required this.guestImageURL,
    required this.homeImageURL_Small,
    required this.guestImageURL_Small,
    required this.matchTitle,
    required this.matchSubText,
    required this.leadingURL,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{ 
      'homeScores': homeScores,
      'guestScores': guestScores,     
      'homeImageURL': homeImageURL,
      'guestImageURL': guestImageURL,
      'homeImageURL_Small': homeImageURL_Small,
      'guestImageURL_Small': guestImageURL_Small,
      'matchTitle': matchTitle,
      'matchSubText': matchSubText,
      'leadingURL': leadingURL,
    };
  }
}