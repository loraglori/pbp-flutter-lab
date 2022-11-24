// To parse this JSON data, do
//
//     final mywatchlist = mywatchlistFromJson(jsonString);

import 'dart:convert';

List<Mywatchlist> mywatchlistFromJson(String str) => List<Mywatchlist>.from(json.decode(str).map((x) => Mywatchlist.fromJson(x)));

String mywatchlistToJson(List<Mywatchlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mywatchlist {
    Mywatchlist({
        required this.pk,
        required this.watched,
        required this.title,
        required this.rating,
        required this.releaseDate,
        required this.review,
    });

    int pk;
    bool watched;
    String title;
    double rating;
    String releaseDate;
    String review;

    factory Mywatchlist.fromJson(Map<String, dynamic> json) => Mywatchlist(
        pk: json["pk"],
        watched: json["watched"],
        title: json["title"],
        rating: json["rating"].toDouble(),
        releaseDate: json["release_date"],
        review: json["review"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "watched": watched,
        "title": title,
        "rating": rating,
        "release_date": releaseDate,
        "review": review,
    };
}
