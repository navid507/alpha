class UserAccessData
{
  String token;
  String deviceID;
  UserAccessData({required this.deviceID, required this.token});

  factory UserAccessData.fromJson(Map<String, dynamic> json)
  {
    return UserAccessData(deviceID: json['device_id'], token: json['private']);
  }
}