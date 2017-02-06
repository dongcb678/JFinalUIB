package com.junit.platform;

import org.junit.Test;

import com.alibaba.druid.filter.config.ConfigTools;

public class TestDruid {//extends TestBase {
	
	/**
	 * Druid数据源密码加密
	 * 
	 *  privateKey : MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEAjaybwuxCdPM21Ipkt+v2NNtBIJvZ5QelHZcdH9tDCvuVU4wWB3olgNMu2zrpfbS5ymYe8+3AxQEL59bewDs5uwIDAQABAkAlrDeDHrYRSTdUTzS3H5zJs1/fHvJTD7RdaPiKpxBt09EgHih8VNhYoONi/DXmYFOB/F0NZBai1mVLH6kHaYYZAiEAxyFQwA7LJ19WQGi/4xUGyhDnnWRV4qcTDbcjZ5AS2kcCIQC2IpzAAp+tCTAD4ayIEU0HeTaZRiCSK+Y0lEE8LYyq7QIgevKG+Q4pQNYMWxhR4dNJrdliKDubC6Y8jWtV4MuD2GECIQCIV/jHtC8cNZiAD1w8r9beFVtN+jU/tyUpjyIWjnKTMQIgcKaoBmlRd7GgJhZvzkxnK3gYBwf1W6eT1lDvFl7dBkM=
	 * 	publicKey : MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAI2sm8LsQnTzNtSKZLfr9jTbQSCb2eUHpR2XHR/bQwr7lVOMFgd6JYDTLts66X20ucpmHvPtwMUBC+fW3sA7ObsCAwEAAQ==
	 * 	password : 678789
	 * 	password2 : clT72lKjpUcVkeLMDExG6+c9FUyN/tTX/Ghy3XUeFqxW2ZNJa0lRvul1neubq4FrIVUMbPC0wcmEjbsUKoKQ0Q==
	 * 	password3 : 678789
	 * @throws Exception
	 */
	@Test
    public void crypt() throws Exception{
		// 密码明文
		String password = "678789";

		String[] keyPair = ConfigTools.genKeyPair(512);
		
		// 私钥
		String privateKey = keyPair[0];
		
		// 公钥
		String publicKey = keyPair[1];
		
		// 私钥加密
		String password2 = ConfigTools.encrypt(privateKey, password);
		
		// 公钥解密
		String password3 = ConfigTools.decrypt(publicKey, password2);

		System.out.println("privateKey:" + privateKey);
		System.out.println("publicKey:" + publicKey);
		System.out.println("password:" + password);
		System.out.println("password2:" + password2);
		System.out.println("password3:" + password3);
    }

}
