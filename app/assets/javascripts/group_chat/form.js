(() => {

  const chatForm = document.getElementById('groupChatForm');
  const message = document.getElementById('message');
  const sendMessage = document.getElementById('sendMessage');

  console.log(chatForm);

  const sendRequest = () => {
    const username = message.dataset.username;
    const data = {username: username, message: message.value};
    console.log('Send');
    $.ajax({
      url: "group_chat/",
      type: 'POST',
      data: JSON.stringify(data),
      contentType: 'application/json',
    }).done(function(resp) {
     alert('DONE!');
    }).fail(function(err) {
     console.log("Error", err);
    });
  };

  if(sendMessage){
    sendMessage.addEventListener('click', ev => {
      console.log('HERE')
      sendRequest();
    });
  };
})();

// window.clickSubmit = function() {
//   console.log('HERE');
  // return $.ajax({
  //   url: "expenses/" + id,
  //   type: 'DELETE'
  // }).done(function(resp) {
  //   var elem;
  //   elem = document.getElementById("tr_" + id);
  //   return elem.parentNode.removeChild(elem);
  // }).fail(function(err) {
  //   return console.log("Error", err);
  // });
// };
