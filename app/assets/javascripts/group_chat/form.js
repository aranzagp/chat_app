(() => {

  const chatForm = document.getElementById('groupChatForm');
  const message = document.getElementById('message');
  const sendMessage = document.getElementById('sendMessage');

  const sendRequest = () => {
    const username = message.dataset.username;
    const data = {username: username, message: message.value};
    $.ajax({
      url: "group_chat/",
      type: 'POST',
      data: JSON.stringify(data),
      contentType: 'application/json',
    }).done(function(resp) {
     console.log('DONE!');
     message.value = ''
    }).fail(function(err) {
     console.log("Error", err);
    });
  };

  if(sendMessage){
    sendMessage.addEventListener('click', ev => {
      sendRequest();
    });
  };
})();
