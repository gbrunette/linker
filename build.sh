# linker build v0.42
export HTSLIB_VER=1.9
export BAMTOOLS_VER=v2.5.1
export PROG_NAME=linker
export PREFIX=$(pwd)


cd htslib
curl -L https://github.com/samtools/htslib/archive/$HTSLIB_VER.tar.gz | tar -zx --strip-components 1
autoheader
autoconf
./configure --prefix=$PREFIX/packages/htslib/
make
make install
cd ..
cd bamtools
curl -L https://github.com/pezmaster31/bamtools/archive/$BAMTOOLS_VER.tar.gz | tar -zx --strip-components 1
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX/packages/bamtools/ ..
make
make install
cd ../..
mkdir ./output
mkdir ./vcf_data
