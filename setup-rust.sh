#!/bin/bash

echo Setting up rust. 
echo ""
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo Install cargo-modules to give a nice hierarchy of cargo modules.
echo ""
cargo install cargo-modules
