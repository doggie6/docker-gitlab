#!/usr/bin/env bash

## 登录 args  1 http_prefix  2 user  3 password
admin_login(){
    if [ -z ${PRIVATE_TOKEN} ]; then
        PRIVATE_TOKEN=$(
        curl  -X POST \
        -d \
        '' \
        "${1}/api/v3/session?login=${2}&password=${3}" \
        | jq -r '.private_token')
   fi
}

add_deploykeys(){
   echo "TODO"
}

wait_http_ok(){
    echo "wait http response Ok(200)"
    local var_git_hostname="${1}"
    local var_git_http_port="${2}"
    local var_git_http_prefix="http://127.0.0.1:${http_port}"
    # 重试时间间隔
    local retry_interval=5
    # 重试次数
    local retry_times=100

    for i in $(seq 10); do
        local http_resp_status=$(curl -s -o /dev/null -I -w "%{http_code}\n" ${var_git_http_prefix}/help);
        echo "http response code :${http_resp_status}"
        if test ${http_resp_status} = "200"; then
            echo "gitlab service ok"
            break;
        fi
        echo "wait ${retry_interval} seconds"
        sleep ${retry_interval};
    done;
}

wait_git_service_up() {
    if type -p waitforit > /dev/null; then
       #  -debug
       waitforit -full-connection=tcp://127.0.0.1:${http_port} -timeout=600
       waitforit -full-connection=tcp://127.0.0.1:22 -timeout=600
#       sleep 20
       echo "gitlab_port_is_running: --------------------------------------------"
       if [ $? -gt 0 ]; then
             echo "gitlab is not running"
             exit 1
        fi
    fi
}

wait_git_service_up
wait_http_ok

admin_login http://127.0.0.1:${http_port} root $root_pass
echo "heheda $PRIVATE_TOKEN"
echo "heheda $PRIVATE_TOKEN"
echo "heheda $PRIVATE_TOKEN"
echo "heheda $PRIVATE_TOKEN"
echo "heheda $PRIVATE_TOKEN"
echo "heheda $PRIVATE_TOKEN"
echo "heheda $PRIVATE_TOKEN"
echo "heheda $PRIVATE_TOKEN"
echo "heheda $PRIVATE_TOKEN"
echo "heheda $PRIVATE_TOKEN"
echo "heheda $PRIVATE_TOKEN"
echo "heheda $PRIVATE_TOKEN"
echo "heheda $PRIVATE_TOKEN"
echo "heheda $PRIVATE_TOKEN"