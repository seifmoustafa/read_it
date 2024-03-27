import 'package:equatable/equatable.dart';

import 'list_price.dart';
import 'retail_price.dart';

class Offer extends Equatable {
	final int? finskyOfferType;
	final ListPrice? listPrice;
	final RetailPrice? retailPrice;

	const Offer({this.finskyOfferType, this.listPrice, this.retailPrice});

	factory Offer.fromJson(Map<String, dynamic> json) => Offer(
				finskyOfferType: json['finskyOfferType'] as int?,
				listPrice: json['listPrice'] == null
						? null
						: ListPrice.fromJson(json['listPrice'] as Map<String, dynamic>),
				retailPrice: json['retailPrice'] == null
						? null
						: RetailPrice.fromJson(json['retailPrice'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'finskyOfferType': finskyOfferType,
				'listPrice': listPrice?.toJson(),
				'retailPrice': retailPrice?.toJson(),
			};

	@override
	List<Object?> get props => [finskyOfferType, listPrice, retailPrice];
}
