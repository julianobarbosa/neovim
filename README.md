# neovim
neovim configuration files

# Install
## from source
### get code
```console
git clone https://github.com/neovim/neovim.git
```

### centos
```console
yum -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch
```

### ubuntu
```console
sudo apt install libtool-bin gettext libtool autoconf automake cmake libncurses5-dev g++
```

## compile
```console
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

# Core
## <<< local_init.vim >>>

```console
let g:go_version_warning = 0

Plug 'altercation/vim-colors-solarized'

syntax enable
set background=dark
colorscheme solarized
```

## CentOS 7
https://www.linode.com/docs/tools-reference/tools/how-to-install-neovim-and-plugins-with-vim-plug/


# Reference
- https://www.linode.com/docs/tools-reference/tools/how-to-install-neovim-and-plugins-with-vim-plug/
