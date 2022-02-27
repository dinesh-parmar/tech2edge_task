class Url {
  Url._();

  static const baseUrl = "https://demo.tech2edge.co/samples/";

  static String getImageUrl(String path) => baseUrl + path;
}
