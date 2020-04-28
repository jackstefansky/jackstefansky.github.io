'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/index.html": "f99404f7a8943b385e6c661aaecc18e4",
"/main.dart.js": "ee6c12320de76a526c8b606e3aeccb4e",
"/assets/LICENSE": "f258e709d4b4509c79a46e7d2616e8be",
"/assets/AssetManifest.json": "d3f75bbcfd7ff0d24d09b18d81bfe53d",
"/assets/FontManifest.json": "40609adb8a9fab020ab32d53ef2c1e52",
"/assets/fonts/CrilleeItalicStd/CrilleeItalicStdRegular.otf": "fa1e7fe163fb5f9224ee43365f679cf6",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/fonts/SourceSansPro/SourceSansPro-Regular.ttf": "c1678b46f7dd3f50ceac94ed4e0ad01a",
"/assets/fonts/SourceSansPro/SourceSansPro-Bold.ttf": "8669b8706bbbdd1482e2fccc4ed96850",
"/assets/fonts/SourceSansPro/SourceSansPro-Light.ttf": "81cd217e4a8160a930c6d5fb8d1e8e82",
"/assets/fonts/SourceSansPro/SourceSansPro-Black.ttf": "9ded577f93b24331f4faadfc5f834ae6",
"/assets/assets/as.png": "eabc5d23d6ebc9b8ea0f701dd62c004a",
"/assets/assets/gp.png": "d7e4396838ddb9b385a66e2a8f55d991",
"/assets/assets/app_icons/la.png": "ab7730461e4f1396ca3c1651dd80baf9",
"/assets/assets/app_icons/ag.png": "dea5251a5961c89c5b6fcac4ee2547a5",
"/assets/assets/app_icons/lb.png": "ca51bae443880c72207f50099e4e43ec",
"/assets/assets/app_icons/fcs.png": "f2c2474a37578a029bee190def1d9393",
"/assets/assets/app_icons/sg.png": "52ef760b6a500a2a3b08ed40572077d6",
"/assets/assets/app_icons/wnt.png": "411185e2b3761729496d81961e901ecc",
"/assets/assets/app_icons/lw2020.png": "fdf85fb21656db52979a365c52fde039"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
