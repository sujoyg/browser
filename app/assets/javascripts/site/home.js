function post() {
  $.ajax({
    url: 'http://api.keychain.cc/users/1/apps/1',
    type: 'PUT',
    data: {
      login: 'sujoyg@gmail.com',
      password: 'U2FsdGVkX1/9YW8OG7EyWt9pMpDjGeJ/7srHdc7K1Jc='
    },
    headers: {
      "X-HTTP-Method-Override": "PUT"
    },
    dataType: 'json',
    success: function (data) {
      console.info(data);
    }
  });
}

function init() {
  $('a.button').click(function () {
    post();

    return false;
  });
}

$(init);
