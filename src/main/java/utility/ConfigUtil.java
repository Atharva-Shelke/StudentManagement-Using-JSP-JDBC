package utility;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigUtil {

	private static final Properties properties = new Properties();

	static {
		try (InputStream is = ConfigUtil.class.getClassLoader().getResourceAsStream("config.properties")) {

			properties.load(is);

		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	public static String getProperty(String key) {
		return properties.getProperty(key);
	}
}
