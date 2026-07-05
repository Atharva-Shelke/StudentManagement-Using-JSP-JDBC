package utility;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.LinkedHashMap;
import java.util.Map;

public class SqlLoader {

	private static final Map<String, String> queries = new LinkedHashMap<>();

	static {

		try {

			String sqlFile = ConfigUtil.getProperty("sql.file");

			InputStream is = SqlLoader.class.getClassLoader().getResourceAsStream(sqlFile);

			if (is == null) {
				throw new RuntimeException("SQL file not found with path sql/queries.sql.");
			}

			BufferedReader br = new BufferedReader(new InputStreamReader(is));

			String line;
			String currentQuery = null;
			StringBuilder builder = new StringBuilder();

			while ((line = br.readLine()) != null) {

				line = line.trim();

				if (line.startsWith("-- name:")) {

					if (currentQuery != null) {
						queries.put(currentQuery, builder.toString().trim());
					}

					currentQuery = line.substring("-- name:".length()).trim();

					builder = new StringBuilder();
				} else {

					if (!line.isEmpty()) {
						builder.append(line).append(" ");
					}

				}

			}

			if (currentQuery != null) {

				queries.put(currentQuery, builder.toString().trim());

			}

			br.close();

		} catch (IOException e) {

			throw new RuntimeException(e);

		}

	}

	public static String getQuery(String name) {

		String query = queries.get(name);

		if (query == null) {
			throw new IllegalArgumentException("SQL query not found: " + name);
		}

		return query;

	}

}
