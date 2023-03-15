
■SSH
【作成方法】
ssh-keygen -t ed25519 -N 'passphrase' -C '' -Z aes256-cbc
ssh-keygen -C '' -f id_ed25519 -m PEM
※tオプションがあると、RSAフォーマットにならない。
※N、Zオプションがあると、Renci.SshNetのPrivateKeyAuthenticationMethodの生成で失敗する。

【接続】
https://pystyle.info/docker-connect-to-container-using-ssh/
https://ikasamak503.hatenablog.com/entry/ssh-with-docker-on-windows
https://www.mtioutput.com/entry/docker-run-start
https://zenn.dev/torkralle/articles/388ae878cb5f8b





