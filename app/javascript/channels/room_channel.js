import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const room_id = document.getElementById("room-id").getAttribute('data-room-id')

  consumer.subscriptions.create({ channel: "RoomChannel", room_id: room_id },  {
    connected() {
      console.log("Connected with room id: " + room_id)
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data)
      $(`#msg-${room_id}`).append('<div class="message"> ' + data.message + '</div>')

      // this.appendLine(data)  
    },

    //  appendLine(data) {      
    //   const html = this.createLine(data)
    //   const element = document.getElementById(`msg-${room_id}`)
    //   element.insertAdjacentHTML("beforeend", html)
    // },

    // createLine(data) {
    //   return `
    //     <div class="message"> 
    //       ${data.message}
    //     </div>
    //   `
    // }
  });
})
