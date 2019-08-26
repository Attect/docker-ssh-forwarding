# docker-ssh-forwarding
在Docker中使用SSH将远程服务器内部端口转发到本地内部网络

适合将生产环境中为了安全而不开放外部访问的端口，通过SSH安全转发功能，映射到内部网络指定主机和端口上。

## 凭证
使用密钥登录，请提前将运行的用户的凭证放到远程服务器上(ssh-copy-id)

## 构建
```
docker build . -t sshforwarding
```

## docker-compose.yml

```
version: "3"
services:
        sshforwarding:
                image: sshforwarding
                container_name: sshforwarding
                ports:
                        - "0.0.0.0:3307:3307"
                volumes:
                        - $HOME/.ssh:/root/ssh:ro
                environment:
                        REMOTE_USER: 远程服务器用户名
                        REMOTE_HOST: 远程服务器主机名
                        REMOTE_PORT: 远程服务器SSH端口
                        REMOTE_LISTEN_PORT: 需要转发的服务器端口
                        LOCAL_LISTEN_PORT: 本地监听端口
                        LOCAL_LISTEN_HOST: "本地监听地址"
```
