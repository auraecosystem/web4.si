curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin <additional install-script args>
./dotnet-install.sh --runtime dotnet --version 6.0.0
./dotnet-install.sh --channel 6.0.1xx --quality preview --install-dir ~/cli
./dotnet-install.sh --channel LTS
sudo apt install gpg
wget https://dot.net/v1/dotnet-install.asc
gpg --import dotnet-install.asc
gpg --verify dotnet-install.sig dotnet-install.sh

sudo apt install gpg
wget https://dot.net/v1/dotnet-install.asc
gpg --import dotnet-install.asc
