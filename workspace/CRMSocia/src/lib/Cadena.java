package lib;

public class Cadena {   
	public static String filtroCadena(String cadena){
		if(cadena == null)
			cadena = "";
 			cadena = cadena.trim();
		
		return cadena;
	}
	public static String filtroCadena(String cadena,String valor){
		if(cadena == null)
			cadena = valor;
		else
			cadena = cadena.trim();
		
		return cadena;
	}
}