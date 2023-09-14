class URL {
  URL._();
  static const _baseURL = "https://craftybay.teamrabbil.com/api";
  static const categoryGetURL = "$_baseURL/CategoryList";
  static const brandURL = "$_baseURL/BrandList";
  static const loginGetURL = "$_baseURL/UserLogin/";
  static const verifyLoginGetURL = "$_baseURL/VerifyLogin/";
  static const signUpPostURL = "$_baseURL/CreateProfile";
  static const readProfileGetURL = "$_baseURL/ReadProfile";
  static const productReviewGetURL = "$_baseURL/CreateProductReview";
  static const productSliderGetURL = "$_baseURL/ListProductSlider";
  static const productWishListGetURL = "$_baseURL/ProductWishList";
  static const productCartListGetURL = "$_baseURL/CartList";
}
