cd postgresql-9.6.1
make clean
make
make install
cd ../install
bin/postgres -D data
