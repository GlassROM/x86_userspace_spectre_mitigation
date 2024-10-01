Name:           libx86_return_thunk
Version:        1.0
Release:        1%{?dist}
Summary:        Library that implements x86 return thunks for speculative execution mitigation

License:        MIT
URL:            (no URL given)
Source0:        build.sh
Source1:        return_thunk_lib.S

BuildRequires:  gcc
BuildRequires:  clang
BuildRequires:  llvm
BuildRequires:  binutils

%description
Library that implements x86 return thunks for speculative execution mitigation.

%prep
%setup -c -T
cp %{SOURCE0} %{SOURCE1} .

%build
bash ./build.sh

%install
mkdir -p %{buildroot}%{_libdir}
install -m 644 libx86_return_thunk_gcc.a %{buildroot}%{_libdir}/libx86_return_thunk_gcc.a
install -m 644 libx86_return_thunk_clang.a %{buildroot}%{_libdir}/libx86_return_thunk_clang.a
install -m 755 libx86_return_thunk_gcc.so %{buildroot}%{_libdir}/libx86_return_thunk_gcc.so
install -m 755 libx86_return_thunk_clang.so %{buildroot}%{_libdir}/libx86_return_thunk_clang.so

%files
# Include the license file if available
# %license LICENSE
%{_libdir}/libx86_return_thunk_gcc.a
%{_libdir}/libx86_return_thunk_clang.a
%{_libdir}/libx86_return_thunk_gcc.so
%{_libdir}/libx86_return_thunk_clang.so
