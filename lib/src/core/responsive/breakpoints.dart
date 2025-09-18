class SizeClass {
final double width;
const SizeClass(this.width);
bool get isTablet => width >= 720; // tweak if you want 600/840 etc.
bool get isPhone => !isTablet;
static SizeClass from(double w) => SizeClass(w);
}