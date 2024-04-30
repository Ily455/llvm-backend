find . -type f -exec grep -l 'RISCW' {} +
find . -type f -exec grep -l 'RISC-W' {} +
find . -type f -name '*RISCW*'
find . -type f -name '*RISC-W*'
find . -type d -name '*RISC-W*'
find . -type d -name '*RISCW*'
./w
./rename.sh
./reword.sh
./w
./reword.sh
