## Exercise 2.11
As an excersise I translated this guide
https://www.96boards.org/documentation/consumer/dragonboard/dragonboard410c/build/kernel.md.html
up to building the kernel, into a Docker image.

A nice aspect of Docker is the capability to use cached parts of previous failed tries, before you get everything "right". This is only a starting point to actually do anything really useful, but i think this will suffice here. Quote: _"The next exercise can be extremely easy or extremely hard. Feel free to have fun with it."_ I guess this was something in between.

I have not timed how long this would take from scratch in one go, but here is an example run in the current state:
```
rvl@eb: Dragonboard $ ls -l
total 8
-rw-rw-r-- 1 rvl rvl    0 touko  15 04:53 boot-db410c.img
-rw-rw-r-- 1 rvl rvl  790 touko  15 05:26 docker-compose.yml
-rw-rw-r-- 1 rvl rvl 1705 touko  15 04:19 Dockerfile
rvl@eb: Dragonboard $ docker-compose up
Recreating DragonBoard410cImage ... done
Attaching to DragonBoard410cImage
DragonBoard410cImage | reading config args
DragonBoard410cImage | reading kernel from Image.gz+dtb
DragonBoard410cImage | reading ramdisk from ramdisk.img
DragonBoard410cImage | Writing Boot Image boot-db410c.img
DragonBoard410cImage exited with code 0
rvl@eb: Dragonboard $ ls -l
total 7904
-rw-rw-r-- 1 rvl rvl 8083456 touko  15 11:34 boot-db410c.img
-rw-rw-r-- 1 rvl rvl     790 touko  15 05:26 docker-compose.yml
-rw-rw-r-- 1 rvl rvl    1705 touko  15 04:19 Dockerfile
rvl@eb: Dragonboard $ docker images|grep rvlq\/410
rvlq/410-kernel-image                             qcomlt-4.14    1a86118d1288   7 hours ago     10.9GB
rvl@eb: Dragonboard $ 

```