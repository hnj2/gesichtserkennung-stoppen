#/bin/bash

target="html/$1/"

rsync=$(rsync --dry-run --exclude neu --exclude '.ht*' --delete -rvc html/ "df@df.uber.space:$target")

#echo "## rsync dry run:"
#echo "$rsync"
#echo

files=$(echo "$rsync" | head --lines=-3 | tail --lines=+2)
onlyhost=$(echo "$files" | grep -E "^deleting .+" | sed "s/deleting \(\)/\1/")

get_diff_files() {
    ssh df@df.uber.space "
    for file in $@; do
        if test -e $target\$file; then
            echo \$file
        fi
    done
    "
}

updatefiles=$(echo "$files" | grep -vE "^deleting .+")
differ=$(get_diff_files $updatefiles)
onlylocal=${updatefiles/$differ}

printdiff() {
    if ! test -z "$onlylocal"; then
        echo "## files only local:"
        echo "$onlylocal"
        echo
    fi
    if ! test -z "$onlyhost"; then
        echo "## files only on host:"
        echo "$onlyhost"
        echo
    fi
    if ! test -z "$differ"; then
        echo "## files that differ:"
        echo "$differ"
        echo
    
        for file in $differ; do
            echo "## diff [local]/$file [host]/$file"
            diff html/$file <(ssh df@df.uber.space "cat $target$file")
            echo
        done
    fi
}

printdiff | less

