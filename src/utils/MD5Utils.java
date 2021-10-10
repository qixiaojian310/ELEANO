package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class MD5Utils {

    public static String getPwd(String pwd) {
        try {
            MessageDigest digest = MessageDigest.getInstance("md5");

            byte[] bs = digest.digest(pwd.getBytes());
            String hexString = "";
            for (byte b : bs) {
                // First Step：Translate each bytes into positive
                int temp = b & 255;
                // Second Step: Translate each data into hex.
                // Intention：when temp>=0&&<16，then using Integer.toHexString() may cause lack of bit.
                if (temp < 16 && temp >= 0) {
                    // 手动补上一个“0”
                    hexString = hexString + "0" + Integer.toHexString(temp);
                } else {
                    hexString = hexString + Integer.toHexString(temp);
                }
            }
            return hexString;
        } catch (NoSuchAlgorithmException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return "";
    }

    /**
     * @param args
     */
    public static void main(String[] args) {
        String pwd = MD5Utils.getPwd("");
        System.out.println(pwd);
    }

}
