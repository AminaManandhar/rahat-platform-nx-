current_dir="$PWD"

create_env() {
    # dev tools directory
    declare -a projectDirs=(
        "$current_dir" #for root project as well
        "$current_dir/tools/docker-compose/dev-tools"
    )

    for project in "${projectDirs[@]}"; do
        env_file="$project/.env"
        example_content=$(<"$project/.env.example")
        echo "$example_content" >"$env_file"
    done
}

create_rahat_volumes() {
    docker volume create rahat_pg_data &&
        docker volume create rahat_pg_admin_data &&
        docker volume create rahat_ganache_data &&
        docker volume create rahat_redis_data &&
        docker volume create rahat_pg_graph_data &&
        docker volume create rahat_ipfs_data
}

start_dev_tools() {
    declare -a composeDirs=(
        "$current_dir/tools/docker-compose/dev-tools"
        "$current_dir/tools/docker-compose/graph"
    )

    for project in "${composeDirs[@]}"; do

        compose_file="$project/docker-compose.yml"
        echo $compose_file
        docker compose -f $compose_file up -d
    done
}
