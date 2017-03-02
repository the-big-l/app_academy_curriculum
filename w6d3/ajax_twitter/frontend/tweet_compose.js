const APIUtil = require("./api_util.js");


class TweetCompose {
  constructor(body) {
    this.$form = $(body).find("form.tweet-compose");
    this.$submitButton = this.$form.find(':submit');
    this.$content = this.$form.find('textarea');
    this.$ul = $(body).find("#feed");
    this.$counter = this.$form.find('.chars-left');
    this.submitClick();
    this.countChars();
  }

  countChars() {
    window.setInterval(e => {
      let len = 140 - this.$content.val().length;
      this.$counter.text(len);
    }, 250);
  }

  submitClick() {
    this.$submitButton.click((e) => {
      e.preventDefault();

      this.submit();
      this.disableForm();
    });
  }

  disableForm() {
    this.$form.find(":input").prop("disabled", true);
  }

  submit() {
    const data = this.$form.serialize();

    APIUtil.createTweet(data)
      .then(res => this.handleSuccess(res));
  }

  render(res) {
    const content = res.content;
    const author = res.user.username;
    const date = res.created_at;
    const text = [content, author, date].join(' -- ');
    const $li = $('<li>').text(text);
    this.$ul.prepend($li);
  }

  clearInput() {
    this.$form.find('textarea').val('');
    this.$counter.text(140);
  }

  handleSuccess(res) {
    this.render(res);
    this.clearInput();
    this.$form.find(":input").prop("disabled", false);
  }
}

module.exports = TweetCompose;
