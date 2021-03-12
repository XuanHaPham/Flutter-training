class RegexUtils {
  static final emailRegex = RegExp(
      r"^[^\s@]+@[^\s@]+\.[^\s@]+$");

  static final passwordRegex = RegExp(r"^.{6,}$");
}
