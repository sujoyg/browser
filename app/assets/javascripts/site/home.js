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

function github() {
  $.ajax({
    url: 'https://github.com',
    type: 'GET',
    headers: {
      Authorization: 'Basic c3Vqb3lnOmRlcmUxZmZlUw=='
    },
    async: false,
    success: function (data) {
      console.log('Successful.');
    }
  });
}

function init() {
  $('a.button').click(function (e) {
    e.preventDefault();

    post();

    return false;
  });

  $('a.github').click(function (e) {
    e.preventDefault();

    github();

    return false;
  });

  $('form').submit(function (e) {
    e.preventDefault();

    $('form').submit();

    return false;
  })
}

$(init);
