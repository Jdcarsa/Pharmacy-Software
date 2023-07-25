
package Model;


public class Util {
    
    public Util(){
        
    }
    
    
    public  String capitalize(String str) {
    if (str == null || str.isEmpty()) {
        return str;
    } else {
        return str.substring(0, 1).toUpperCase() + str.substring(1).toLowerCase();
    }
}
}
