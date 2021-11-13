# pxeboot-alpine

「pxeboot-alpine is 何 ?」

- OSのインストール(インストールメディアの作成)
- ネットワークの設定変更(ブリッジ作成)
- パーティション分割(LVMシンプロビジョニング)

これらが面倒なので `PXEブート` しよう  
`docker-compose up -d` でサクッと環境構築しよう  
というリポジトリです

## 構成

5つのサービスがあります

- iso-mounter
- dhcp-server
- tftp-server
- http-server
- rsyslog-server

## 使い方

自身の環境に合わせて設定を変更する必要があります

- rootパスワードの変更
- ネットワークの設定変更
- パーティションの設定変更
- ISOダウンロードリンク先の変更など

`全体の構成`, `設定の変更箇所` について、詳しくはこちらで解説しています  
[https://teityura.com/engineer/pxeboot-alpine](https://teityura.com/engineer/pxeboot-alpine)

## クイックスタート

```
# change ip
find . -type f -not -path "./.git/*" -not -path "./README.md" \
  -exec sed -i "s/192.168.1.100/192.168.xxx.xxx/g" '{}' \;

# set host
vim dhcp-server/dhcpd.conf
```

## 全部動かす

```
docker-compose build --no-cache
docker-compose up -d
docker-compose ps
docker-compose logs -f

# kickstartのログを見る
docker-compose exec rsyslog-server ls -al /var/log/rsyslog/192.168.1.101/
docker-compose exec rsyslog-server tail -f /var/log/rsyslog/192.168.1.101/YYYYMMDD.messages

# dhcp, http, kickstart 関連のパケットを見る
mkdir -p ~/containers/pxeboot-alpine/logs
cd ~/containers/pxeboot-alpine/logs/

# Wiresharkでちゃんと見る
tcpdump -nne -i eno1 ether src xx:xx:xx:xx:xx:01 -w "`date '+%Y-%m%d-%H%M%S'`.cap"

# tcpdumpでサクッと見る
tcpdump -nne -i eno1 ether src xx:xx:xx:xx:xx:01 | tee "`date '+%Y-%m%d-%H%M%S'`.log"
```

## サービスを1個ずつ動かす

#### iso-mounter

```
docker-compose build --no-cache iso-mounter
docker-compose up -d iso-mounter
docker-compose ps
docker-compose logs -f iso-mounter

# /isos/ フォルダを確認
docker run -it -v pxeboot-alpine_isos:/isos --rm --name tmp alpine /bin/sh
ls -al /isos/
```

#### dhcp-server

```
docker-compose build --no-cache dhcp-server
docker-compose up -d dhcp-server
docker-compose ps
docker-compose logs -f dhcp-server
```

#### tftp-server

```
docker-compose build --no-cache tftp-server
docker-compose up -d tftp-server
docker-compose ps
docker-compose logs -f tftp-server
```

#### http-server

```
docker-compose build --no-cache http-server
docker-compose up -d http-server
docker-compose ps
docker-compose logs -f http-server
```

#### rsyslog-server

```
docker-compose build --no-cache rsyslog-server
docker-compose up -d rsyslog-server
docker-compose ps
docker-compose logs -f rsyslog-server

# rsyslog-serverにログを送信
logger -n 192.168.1.100 -p user.info 'hello'
docker-compose exec rsyslog-server ls -al /var/log/rsyslog/
docker-compose down rsyslog-server
```

### ISOをダウンロードせずにビルドしなおす

```
# depends_on をコメントアウトする
vim docker-compose.yml
# ======================================================
     # depends_on:
     #   iso-mounter:
     #     condition: service_completed_successfully
# ======================================================
```
