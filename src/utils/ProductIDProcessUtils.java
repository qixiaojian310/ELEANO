package utils;

public class ProductIDProcessUtils {
    // Be able to convert pid less than 3 bits
    public static String Process(String before){
        String after;
        if (before.length()==2)
            after = "0" + before;
        else if (before.length()==1)
            after = "00"+before;
        else after = before;
        return after;
    }
}
