import net
import io

fn main() {
	// Make a new connection
	mut conn := net.dial_tcp('google.com:80')?
	defer { conn.close() }
	// Simple http HEAD request for a file
	conn.write_str('HEAD /index.html HTTP/1.0\r\n\r\n')?
	// Read all the data that is waiting
	result := io.read_all(conn)?
	// Cast to string and print result
	println(result.bytestr())
}
