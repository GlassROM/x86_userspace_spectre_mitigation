pkgname=libx86_return_thunk
pkgver=1.0
pkgrel=1
pkgdesc="Library that implements x86 return thunks for speculative execution mitigation"
arch=('x86_64')
license=('MIT')
makedepends=('gcc' 'gcc-libs' 'clang' 'llvm')
options=('strip' 'lto')
source=(build.sh
    return_thunk.lib.S
)

b2sums=('dfde07a7f474f10c433217089df7e71b156502435c6ff51496473b6908ab91ca5a46bfc96922a2cf09ec1e45184044457ed819c8f1ab3fd59429b8f8bbf732c1'
    '28ba70dfa85bdcfadf420735c24aed4eb962b165be2daddbc2a7b8dffce3200ba263400f5923d3e8be3a098036eb86cd1a8ce084fdb817775401ecd9129ce4ff'
)
sha512sums=('e4a62bbd310a13d27115035e77149f7fc3b6a42c8318432a521cc4b89a79d3d3b2e1e2ef9ed3c4d316128ba7fc51ddb97372dd1ac16f1b85be9a9b6adc2d9e93'
    '718556ce1b29c463441ed0d6fbf861b0018d91617a6cc05eb58ee43e08c6e2fc1b0046ea2c214a86e9953b3d9c3a5326ef75295b0975dd308615054fed1e66c9'
)

build() {
    cd "$srcdir"
    bash ./build.sh
}

package() {
    # Install static library
    install -Dm644 libx86_return_thunk_gcc.a "$pkgdir/usr/lib/libx86_return_thunk_gcc.a"
    install -Dm644 libx86_return_thunk_clang.a "$pkgdir/usr/lib/libx86_return_thunk_clang.a"
    
    # Install shared library
    install -Dm755 libx86_return_thunk_gcc.so "$pkgdir/usr/lib/libx86_return_thunk_gcc.so"
    install -Dm755 libx86_return_thunk_clang.so "$pkgdir/usr/lib/libx86_return_thunk_clang.so"
}
