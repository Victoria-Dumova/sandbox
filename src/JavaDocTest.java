/**
 * <h2>🚀 SmartCacheManager</h2>
 *
 * <p>
 * A <b>thread-safe</b> in-memory cache with automatic eviction and metrics support.
 * Designed for high-performance environments.
 * </p>
 *
 * <hr>
 *
 * <h3>✨ Features</h3>
 * <ul>
 *   <li>⚡ O(1) access time</li>
 *   <li>🧵 Thread-safe operations</li>
 *   <li>📊 Built-in metrics</li>
 *   <li>⏳ Configurable TTL (time-to-live)</li>
 * </ul>
 *
 * <h3>📌 Example Usage</h3>
 *
 * <pre>{@code
 * SmartCacheManager<String, Integer> cache = new SmartCacheManager<>(100);
 * cache.put("apples", 10);
 *
 * Integer value = cache.get("apples");
 * System.out.println(value);
 * }</pre>
 *
 * <h3>🔗 Related Classes</h3>
 * <ul>
 *   <li>{@link java.util.concurrent.ConcurrentHashMap}</li>
 *   <li>{@link CacheEvictionPolicy}</li>
 *   <li>{@linkplain MetricsCollector Metrics Collector}</li>
 * </ul>
 *
 * <h3>📊 Configuration Options</h3>
 *
 * <table border="1">
 *   <caption><b>Cache Parameters</b></caption>
 *   <tr>
 *     <th>Parameter</th>
 *     <th>Description</th>
 *     <th>Default</th>
 *   </tr>
 *   <tr>
 *     <td>maxSize</td>
 *     <td>Maximum number of entries</td>
 *     <td>1000</td>
 *   </tr>
 *   <tr>
 *     <td>ttl</td>
 *     <td>Entry time-to-live (ms)</td>
 *     <td>60000</td>
 *   </tr>
 * </table>
 *
 * <h3>⚠ Important Notes</h3>
 * <p>
 * <b>Warning:</b> Entries may be evicted before TTL expiration
 * if the maximum size is exceeded.
 * </p>
 *
 * <h3>🧠 Thread Safety</h3>
 * <p>
 * All public methods are safe for concurrent use.
 * Internally relies on {@link java.util.concurrent.locks.ReentrantLock}.
 * </p>
 *
 * @param <K> the type of cache keys
 * @param <V> the type of cache values
 * @author Your Name
 * @version 1.2.0
 * @see CacheEvictionPolicy
 * @see <a href="https://docs.oracle.com/en/java/">Official Java Documentation</a>
 * @since 2026.1
 */

public class JavaDocTest<K, V> {
    /// Calculates the average.
    ///
    /// - Validates input
    /// - Computes the arithmetic mean
    /// ---
    /// ## Example
    ///
    /// ```java
    /// double result = MathUtils.average(new double[] {1, 2, 3});
    /// ```
    /// pupupu
    public static double average(double[] values) {
        if (values == null) {
            throw new NullPointerException("Values must not be null");
        }
        if (values.length == 0) {
            throw new IllegalArgumentException("Values must not be empty");
        }

        double sum = 0;
        for (double v : values) {
            sum += v;
        }

        return sum / values.length;
    }
}
