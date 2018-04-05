package com.flaming.Utils;

/**
 * The utility of markdown.
 */
public class MarkdownUtil {

    public static String getTransferredText(String text){
        return text.replaceAll("<","&lt;");
    }

}
