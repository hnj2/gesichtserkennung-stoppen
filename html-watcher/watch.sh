#/bin/sh

while true; do
    ans=$(make --trace)
    if [ "$ans" != "make: Nothing to be done for 'generate'." ]; then
        echo make
        echo "$ans"
        echo
    fi
    sleep 2
done
