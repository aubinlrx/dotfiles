echo "installing alacritty..."

# Install dependencies
sudo apt install cmake libfreetype6-dev libfontconfig1-dev xclip

# Clone repositories
git clone https://github.com/jwilm/alacritty.git /tmp/alacritty

# Compile alacritty
cd /tmp/alacritty
cargo build --release

# Copy binary into /usr/local/bin
sudo cp /tmp/alacritty/release/alacritty /usr/local/bin

# Add man to alacritty
gzip -c alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null

echo "alacritty instalation done"
