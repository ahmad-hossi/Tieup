class PortfolioParams {
  final List<Map<String, dynamic>> userPortfolio;
  Map<String, dynamic> requestBody = {'portfolioes': []};

  PortfolioParams(this.userPortfolio);

  Map<String, dynamic> toJson() {
    for (var e in userPortfolio) {
      requestBody['portfolioes'].add({'type': e['type'], 'url': e['url']});
    }
    return requestBody;
  }
}
