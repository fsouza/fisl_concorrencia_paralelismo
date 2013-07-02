import java.util.concurrent.atomic.AtomicInteger;

public class Increment {
	public static void main(String[] args) {
		AtomicInteger i = new AtomicInteger(10);
		System.out.println(i.incrementAndGet());
	}
}
