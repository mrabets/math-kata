import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const room_id = document.getElementById("room-id").getAttribute('data-room-id')

  consumer.subscriptions.create({ channel: "RoomChannel", room_id: room_id },  {
    connected() {
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      this.appendLine(data)  
    },

     appendLine(data) {      
      const html = this.createLine(data)
      const element = document.getElementById(`msg-${room_id}`)
      element.insertAdjacentHTML("beforeend", html)
    },

    createLine(data) {
      return `
        <div id="comments-media" class="media">
         <p class="float-end">
         <small>${data.time}</small><br>
        </p>
          <div class="d-flex align-items-center">
            <div class="flex-shrink-0">
              <img class="rounded-circle" 
                src="${data.image_src}""
              width="40">
            </div>
            <div class="flex-grow-1 ms-3">             
              <span>${data.name}</span>    
            </div>
          </div>

          <div class="mx-auto" style="width: 700px;">
            <i><p id="comment-text" class="comment-text"> ${data.message}<br></p></i>
          </div> 
        </div>
      `
    }
  });
})
