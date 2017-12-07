function get(position, name, week) {
  var httpreq = new XMLHttpRequest();
  httpreq.open("GET",`http://localhost:3000/${position}/${name}/${week}`,false);
  httpreq.send(null);
  return httpreq.responseText;
}
