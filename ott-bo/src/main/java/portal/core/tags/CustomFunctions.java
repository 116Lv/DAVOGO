package portal.core.tags;

public class CustomFunctions {

    public static String shorten(String input, int len) {
        if (input == null) return "";
        if (input.length() > len) {
        	return input.substring(0, len) + "...";
        }
        return input.trim();
    }    

}
