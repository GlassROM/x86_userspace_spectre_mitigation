gcc -flto=auto -ffat-lto-objects -c return_thunk.lib.S -o return_thunk.lib.o
strip --strip-unneeded return_thunk.lib.o
gcc -shared -flto=auto -ffat-lto-objects -o libx86_return_thunk_gcc.so return_thunk.lib.o
ar rcs libx86_return_thunk_gcc.a return_thunk.lib.o

clang -flto=auto -ffat-lto-objects -c return_thunk.lib.S -o return_thunk.lib.o
llvm-strip --strip-unneeded return_thunk.lib.o
clang -shared -flto=auto -ffat-lto-objects -o libx86_return_thunk_clang.so return_thunk.lib.o
llvm-ar rcs libx86_return_thunk_clang.a return_thunk.lib.o
