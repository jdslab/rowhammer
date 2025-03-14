#include <iostream>
#include <cstdlib>
#include <chrono>

#define ROW_SIZE_GUESS 8192  // Start with 8 KB assumption

void access_memory(char* base, size_t stride) {
    volatile char x;
    auto start = std::chrono::high_resolution_clock::now();
    for (size_t i = 0; i < 10000; i++) {
        x = base[i * stride];  // Access with stride to measure row conflicts
    }
    auto end = std::chrono::high_resolution_clock::now();
    std::cout << "Latency for stride " << stride << ": "
              << std::chrono::duration_cast<std::chrono::nanoseconds>(end - start).count()
              << " ns\n";
}

int main() {
    size_t mem_size = 16 * 1024 * 1024;  // 16 MB
    char* mem = (char*)malloc(mem_size);
    for (size_t stride = 4096; stride <= 16384; stride *= 2) {
        access_memory(mem, stride);
    }
    free(mem);
}