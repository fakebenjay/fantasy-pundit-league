function teamCall(name, week, quality, callback) {
  fetch(`https://fantasy-pundit-api.herokuapp.com/teams/${name}/${week}/${quality}`)
    .then(res => res.json())
    .then(json => callback(json))
}

// function teamCall(name, week, quality, callback) {
//   fetch(`http://localhost:3000/teams/${name}/${week}/${quality}`)
//     .then(res => res.json())
//     .then(json => callback(json))
// }
