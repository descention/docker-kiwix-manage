# docker-kiwix-manage
kiwix-manage in a container so I could execute it on macOS

This was used to generate a new library.xml after downloading a bunch of zim files on torrents. In terminal, I navigated to the directory of all my zim files `~/Downloads/kiwix/` then executed the following.

`find . -name "*.zim" -exec docker run -v ~/Downloads/kiwix:/data descention/kiwix-manage /data/library.xml add /data/{} \;`

This generated a full library.xml that I can use with the docker kiwix/kiwix-serve.

`docker run -v ~/Downloads/kiwix:/data -p 8080:80 kiwix/kiwix-serve --library /data/library.xml`
