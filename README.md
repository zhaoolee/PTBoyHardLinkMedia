
# 一个方便PT玩家节省硬盘的硬链接脚本

代码仓库地址: https://github.com/zhaoolee/PTBoyHardLinkMedia


## 本脚本的灵感来自于树莓派挂机刷PT的应用：


《树莓派不吃灰》022：搭建qBittorrent Web UI为PT站7×24小时做种，持续获取魔力值：
https://v2fy.com/p/2023-10-13-17-53-40-qbit/

## 一些进阶的硬盘节省空间技巧

qBittorrent下载的内容可以直接在同一个硬盘硬链接到 Jellyfin或 Plex媒体库文件夹，速度超快，而且硬链接后的文件只占用一份空间，就可以同时在qBittorrent 目录做种，在jellyfin目录生成海报墙；比如使用cp -lR从qbit下载目录创建硬链接到Jellyfin或 Plex媒体库目录

```
cp -lR '/opt/sdb/pt/downloads/[六人行(老友记)].Friends Season 01-10 NTSC DD5.1 x264/Friends Season 01 NTSC DD5.1 x264-CtrlSD' '/opt/sdb/jellyfin/Shows/Friends (1994) [tmdbid-1668]/Season 1'
```

但是每次敲命令，还是有点复杂，而且容易写错，于是我写了个脚本，只要运行脚本，就能将文件硬链接到目标位置

## 如何使用？

根据自己实际情况，设置PT下载的目录，已经影视库的目标目录

![](https://cdn.fangyuanxiaozhan.com/assets/1740903986058QmQC8Hc0.png)

```
chmod +x script.sh

./script.sh
```


## 使用效果
![](https://cdn.fangyuanxiaozhan.com/assets/1740904156476tTG5EDA2.png)

```
PTBoyHardLinkMedia ./script.sh
请选择要硬链接的文件夹：
...
128) /opt/sdb/pt/downloads/傲骨贤妻S01-S07.The.Good.Wife.2009-2015.1080p.WEB-DL.x265.AC3￡cXcY@FRDS
...
137) /opt/sdb/pt/downloads/庆余年.Joy.of.Life.2019.S01.WEB-DL.2160p.H265.AAC-ADWeb
138) /opt/sdb/pt/downloads/庆余年.Joy.of.Life.2024.S02.2160p.WEB-DL.H265.AAC-PTerWEB

#? 128
已选择: /opt/sdb/pt/downloads/傲骨贤妻S01-S07.The.Good.Wife.2009-2015.1080p.WEB-DL.x265.AC3￡cXcY@FRDS
请选择目标目录：
3) /opt/sdb/jellyfin/Music
2) /opt/sdb/jellyfin/Movies
1) /opt/sdb/jellyfin/Shows
输入目标目录的编号: 1
目标目录: /opt/sdb/jellyfin/Shows
请输入目标文件夹名称 (默认: 傲骨贤妻S01-S07.The.Good.Wife.2009-2015.1080p.WEB-DL.x265.AC3￡cXcY@FRDS): 
硬链接创建成功: /opt/sdb/jellyfin/Shows/傲骨贤妻S01-S07.The.Good.Wife.2009-2015.1080p.WEB-DL.x265.AC3￡cXcY@FRDS

```



![](https://cdn.fangyuanxiaozhan.com/assets/1740903930576XcpBfpFQ.png)


