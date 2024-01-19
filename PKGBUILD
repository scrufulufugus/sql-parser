# Maintainer: Samuel Monson <smonson at irbash dot net>

pkgname=sql-parser-git
pkgver=1.5.r10.g31aaf8d
pkgrel=1
pkgdesc='SQL parser library'
arch=('any')
url="https://github.com/klundeen/sql-parser"
license=('MIT')
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 src/*.h -t "$pkgdir/usr/include/"
  install -Dm644 src/sql/*.h -t "$pkgdir/usr/include/sql/"
  install -Dm755 libsqlparser.so -t "$pkgdir/usr/lib/"
}
