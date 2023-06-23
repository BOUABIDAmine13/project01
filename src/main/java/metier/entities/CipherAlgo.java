package metier.entities;

import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.tomcat.util.codec.binary.Base64;

public class CipherAlgo {
	private static final String ALGORITHME = "AES";
	private static final byte[] keyValue = "AMINE071202coco1".getBytes();
	
	public static Key generateKey() throws Exception {
		Key key = new SecretKeySpec(keyValue, ALGORITHME);
		return key;
	}
	
	public static String ecrypt(String motPass, Key key) throws Exception{
		Cipher cipher = Cipher.getInstance(ALGORITHME);
		cipher.init(Cipher.ENCRYPT_MODE, key);
		
		byte[] encValue = cipher.doFinal(motPass.getBytes());
		byte[] encryptedByetValue = new Base64().encode(encValue);
		return new String(encryptedByetValue);
	}
	
	public static String decrypt(String motPassEncrypt, Key key) throws Exception{
		Cipher cipher = Cipher.getInstance(ALGORITHME);
		cipher.init(Cipher.DECRYPT_MODE, key);
		byte[] decodeValue = new Base64().decode(motPassEncrypt.getBytes());
		byte[] encVal = cipher.doFinal(decodeValue);
		return new String(encVal);
	}
}
