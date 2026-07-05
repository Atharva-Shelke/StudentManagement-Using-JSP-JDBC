package utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnector {

	public static Connection getConnection() throws Exception {
		
		Class.forName(ConfigUtil.getProperty("driver"));

		return DriverManager.getConnection(
		        ConfigUtil.getProperty("connectionUrl")
		                + ConfigUtil.getProperty("database"),
		        ConfigUtil.getProperty("username"),
		        ConfigUtil.getProperty("password"));

	}

}
