// class Player {
//   static apiCall(position, name, week) {
//     return $.ajax({
//       url: `http://localhost:3000/${position}/${name}/${week}`,
//       type: "GET",
//       dataType: 'jsonp',
//       cache: false,
//       success: function(response) {
//         return response;
//       }
//     });
//   }
// }

// class PlayerApi {
//   static getJSON(position, name, week) {
//     return $.getJSON(`http://localhost:3000/${position}/${name}/${week}`, function(response) {
//       return response
//     })
//   }
// }
//
// $.getJSON(`http://localhost:3000/quarterbacks/carson%20wentz/5`, function(response) {
//   return response
// })
