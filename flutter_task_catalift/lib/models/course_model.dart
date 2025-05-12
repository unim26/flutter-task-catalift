class CourseModel {
  final String courseName;
  final double rating;
  final int enrolledUser;
  final int coursePrice;
  final String coverImage;
  final String courseDetail;

  //constructure
  CourseModel({
    required this.courseDetail,
    required this.courseName,
    required this.coverImage,
    required this.coursePrice,
    required this.enrolledUser,
    required this.rating,
  });

  //cpoy with
  CourseModel copyWith(
    String? courseName,
    double? rating,
    int? enrolledUser,
    int? coursePrice,
    String? courseDetail,
    String? coverImage,
  ) => CourseModel(
    courseDetail: courseDetail ?? this.courseDetail,
    courseName: courseName ?? this.courseName,
    coverImage: coverImage ?? this.coverImage,
    coursePrice: coursePrice ?? this.coursePrice,
    enrolledUser: enrolledUser ?? this.enrolledUser,
    rating: rating ?? this.rating,
  );

  //to json
  Map<String, dynamic> toJson() => {
    'coursedetail': courseDetail,
    'courseName': courseName,
    'coursePrice': coursePrice,
    'coverImage':coverImage,
    'enrolledUser': enrolledUser,
    'rating': rating,
  };

  //from json
  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
    courseDetail: json['coursedetail'],
    courseName: json['courseName'],
    coursePrice: json['coursePrice'],
    coverImage: json['coverimage'],
    enrolledUser: json['enrolledUser'],
    rating: json['rating'],
  );
}
