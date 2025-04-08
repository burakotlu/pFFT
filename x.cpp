#include <hls_stream.h>
#include <ap_int.h>

struct MyData {
    int a;
    int b;
};

void producer(hls::stream<MyData>& out_stream) {
    MyData data;
    for (int i = 0; i < 10; i++) {
        data.a = i;
        data.b = i * 2;
        out_stream.write(data);
    }
}

void consumer(hls::stream<MyData>& in_stream) {
    for (int i = 0; i < 10; i++) {
        MyData data = in_stream.read();
        printf("Consumed: a = %d, b = %d\n", data.a, data.b);
    }
}

int main() {
    hls::stream<MyData> my_stream;

    producer(my_stream);
    consumer(my_stream);

    return 0;
}
