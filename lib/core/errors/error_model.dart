class ErrorModel {
 List<String>? non_field_errors;

 ErrorModel({this.non_field_errors});

 factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      non_field_errors: List<String>.from(json['non_field_errors'] ?? []),
    );
 }
} 