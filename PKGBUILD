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
    '6fe4f6b27018036cb43a8a168e60365b864e1e7122e10a729ea5574ba353c3dc685fbaa90f9629d0e459ce73663baf19d0ae093fbc433e8d5593f9f48bd88a6c'
)
sha512sums=('e4a62bbd310a13d27115035e77149f7fc3b6a42c8318432a521cc4b89a79d3d3b2e1e2ef9ed3c4d316128ba7fc51ddb97372dd1ac16f1b85be9a9b6adc2d9e93'
    '5e946e4fa61d89dd162a33b55d2cd96dcf2c967764aa426b77d0cac2dc0e158d15e20f8c4e2efca278e9b858e5ceac2c38ff853335586c6529a44de0ae3cab53'
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
