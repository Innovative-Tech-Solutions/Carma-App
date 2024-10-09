class EndPoints {
  static String register = "/registration";
  static String login = "/login";
  static String activateUser = '/activate-user';
  static String logOut = '/logout';
  static String forgotPassword = "/forgot-password";
  static String verifyForgotPassword = '/verify-forgot-password';
  static String saveNewPassword = '/set-new-password';

  static String getUserNotification(String id) => '/get-user-notifications/$id';
  static String markNotificationAsRead(String id) => '/mark-as-read/$id';
  static String ifNewNotification(String id) => '/if-new-notification/$id';
  static String markAllNotificationsAsRead(String id) =>
      '/mark-all-as-read/$id';
  static String deleteNotification(String id) => '/delete-notification/$id';
  static String deleteAllNotifications(String id) =>
      '/delete-all-notifications/$id';
}
