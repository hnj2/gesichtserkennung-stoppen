#/bin/bash

SSH_REMOTE="df@df.uber.space"

rsync_diff() {
    local_folder=$1
    remote_folder=$2
    rsync=$(rsync --dry-run --delete --exclude "__pycache__" --exclude "sqlite.db" -rvc "$local_folder" "$SSH_REMOTE:$remote_folder")
    
    #echo "## rsync dry run:"
    #echo "$rsync"
    #echo
    
    files=$(echo "$rsync" | head --lines=-3 | tail --lines=+2)
    onlyhost=$(echo "$files" | grep -E "^deleting .+" | sed "s/deleting \(\)/\1/")
    
    get_diff_files() {
        ssh "$SSH_REMOTE" "
        for file in $@; do
            if test -e $remote_folder/\$file; then
                echo \$file
            fi
        done
        "
    }
    
    updatefiles=$(echo "$files" | grep -vE "^deleting .+")
    differ=$(get_diff_files $updatefiles)
    onlylocal=${updatefiles/$differ}
    
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
            diff "$local_folder/$file" <(ssh "$SSH_REMOTE" "cat $remote_folder/$file")
            echo
        done
    fi
}

(
    rsync_diff html/ html;
    rsync_diff newsletter/ newsletter
) | less

