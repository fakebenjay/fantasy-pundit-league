function teamCall(name, week, quality, callback) {
  fetch(`http://localhost:3000/teams/${name}/${week}/${quality}`)
    .then(res => res.json())
    .then(json => callback(json))
}
