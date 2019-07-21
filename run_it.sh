#!/bin/bash

elixir elixir_to_C.exs >> c_to_rust.c && gcc c_to_rust.c -o c_to_rust && ./c_to_rust >> rust_to_elixir.rs && rustc rust_to_elixir.rs && ./rust_to_elixir >> copy.exs
DIFF=$(diff copy.exs elixir_to_C.exs)
if [ "$DIFF" == "" ]; then
    echo "The copy file and original file match!"
else
    echo "An unusual error has occured"
fi

# Comment out line below if you would like to see the files
rm c_to_rust.c c_to_rust rust_to_elixir rust_to_elixir.rs copy.exs