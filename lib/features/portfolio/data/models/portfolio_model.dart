import 'package:tieup/features/portfolio/domain/entities/portfolio.dart';

class PortfolioModel extends Portfolio{
  String type;
  String url;

  PortfolioModel({ required this.type, required this.url}) :
        super(url: url,type: type);

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel( type: json['type'], url: json['url']);
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'url': url,
      };
}
