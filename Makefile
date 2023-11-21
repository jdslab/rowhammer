CC=g++

all: bin bin/histogram bin/conflicting-addresses bin/detect-col-bits bin/verify-dram-mapping
clean:
	rm -rf bin/

bin/histogram: src/histogram/histogram.cc src/shared.cc src/shared.hh src/params.hh src/util.hh
	$(CC) -std=c++11 -g -O0 -o $@ src/histogram/histogram.cc src/util.hh src/shared.cc

bin/conflicting-addresses: src/reverse/conflicting-addresses.cc src/shared.cc src/shared.hh src/params.hh src/util.hh
	$(CC) -std=c++11 -g -O0 -o $@ src/reverse/conflicting-addresses.cc src/util.hh src/shared.cc

bin/verify-dram-mapping: src/reverse/verify-dram-mapping.cc src/shared.cc src/shared.hh src/params.hh src/util.hh
	$(CC) -std=c++11 -g -O0 -o $@ src/reverse/verify-dram-mapping.cc src/util.hh src/shared.cc

bin/detect-col-bits: src/reverse/detect-col-bits.cc src/shared.cc src/shared.hh src/params.hh src/util.hh
	$(CC) -std=c++11 -g -O0 -o $@ src/reverse/detect-col-bits.cc src/util.hh src/shared.cc

bin:
	mkdir bin
