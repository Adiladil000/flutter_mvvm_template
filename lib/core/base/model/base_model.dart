abstract class BaseModel<T> {
  Map<String, dynamic> toJson();
  fromJson(Map<String, Object> json);
}
