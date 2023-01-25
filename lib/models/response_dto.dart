class ResponseDTO {
  bool? status;
  String? message;
  ResponseDTO({this.status, this.message});
  Map toJson() => {"status": status, "message": message};

  factory ResponseDTO.fromJson(Map json) => ResponseDTO(status: json["status"], message: json["message"]);
}